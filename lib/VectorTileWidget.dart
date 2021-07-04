import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/src/core/bounds.dart';
import 'package:flutter_map/src/core/point.dart';
import 'package:flutter_map/src/map/map.dart';
import 'package:flutter_map_vector_tile/parse_expressions.dart';
import 'package:latlong2/latlong.dart';
import 'package:tuple/tuple.dart';
import 'vector_tile_plugin.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_map_vector_tile/styles.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'dart:convert';
import 'decoding.dart';

class VectorWidget extends StatefulWidget {
  final rotation;
  final cachedVectorDataMap;
  final List<VTile> tilesToRender;
  final tileZoom;
  final underZoom;
  final usePerspective;
  DebugOptions debugOptions = DebugOptions();
  final optimisations;
  final useImages;
  final useCanvas;
  final highZoomCanvas;
  Map vectorStyle;
  Map geoJson;

  VectorWidget(
      this.rotation,
      this.cachedVectorDataMap,
      this.tilesToRender,
      this.tileZoom,
      this.underZoom,
      this.usePerspective,
      this.debugOptions,
      this.optimisations,
      this.useImages,
      this.useCanvas,
      this.highZoomCanvas,
      this.vectorStyle,
      this.geoJson,
      );

  @override
  State<StatefulWidget> createState() {
    vectorStyle = Styles.mapBoxClassColorStyles;
    return _VectorWidgetState();
  }
}

class _VectorWidgetState extends State<VectorWidget> {

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width * 2.0;
    final height = MediaQuery.of(context).size.height;
    final dimensions = Offset(width,height);

    final box = SizedBox(
        width: width*1.25, /// calculate this properly depending on rotation and mobile orientation
        height: height*1.25,
        child: RepaintBoundary (
          child: CustomPaint(
            isComplex: true, //Tells flutter to cache the painter.
            painter: VectorPainter( dimensions, widget.rotation, widget.tilesToRender, widget.tileZoom,
                widget.cachedVectorDataMap, widget.underZoom, widget.usePerspective,
                widget.debugOptions, widget.optimisations, widget.useImages, widget.useCanvas, widget.highZoomCanvas, widget.vectorStyle, widget.geoJson ) )
       )
    );

    return box;
  }

}

class VectorTilePlugin implements MapPlugin {

  @override
  Widget createLayer(
      LayerOptions options, MapState mapState, Stream<Null> stream) {

    if (options is VectorTileLayerPluginOptions) {
      return VectorTilePluginLayer(options, mapState, stream);
    }
    throw Exception('Unknown options type for Plugin: $options');
  }

  @override
  bool supportsLayer(LayerOptions options) {
    return options is VectorTileLayerPluginOptions;
  }
}

class VectorTilePluginLayer extends StatefulWidget {
  final VectorTileLayerPluginOptions vectorTileLayerOptions;
  final MapState mapState;
  final Stream<Null> stream;

  VectorTilePluginLayer(
      this.vectorTileLayerOptions,
      this.mapState,
      this.stream,
      ) : super(key: vectorTileLayerOptions.key);

  @override
  State<StatefulWidget> createState() {
    return _VectorTileLayerState();
  }
}

class _VectorTileLayerState extends State<VectorTilePluginLayer> with TickerProviderStateMixin {
  MapState get map => widget.mapState;

  VectorTileLayerPluginOptions vectorOptions = VectorTileLayerPluginOptions();
  Bounds? _globalTileRange;
  Tuple2<double, double>? _wrapX;
  Tuple2<double, double>? _wrapY;
  double _tileZoom = 12;
  VectorLevel _level = VectorLevel();
  StreamSubscription? _moveSub;
  late CustomPoint _tileSize;
  Map latestWantedCoordsKeys = {};

  ValueNotifier<int>? paintNotifier;

  final Map<double, VectorLevel> _levels = {};

  static Map<String, VTCache> _cachedVectorData = {};
  Timer? _housekeepingTimer;

  Map<String, DateTime> _outstandingTileLoads = {};
  Map<String, DateTime> _recentTilesCompleted = {};
  late Map vectorStyle;

  int _secondsBetweenListCleanups = 20;
  DateTime _lastTileListCleanupTime = DateTime.now();

  LatLng? _prevCenter;
  int underZoom = 0;
  late Optimisations optimisations;
  late DebugOptions debugOptions;

  late Map geoJson;

  static Future isolateRunCode (SendPort isolateToMainStream) async {

    ReceivePort mainToIsolateStream = new ReceivePort();
    isolateToMainStream.send(mainToIsolateStream.sendPort);

    mainToIsolateStream.listen((val) async {
      var data = val[0];
      if(data is Map) {
        if(data.containsKey('bytes')) {
          var start = DateTime.now();
          var decoded = await Decoding.decodeBytesToGeom(testStyle, data['coordsKey'], data['bytes'], {}, data['tileZoom']);
          var diff = DateTime.now().difference(start).inMilliseconds;
          print("decodebytesgeom took $diff millisecs");
          start = DateTime.now();
          var checkedLayers = Styles.getMatchedStyleLayers(decoded, testStyle,  data['tileZoom']);
          diff = DateTime.now().difference(start).inMilliseconds;
          print("stylematching took $diff millisecs");

          var encoded = json.encode(checkedLayers);
          Uint8List utf8encoded = Utf8Encoder().convert(encoded);

          try {
            await DefaultCacheManager().putFile(
                data['coordsKey'] + "_layers.json", utf8encoded,
                fileExtension: "json")
                .catchError((err) {
              print("error saving to file");
            });
            isolateToMainStream.send({
              "savedGeo": true,
              'coordsKey': data['coordsKey'],
              'tileZoom': data['tileZoom']
            });
          } catch (e) {
            print("There was an error with cachemanager pt2 $e");
          }

          if(data['useImages']) {
            start = DateTime.now();
            var imageByteData = await Decoding.pathsToImage(
                checkedLayers, testStyle, data['coordsKey'], {},
                data['tileZoom']);
            diff = DateTime.now().difference(start).inMilliseconds;
            print("save paths2image $diff");
            start = DateTime.now();

            try {
              await DefaultCacheManager().putFile(
                  data['coordsKey'] + "_image.png",
                  imageByteData.buffer.asUint8List(), fileExtension: "png")
                  .catchError((error) {
                print("Error saving file ${data['coordsKey']} $error");
              });
              isolateToMainStream.send({
                "savedImage": true,
                'coordsKey': data['coordsKey'],
                'tileZoom': data['tileZoom']
              });
            } catch (e) {
              print("There was an error from cachemanager pt3 $e");
            }
            diff = DateTime.now().difference(start).inMilliseconds;
            print("storing took $diff ms");
          }
        }
      }
    });

    isoRunning = 2;

  }

  /// https://www.jpryan.me/dartbyexample/examples/isolates/

  static int isoRunning = 0;
  static late SendPort sendPort;
  static late List<ReceivePort> isolateToMainStream = []; // = ReceivePort();
  static late List<SendPort> mainToIsolateStream = [];
  int lastIso = 0;
  int numIso = Platform.numberOfProcessors > 2 ? Platform.numberOfProcessors - 2 : 1;

  void storeCachedTileInfo( coordsKey, msg, vectorOptions, debugOptions ) async {

    var cache = _cachedVectorData[coordsKey];
    if(cache != null) {
      if(msg.containsKey('savedGeo')) {

        var json;
        try {
          await DefaultCacheManager().getFileFromCache(
              coordsKey + "_layers.json", ).then((file) async {

            var bytes = file!.file.readAsBytesSync();

            var utf8String  = Utf8Decoder().convert(bytes);
            json = jsonDecode(utf8String);

          }).catchError((err) {
            print("getfile error was $err");
          });
        } catch (e) {
          print("There was an error getting file from cache $e");
        }

        if(json != null)
          cache.geoJson = { 'layers': json };

        if(true || vectorOptions.useCanvas) { // we still need to get labels even if using tiles as bottom layer? does mean we dupe a bit of processing
          MapboxTile.decodeGeoToNative( null,
              coordsKey, _cachedVectorData[coordsKey]!, {}, vectorOptions.vectorStyle, msg['tileZoom'],
              debugOptions);
          _recentTilesCompleted[coordsKey] = DateTime.now();
          _outstandingTileLoads.remove(coordsKey);
        }
      }

      if(msg.containsKey('savedImage')) {
        if(vectorOptions.useImages) {
          try {
            await DefaultCacheManager().getFileFromCache(
                coordsKey + "_image.png").then((file) async {
              ui.Codec codec2 = await ui.instantiateImageCodec(
                  file!.file.readAsBytesSync());
              ui.FrameInfo frameInfo = await codec2.getNextFrame();
              cache.image = frameInfo.image;
              _recentTilesCompleted[coordsKey] = DateTime.now();
              _outstandingTileLoads.remove(coordsKey);
            });
          } catch (e) {
            print("There was an error getting file from cache pt 4 $e");
          }

        }
      if(msg.containsKey('imageByteData')) {
          // prob no longer needed now
          if(false && msg.containsKey('imageByteData')) {
            ui.Codec codec = await ui.instantiateImageCodec(
                msg['imageByteData'].buffer.asUint8List());
            ui.FrameInfo frameInfo = await codec.getNextFrame();
            cache.image = frameInfo.image;
            _recentTilesCompleted[coordsKey] = DateTime.now();
            _outstandingTileLoads.remove(coordsKey);
          }
        }
      }
    }
    msg = null;
  }

  Future<String> runInIsolate( tileMap, vectorOptions, debugOptions ) async {

    WidgetsFlutterBinding.ensureInitialized();

    if(isoRunning == 0) {
      for(var isolateCount=0; isolateCount < numIso; isolateCount++) {
          isoRunning = 1;
          var rp = ReceivePort();
          isolateToMainStream.add(rp);
          rp.listen((data) {
            if (data is SendPort) {
              mainToIsolateStream.add(data);
              isoRunning = 2;
            } else {
              if (data is Map) {
                if (data.containsKey('decodedLayers') ||
                    data.containsKey('imageByteData') || // may want to removed eventually...
                    data.containsKey('savedImage') ||
                    data.containsKey('savedGeo')
                ) {
                  storeCachedTileInfo(
                      data['coordsKey'], data, vectorOptions, debugOptions);
                }
              }
            }
          });
          FlutterIsolate.spawn(isolateRunCode, rp.sendPort);
      }
    }

    var waitTime = isoRunning < 2 ? 5 : 0;

    await Future.delayed(Duration(seconds: waitTime), () async {
      if(latestWantedCoordsKeys.containsKey(tileMap['coordsKey'])) {
        mainToIsolateStream[lastIso].send(
            [tileMap, isolateToMainStream[lastIso].sendPort]);
      }
    });

    lastIso++;
    if(lastIso >= mainToIsolateStream.length) {
      lastIso = 0;
    }

    return tileMap['coordsKey'];
  }


  @override
  void initState() {

    super.initState();
    geoJson = {};

    vectorOptions = widget.vectorTileLayerOptions;
    optimisations = vectorOptions.optimisations ?? Optimisations();
    debugOptions = vectorOptions.debugOptions ?? DebugOptions();
    underZoom = vectorOptions.underZoom ?? 0;
    vectorStyle = vectorOptions.vectorStyle ?? Styles.mapBoxClassColorStyles;

    var mapController = vectorOptions.mapController;

    mapController?.onReady.then((_) {
        mapController.mapEventStream.listen((event) {

          if (optimisations.pinchZoomOption) {
            if (event.source == MapEventSource.onMultiFinger &&
                (event is MapEventMoveStart)) {
              optimisations.pinchZoom = true;
            }
            if (event.source == MapEventSource.onDrag &&
                (event is MapEventMoveStart)) {
              optimisations.pinchZoom = true;
            }
            if (event.source == MapEventSource.multiFingerEnd ||
                event.source == MapEventSource.dragEnd) {
              optimisations.pinchZoom = false;
            }
          }
        });
      }
    );


    _tileSize = CustomPoint(vectorOptions.tileSize, vectorOptions.tileSize);
    _resetView();
    _moveSub = widget.stream.listen((_) => _handleMove());
    _housekeepingTimer = Timer.periodic(Duration(hours: 24), (Timer t) => _tidyOldTileListEntries());

  }

  @override
  void dispose() {
    super.dispose();
    _moveSub?.cancel();
    _housekeepingTimer?.cancel();
    vectorOptions.tileProvider.dispose();
  }

  void _handleMove() {
    setState(() {
      _resetView();
    });
  }

  void _resetView() {
    _setView(map.center, map.zoom);
  }

  void _setView(LatLng center, double zoom) {
    var tileZoom = _clampZoom(zoom.round().toDouble());
    if (_tileZoom != tileZoom) {
      _tileZoom = tileZoom;
      _updateLevels();
      _resetGrid();
    }

    _setZoomTransforms(center, zoom);
  }

  bool hasCompletedImage(coordsKey) {
    bool recentlyCompleted = false;
    if( _recentTilesCompleted.containsKey(coordsKey) &&
        _cachedVectorData.containsKey(coordsKey) &&
        _cachedVectorData[coordsKey]?.image != null ) {
      recentlyCompleted = true;
    }
    return recentlyCompleted;
  }

  bool hasCompletedGeo(coordsKey) {
    bool recentlyCompleted = false;
    if( _recentTilesCompleted.containsKey(coordsKey) &&
        _cachedVectorData.containsKey(coordsKey) &&
        _cachedVectorData[coordsKey]?.geoJson != null ) {
      recentlyCompleted = true;
    }
    return recentlyCompleted;
  }

  @override
  Widget build(BuildContext context) {

    var pixelBounds = _getTiledPixelBounds(map.center);
    var tileRange = _pxBoundsToTileRange(pixelBounds);
    var tileCenter = tileRange.center;
    var queue = <Coords>[];
    var _backupTiles = {};
    var _tiles = {};
    var _haveBackupTileMap = {};
    Map levelupCoordsMap = {};
    Map newWantedCoordsKeys = {};

    _tidyOldTileListEntries();

    /// Just a little bit of housekeeping we don't need to run too much
    /// to keep an eye on old tiles in a completed tile check
    if (DateTime.now().difference(_lastTileListCleanupTime) > /// prob dont need this now as we check every build
        Duration(seconds: _secondsBetweenListCleanups)) {
      _lastTileListCleanupTime = DateTime.now();
    }

    _setView(map.center, map.zoom);


    /// We try and preload some tiles if option set, so with panning there isn't such
    /// a delay in loading the next tile.

    int miny = (tileRange.min.y - 0).toInt(); // leaving these in there as was playing to adjust with extra tile loading
    int maxy = (tileRange.max.y + 0).toInt();
    int minx = (tileRange.min.x - 0).toInt();
    int maxx = (tileRange.max.x + 0).toInt();

    //debug single tile 110/342/510 (mapbox xy opposite to o.smaps)
    //minx=510;
    //maxx = 510;
    //miny = 342;
    //maxy=342;

    _prevCenter ??= map.center;

    for (var j = miny; j <= maxy; j++) {
      for (var i = minx; i <= maxx; i++) {
        var coords = Coords(i.toDouble(), j.toDouble());
        coords.z = _tileZoom;

        if (!_isValidTile(coords)) {
          print("invalid tile $coords, skipping");
          continue;
        }

        var coordsKey = _tileCoordsToKey(coords);
        var underZoomRatio = math.pow(2, underZoom);

        if (underZoom > 0) {
          var upCoord = Coords(
              (i / underZoomRatio).floorToDouble(),
              (j / underZoomRatio).floorToDouble());
          upCoord.z = _tileZoom - underZoom;

          coords = upCoord;
          coordsKey = _tileCoordsToKey(coords);
          if (!levelupCoordsMap.containsKey(coordsKey)) queue.add(upCoord);
          levelupCoordsMap[coordsKey] = true;
        } else {
          queue.add(coords);
        }

        /// If a tile is outstanding still, or has never been loaded recently
        /// We'll try and look for other tiles on levels above/below, depending
        /// on our expansion strategy. Example of backupTileExpansionStrategy
        /// would be [1,2,3,-1] which means if we are zoom 14, we'll check 13,
        /// then 12, 11, then 15.
        ///
        var debugBackupTiles = false;

        if ( ((vectorOptions.useImages && !hasCompletedImage(coordsKey)) ||
              (vectorOptions.useCanvas && !hasCompletedGeo(coordsKey))) &&
        (vectorOptions.useBackupTiles ||
            //(!_recentTilesCompleted.containsKey(coordsKey) ||
                debugBackupTiles)) {
          Coords backupCoords;

          /// If we've found backuptiles, we don't want to pursue any more
          var haveBackup = false;

          /// This works by expanding on a power of 2, eg tile 32,11 covers
          /// 64,22 & 65,22 & 64,23 & 65, 23 in one direction, and 16,10 in going
          /// backwards. So if we've recently completed it, there's a good chance
          /// it's a the cache.
          /// [1, 2, 3, -1, -2] [-1,-2,1,2], [1,-1,2,-2]
          [1, 2, 3, -1, -2].forEach((levelDifference) {
            var ratio = math.pow(2, levelDifference);

            /// If we need covering tiles from a higher zoom we may need
            /// several tiles to cover each 'larger' tile, extraTileFactor.
            if (!haveBackup) {
              var extraTileFactor = (1 / ratio).abs();

              for (var a = 0; a < extraTileFactor; a++) {
                for (var b = 0; b < extraTileFactor; b++) {
                  var backupZoom = coords.z - levelDifference;

                  if ((backupZoom > vectorOptions.maxZoom) ||
                      (backupZoom < 0)) {
                    continue;
                  }

                  backupCoords = Coords(
                      (i ~/ (ratio * underZoomRatio) + a).toDouble(),
                      (j ~/ (ratio * underZoomRatio) + b).toDouble());
                  backupCoords.z = backupZoom;


                  /// set backup zoom level to check what was in old completed map

                  var backupTileKey = _tileCoordsToKey(backupCoords);

                  /// want to check correct backupzoom level first...

                  /// It shouldn't end up both completed && outstanding, but it
                  /// could be possible if was in cache but not any more...
                  if (_recentTilesCompleted.containsKey(backupTileKey) &&
                      !_outstandingTileLoads.containsKey(backupTileKey) || (
                      _recentTilesCompleted.containsKey(backupTileKey) &&
                          (!vectorOptions.useImages && !vectorOptions.useCanvas)
                  )) {

                    /// careful here getting the different zoom level for the old key vs it needing a new zoom level to scale in new level...
                    ///backupCoords.z = coords.z; /// However, now we want to rewrite the z level so it will scale in current zoom, not old
                    _backupTiles[backupTileKey] =
                        VTile(backupCoords, false, backupCoords);

                    /// NOTE KEY MAY ODDLY NOT MATCH COORDS IF ITS A BACKUP TILE!
                    _haveBackupTileMap[coordsKey] = backupTileKey;

                    haveBackup = true;
                  }
                }
              }
            }
          });
        }
      //print("breaking");
      //break;
      }
    }

    if (queue.isNotEmpty) {
      for (var i = 0; i < queue.length; i++) {
        _tiles[_tileCoordsToKey(queue[i])] =
            VTile(_wrapCoords(queue[i]), true, null);
      }
    }

    var tilesToRender = <VTile>[];
    for (var tile in _tiles.values) {
      if ((tile.coords.z - _level.zoom).abs() <= 1 + math.pow(2, underZoom)) {
        if (!_cachedVectorData.containsKey(_tileCoordsToKey(tile.coords))) {
          fetchData(tile.coords);
        } else {
          tilesToRender.add(tile);
        }
        newWantedCoordsKeys[tileCoordsToKey(tile.coords)] = true;
      }
    }
    latestWantedCoordsKeys = newWantedCoordsKeys;

    tilesToRender.sort((aTile, bTile) {
      final a = aTile.coords; // TODO there was an implicit casting here.
      final b = bTile.coords;
      // a = 13, b = 12, b is less than a, the result should be positive ?
      if (a.z != b.z) {
        return (b.z - a.z).toInt();
      }
      return (a.distanceTo(tileCenter) - b.distanceTo(tileCenter)).toInt();
    });

    var backupTilesToRender = <VTile>[
      for (var tile in _backupTiles.values) tile
    ];

    var allTilesToRender = backupTilesToRender + tilesToRender;

    for (var tile in allTilesToRender) {
      var coordsKey = _tileCoordsToKey(tile.coords);
      _cachedVectorData[coordsKey]?.positionInfo = _createTilePositionInfo(tile); /// need to recreate backup tile info on diff zoom...
      _cachedVectorData[coordsKey]?.lastUsed = DateTime.now();
    }

    var vectorStyle = vectorOptions.vectorStyle ?? Styles.mapBoxClassColorStyles;

    return Container(
           color: Colors.blueGrey,
         child: VectorWidget(widget.mapState.rotation, _cachedVectorData, allTilesToRender, _tileZoom, underZoom,
             vectorOptions.usePerspective, vectorOptions.debugOptions ?? DebugOptions(),
             optimisations, vectorOptions.useImages, vectorOptions.useCanvas, vectorOptions.highZoomCanvas, vectorStyle, geoJson  )
     );
  }

  PositionInfo _createTilePositionInfo( tile ) {
    var coords = tile.coords;
    var tilePos = _getTilePos(coords);
    var level = _levels[coords.z];
    var tileSize = getTileSize();
    var scale = level?.scale ?? 1;
    var pos = (tilePos).multiplyBy(scale) + level!.translatePoint!;
    var width = (tileSize.x * scale);
    var height = tileSize.y * scale;
    var coordsKey = _tileCoordsToKey(coords);

    PositionInfo tilePositionInfo = PositionInfo(point: pos, width: width, height: height, coordsKey: coordsKey, scale: width / tileSize.x );

    return tilePositionInfo;

  }


  void fetchData(coords) async {

    if( coords.z <= 0 || coords.z > vectorOptions.maxZoom) {
      print("Level ${coords.z} too low/high, not grabbing tile");
      return null;
    }

    var url = vectorOptions.tileProvider.getTileUrl(
        coords, vectorOptions);

    var coordsKey = _tileCoordsToKey(coords);

    if (!_recentTilesCompleted.containsKey(coordsKey))
      _outstandingTileLoads[coordsKey] = DateTime.now();

    if(!_cachedVectorData.containsKey(coordsKey))  {
      List<Label> labelList = [];
      if(!_cachedVectorData.containsKey(coordsKey)) {
        _cachedVectorData[coordsKey] = VTCache( /// hmm this is a bit of a mess, needs some refactoring
          null, 'gettingHttp', coordsKey, _tileZoom, GeomStore([], labelList, [], []), DateTime.now()
        );

      }

      if (_cachedVectorData[coordsKey]?.state == 'gettingHttp') {

        DefaultCacheManager().getSingleFile(url).then( ( value ) async {
          var cachedVectorData = _cachedVectorData[coordsKey];

          try {
            _cachedVectorData[coordsKey]?.state = 'got';

            var bytes = value.readAsBytesSync();

            cachedVectorData?.units = bytes;
            runInIsolate( { 'bytes': bytes, 'coordsKey' : coordsKey,
              'tileZoom': _tileZoom, 'usePerspective': vectorOptions.usePerspective, 'useImages': vectorOptions.useImages }, vectorOptions, debugOptions );
          } catch (e) {
            print("$e");
          }
        }).onError((error, stackTrace) { print("Error getting $url with error: $error"); });
      }
    }

  }

  CustomPoint getTileSize() {
    return _tileSize;
  }

  void _updateLevels() {
    var zoom = _tileZoom;
    var maxZoom = vectorOptions.maxZoom;

    if (zoom == null) return null;

    for (var z in _levels.keys) {
      var levelZ = _levels[z];
      if(levelZ != null)
        if (levelZ.children.isNotEmpty || z == zoom) {
          var levelZi = _levels[z];
          if( levelZi != null)
            levelZi.zIndex = maxZoom = (zoom - z).abs();
      }
    }

    var max = vectorOptions.maxZoom + underZoom + 10;

    for(var tempZoom in [for(var i=1.0; i<max; i+=1.0) i]) {

      var level = _levels[tempZoom];
      var map = this.map;

      if (level == null) {

        level = _levels[tempZoom.toDouble()] = VectorLevel();
        level.zIndex = vectorOptions.maxZoom;
        var newOrigin = map.project(map.unproject(map.getPixelOrigin()), tempZoom);
        level.origin = newOrigin;
        level.zoom = tempZoom;
        _setZoomTransform(level, map.center, map.zoom);
      }

    }

    var levelZoom = _levels[zoom];
    if(levelZoom != null)
      _level = levelZoom;

  }

  void _setZoomTransform(VectorLevel level, LatLng center, double zoom) {
    var scale = map.getZoomScale(zoom, level.zoom);
    var pixelOrigin = map.getNewPixelOrigin(center, zoom).round();
    if (level.origin == null) {
      return;
    }
    var origin = level.origin;
    if( origin != null) {
      var translate = origin.multiplyBy(scale) - pixelOrigin;
      level.translatePoint = translate;
      level.scale = scale;
    }
  }

  void _setZoomTransforms(LatLng center, double zoom) {
    for (var i in _levels.keys) {
      var levelI = _levels[i];
      if(levelI != null)
        _setZoomTransform(levelI, center, zoom);
    }
  }

  void _resetGrid() {
    var map = this.map;
    var crs = map.options.crs;
    var tileSize = getTileSize();
    var tileZoom = _tileZoom;

    var bounds = map.getPixelWorldBounds(_tileZoom);

    if (bounds != null) {
      _globalTileRange = _pxBoundsToTileRange(bounds);
    }


    // wrapping
    try { _wrapX = crs.wrapLng; } catch (e) { print( "$e"); }

    _wrapX = crs.wrapLng;

    if (_wrapX != null) {


      var first =
      (map.project(LatLng(0.0, crs.wrapLng!.item1), tileZoom).x / tileSize.x)
          .floor()
          .toDouble();

      var second =
      (map.project(LatLng(0.0, crs.wrapLng!.item2), tileZoom).x / tileSize.y)
          .ceil()
          .toDouble();
      _wrapX = Tuple2(first, second);
    }


    _wrapY = crs.wrapLat;
    if (_wrapY != null) {
      var first =
      (map.project(LatLng(crs.wrapLat!.item1, 0.0), tileZoom).y / tileSize.x)
          .floor()
          .toDouble();
      var second =
      (map.project(LatLng(crs.wrapLat!.item2, 0.0), tileZoom).y / tileSize.y)
          .ceil()
          .toDouble();
      _wrapY = Tuple2(first, second);
    }

  }

  double _clampZoom(double zoom) {
    // todo
    return zoom;
  }


  Bounds _getTiledPixelBounds(LatLng center) {
    return getPixelBoundsFixed(map,_tileZoom);
  }

  Bounds _pxBoundsToTileRange(Bounds bounds) {
    var tileSize = getTileSize();

    return Bounds(
      bounds.min.unscaleBy(tileSize).floor(),
      bounds.max.unscaleBy(tileSize).ceil() - CustomPoint(1, 1),
    );
  }

  bool _isValidTile(Coords coords) {
    var crs = map.options.crs;
    if (!crs.infinite) {
      var bounds = _globalTileRange;
      if(bounds != null)
        if ((crs.wrapLng == null &&
          (coords.x < bounds.min.x || coords.x > bounds.max.x)) ||
          (crs.wrapLat == null &&
              (coords.y < bounds.min.y || coords.y > bounds.max.y))) {
        return false;
      }
    }
    return true;
  }

  String _tileCoordsToKey(Coords coords) {
    return '${coords.x}:${coords.y}:${coords.z}';
  }

  void _tidyOldTileListEntries() {


    var expiryTimeIfFullSeconds = 5;
    var keepTileCount = 500;
    var keepTileCountIfOld = 50;
    var keepTileCountMinutesIfOld = 60;
    Map markedForRemoval = {};

    List<String> sortedTileKeys = _cachedVectorData.keys.toList();
    sortedTileKeys.sort((a,b){
      var aLastUsed = _cachedVectorData[a]?.lastUsed ?? DateTime.now();
      var bLastUsed = _cachedVectorData[b]?.lastUsed ?? DateTime.now();
      return aLastUsed.compareTo(bLastUsed);
    });

    sortedTileKeys.forEach((tileKey) {
      var lastUsed = _cachedVectorData[tileKey]?.lastUsed ?? DateTime.now();
      if(((DateTime.now().difference(lastUsed).inSeconds >= expiryTimeIfFullSeconds) && (
          _cachedVectorData.length - markedForRemoval.length > keepTileCount
      )) || ((DateTime.now().difference(lastUsed).inMinutes >= keepTileCountMinutesIfOld) && (
          _cachedVectorData.length - markedForRemoval.length > keepTileCountIfOld
      ))) {
        markedForRemoval[tileKey] = true;
      }
    });

    _cachedVectorData.removeWhere((key,_) => markedForRemoval[key] == true);
    _recentTilesCompleted.removeWhere((key,_) => markedForRemoval[key] == true);


    /// We don't want to consider a tile outstanding forever, but it may vary
    /// We could tie it into some tileretry/timeout setting somewhere, but that
    /// may be quite tricky, so currently we'll suggest 1 day. It will get removed
    /// if the tile is tried another time and completed.
    _outstandingTileLoads.removeWhere((key, timeCompleted) =>
    DateTime.now().difference(timeCompleted).inMinutes >= 1);

    /// We only want to try and use our retries within a reasonable session
    /// So we'll assume people will be fine with a reset of our retries every
    /// day
    //_recentTilesCompleted.removeWhere((key, timeCompleted) =>
    //DateTime.now().difference(timeCompleted).inMinutes >= 1440);
  }

  Coords _wrapCoords(Coords coords) {
    var newCoords = Coords(
      _wrapX != null
          ? wrapNum(coords.x.toDouble(), _wrapX!)
          : coords.x.toDouble(),
      _wrapY != null
          ? wrapNum(coords.y.toDouble(), _wrapY!)
          : coords.y.toDouble(),
    );
    newCoords.z = coords.z.toDouble();
    return newCoords;
  }

  CustomPoint _getTilePos(Coords coords) {
    var level = _levels[coords.z];
    return coords.scaleBy(getTileSize()) - level!.origin!;
  }

  double wrapNum(double x, Tuple2<double, double> range, [bool? includeMax]) {
    var max = range.item2;
    var min = range.item1;
    var d = max - min;
    return x == max && includeMax != null ? x : ((x - min) % d + d) % d + min;
  }

  Bounds getPixelBoundsFixed(MapState map, double zoom) {
    var mapZoom = map.zoom;
    var scale = map.getZoomScale(mapZoom, zoom);
    var pixelCenter = map.project(map.center, zoom).floor();
    var halfSize = map.size / (scale * 2);
    return Bounds(pixelCenter - halfSize, pixelCenter + halfSize);
  }

}

class VectorTileLayerPluginOptions extends TileLayerOptions {
  /// Defines the structure to create the URLs for the tiles.
  ///
  /// Example:
  ///
  /// https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png
  ///
  /// Is translated to this:
  ///
  /// https://a.tile.openstreetmap.org/12/2177/1259.png
  final String? urlTemplate;

  /// If `true`, inverses Y axis numbering for tiles (turn this on for
  /// [TMS](https://en.wikipedia.org/wiki/Tile_Map_Service) services).
  final bool tms;

  /// If not `null`, then tiles will pull's WMS protocol requests
  final WMSTileLayerOptions? wmsOptions;

  /// Size for the tile.
  /// Default is 256
  final double tileSize;

  /// The max zoom applicable. In most tile providers goes from 0 to 19.
  final double maxZoom;

  final bool zoomReverse;
  final double zoomOffset;

  /// List of subdomains for the URL.
  ///
  /// Example:
  ///
  /// Subdomains = {a,b,c}
  ///
  /// and the URL is as follows:
  ///
  /// https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png
  ///
  /// then:
  ///
  /// https://a.tile.openstreetmap.org/{z}/{x}/{y}.png
  /// https://b.tile.openstreetmap.org/{z}/{x}/{y}.png
  /// https://c.tile.openstreetmap.org/{z}/{x}/{y}.png
  final List<String> subdomains;

  ///Color shown behind the tiles.
  final Color backgroundColor;

  ///Opacity of the rendered tile
  final double opacity;

  /// Provider to load the tiles. The default is CachedNetworkTileProvider,
  /// which loads tile images from network and caches them offline.
  ///
  /// If you don't want to cache the tiles, use NetworkTileProvider instead.
  ///
  /// In order to use images from the asset folder set this option to
  /// AssetTileProvider() Note that it requires the urlTemplate to target
  /// assets, for example:
  ///
  /// ```dart
  /// urlTemplate: "assets/map/anholt_osmbright/{z}/{x}/{y}.png",
  /// ```
  ///
  /// In order to use images from the filesystem set this option to
  /// FileTileProvider() Note that it requires the urlTemplate to target the
  /// file system, for example:
  ///
  /// ```dart
  /// urlTemplate: "/storage/emulated/0/tiles/some_place/{z}/{x}/{y}.png",
  /// ```
  ///
  /// Furthermore you create your custom implementation by subclassing
  /// TileProvider
  ///
  final TileProvider tileProvider;

  /// Deprecated, as we try and work on a system having some sort of
  /// caching anyway now.
  /// When panning the map, keep this many rows and columns of tiles before
  /// unloading them.
  /// final int keepBuffer;
  /// Placeholder to show until tile images are fetched by the provider.
  ImageProvider? placeholderImage;

  /// Static informations that should replace placeholders in the [urlTemplate].
  /// Applying API keys is a good example on how to use this parameter.
  ///
  /// Example:
  ///
  /// ```dart
  ///
  /// TileLayerOptions(
  ///     urlTemplate: "https://api.tiles.mapbox.com/v4/"
  ///                  "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
  ///     additionalOptions: {
  ///         'accessToken': '<PUT_ACCESS_TOKEN_HERE>',
  ///          'id': 'mapbox.streets',
  ///     },
  /// ),
  /// ```
  ///
  Map<String, String> additionalOptions;

  /// A List of relative zoom in/out order that we try. Example [1,2,3,-1,-2]
  /// Try 3 levels of old larger tiles, then 2 levels of old smaller ones
  List backupTileExpansionStrategy;

  bool useImages;
  bool useCanvas;
  double highZoomCanvas;
  bool useBackupTiles;
  bool usePerspective;
  DebugOptions? debugOptions;
  Map? vectorStyle;
  int? underZoom;
  MapController? mapController;
  Optimisations? optimisations;

  VectorTileLayerPluginOptions({
    this.urlTemplate,
    this.tileSize = 256.0,
    this.maxZoom = 25.0,
    this.zoomReverse = false,
    this.zoomOffset = 0.0,
    this.additionalOptions = const <String, String>{},
    this.subdomains = const <String>[],
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.placeholderImage,
    this.tileProvider = const NonCachingNetworkTileProvider(),
    this.tms = false,
    this.wmsOptions,
    this.opacity = 1.0,
    this.backupTileExpansionStrategy = const [1, 2, 3, -1, -2],
    this.useImages = true,
    this.useCanvas = true,
    this.useBackupTiles = true,
    this.usePerspective = false,
    this.highZoomCanvas = 16.0,
    this.debugOptions,
    this.vectorStyle,
    this.underZoom,
    this.mapController,
    this.optimisations,
    rebuild,
  })  :
        super(rebuild: rebuild);
}

class VectorLevel {
  List children = [];
  double? zIndex;
  CustomPoint? origin;
  double? zoom;
  CustomPoint? translatePoint;
  double? scale;
}

class VTile {
  final Coords coords;
  bool current;
  final backupCoords;

  VTile(this.coords, this.current, this.backupCoords);
}

class Optimisations {
  bool pinchZoom;
  bool pinchZoomOption;
  bool hairline;
  bool hairlineOption;

  Optimisations( { this.pinchZoom = false, this.pinchZoomOption = false, this.hairline = false, this.hairlineOption = false });
}

class DebugOptions {
  bool tiles;
  bool labels;
  bool decoding;
  bool featureSummary;
  bool features;
  bool roads;
  bool skipRoadLabels;
  bool missingFeatures;

  DebugOptions({ this.tiles = false, this.labels = false, this.decoding = false,
    this.featureSummary = false, this.features = false, this.roads = false,
    this.skipRoadLabels = true, this.missingFeatures = false });
}







