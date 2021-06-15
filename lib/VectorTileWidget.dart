import 'dart:async';
import 'dart:isolate';
import 'dart:math' as math;
import 'dart:ui' as dartui;
import 'dart:ui';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/src/core/bounds.dart';
import 'package:flutter_map/src/core/point.dart';
import 'package:flutter_map/src/map/map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tuple/tuple.dart';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart' as retry;
import 'vector_tile.pb.dart' as vector_tile;
import 'vector_tile_plugin.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_map_vector_tile/styles.dart';

import 'package:iso/iso.dart';
//import 'package:flutter_startup/flutter_startup.dart';
import 'package:flutter_isolate/flutter_isolate.dart';

Map decode( vectorStyle, coordsKey, bytes, options, tileZoom ) {

  Map<GeomType,List> fullGeomMap = { GeomType.linestring: [], GeomType.polygon: [], GeomType.point:  []}; /// I don't know if we will want this..may be better to separate into roads, labels, paths etc...?
  Map<String, int> includeSummary = {};
  Map<String, int> excludeSummary = {};
  TileStats tileStats = new TileStats();

  final Map decoded = {};

  ///print("Decoding");

  late vector_tile.Tile vt;

  if(bytes != null)
    vt = vector_tile.Tile.fromBuffer(bytes);

  ///print ("bytes $bytes");

  int reps = 0;

  Map<String, int> layerOrderMap = Styles.defaultLayerOrder();

  if(layerOrderMap.keys.length > 0) {

  vt.layers.sort((a, b) {
    return (layerOrderMap[ a.name ] ?? 15).compareTo(
      layerOrderMap[ b.name ] ?? 15);
    });
  }

  Map layerSummary = {};

  for(var layer in vt.layers) {

    var layerString = layer.name.toString();
   /// print("Doing $layerString");
    decoded[layerString] = [];

    if (layerSummary.containsKey(layerString)) {
      layerSummary[layerString]++;
    } else {
      layerSummary[layerString] = 0;
    }

    for (var feature in layer.features) {

      Map<String, dynamic> fullFeature = { 'type': "Feature" };
      var properties = {};
      var geometryInfo = {};

      var command = '';

      for (var tagIndex = 0; tagIndex < feature.tags.length; tagIndex += 2) {
        var valIndex = feature.tags[tagIndex + 1];
        var layerObj = layer.values[valIndex];
        var val;

        if (layerObj.hasIntValue()) {
          val = layerObj.intValue.toString();
        } else if (layerObj.hasStringValue()) {
          val = layerObj.stringValue;
        } else {
          val = layerObj.boolValue.toString();
        }

        properties[layer.keys[feature.tags[tagIndex]]] = val;
      }

      fullFeature['properties'] = properties;

      List coordinatesList = [];
      List coords = [];

      var type = feature.type.toString();
      geometryInfo['type'] = type;

      if (layerSummary.containsKey(type)) {
        layerSummary[type]++;
      } else {
        layerSummary[type] = 1;
      }

      var geometry = feature.geometry;

      var gIndex = 0;
      int cx = 0;
      int cy = 0;

      while (gIndex < geometry.length) {
        var commandByte = geometry[ gIndex ];

        if (reps == 0) {
          command = 'M';
          var checkCom = commandByte & 0x7;
          reps = commandByte >> 3;

          if (checkCom == 1) {
            command = 'M';
          } else if (checkCom == 2) {
            command = 'L';
          } else if (checkCom == 7) {
            command = 'C';
            reps = 0;
          } else {
            print("Shouldn't have got here, some command unknown");
          }

          gIndex++;
        } else {
          cx += decodeZigZag(geometry[ gIndex ]);
          cy += decodeZigZag(geometry[ gIndex + 1]);

          var ncx, ncy;
          if (command == 'M' || (command == 'L')) {
            ncx = (cx.toDouble() / 16); // Change /16 to a tileRatio passed in..
            ncy = (cy.toDouble() / 16);
          }

          var type = feature.type.toString();
          if (command == 'C') { // CLOSE
            if(coords.length != 0) {
              coordinatesList.add(coords);
            }
            coords = [];
          } else if (command == 'M') { // MOVETO
            if(coords.length != 0) coordinatesList.add(coords);
            coords = [[ncx,ncy]];
          } else if (command == 'L') { // LINETO
            coords.add([ncx,ncy]);
          } else {
            print("Incorrect command string");
          }

          gIndex += 2;
          reps--;
        }
      }

      if(coords.length != 0) coordinatesList.add(coords);
      coords = [];
      if(geometryInfo['type'] == "POINT") {
        geometryInfo['coordinates'] = coordinatesList[0][0];
      } else {
        geometryInfo['coordinates'] = coordinatesList;
      }
      fullFeature['geometry'] = geometryInfo;

      ///print(fullFeature);

      var subType = fullFeature['class']?['type'] ?? '';
      var includeFeature = Styles.includeFeature(vectorStyle, layerString, subType, fullFeature, tileZoom);

      if(includeFeature)
        decoded[layerString].add(fullFeature);
    }
  } // layer
  return decoded;
}


class Geo {
  Geo();

  Map process() {
    var json = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "geometry": {
            "type": "Point",
            "coordinates": [102.0, 0.5]
          },
          "properties": {
            "prop0": "value0"
          }
        },
        {
          "type": "Feature",
          "geometry": {
            "type": "LineString",
            "coordinates": [
              [102.0, 0.0], [103.0, 1.0], [104.0, 0.0], [105.0, 1.0]
            ]
          },
          "properties": {
            "prop0": "value0",
            "prop1": 0.0
          }
        },
        {
          "type": "Feature",
          "geometry": {
            "type": "Polygon",
            "coordinates": [
              [
                [100.0, 0.0], [101.0, 0.0], [101.0, 1.0],
                [100.0, 1.0], [100.0, 0.0]
              ]
            ]
          },
          "properties": {
            "prop0": "value0",
            "prop1": { "this": "that" }
          }
        }
      ]
    };

    var features;
    if( json.containsKey('type') && json['type'] == 'FeatureCollection') {
      features = json['features'];
    } else {
      features = [ json['feature'] ];
    }
    dartui.Path superPath = dartui.Path();
    List<dartui.Path> pathList = [];

    print("$json");
    print("$features");

    for( var feature in features) {
      print("have feature $feature");
      if( feature.containsKey('geometry') ) {
        print("Have geom");
        var geom = feature['geometry'];
        if( geom['type'] == "Polygon") {
          for (var ring in geom["coordinates"]) {
            print("Have ring $ring");
            List<Offset> pointsList = [];
            for (List coord in ring) { // need to handle multi rings
              pointsList.add(Offset(coord[0], coord[1]));
            }
            print("Here $pointsList");
            superPath.addPolygon(pointsList, true);
            pathList.add(dartui.Path()..addPolygon(pointsList, true));
          }
        }
      }
    }
    print("pathList $pathList");

    var geoList = {
      'paths': pathList,
      'superPath': superPath,
    };
    return geoList;

  }
}

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
                widget.debugOptions, widget.optimisations, widget.useImages, widget.vectorStyle, widget.geoJson ) )
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

  /// ///////////////////////////////////////////////////////////////////////////////////////////////////

  static isoRun (SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    var port = new ReceivePort();
    var count = 0;
    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);

    await for (var msg in port) {

      var data = msg[0];
      SendPort replyTo = msg[1];

      if( data is Map ) {
        if(data.containsKey('bytes')) {
          Map decodedTile = decode(Styles.mapBoxClassColorStyles, "somekey", data['bytes'], {}, data['tileZoom']);
          replyTo.send({ "DECODED": decodedTile });
        }
      }

      replyTo.send({ "wibble": "wobble", "dataxxx": data });
      if (data == "bar") port.close();
      count++;
    }
  }

  static Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
  /// https://www.jpryan.me/dartbyexample/examples/isolates/
  ///

  /// /////////////////////////////////////////////////////////////////////////////////
  static bool isoRunning = false;
  static late ReceivePort receivePort;
  static late SendPort sendPort;

  static Future<String> isoTest( tileMap ) async {

    var msg;
    if(!isoRunning) {
      isoRunning = true;
      receivePort = new ReceivePort();
      await FlutterIsolate.spawn(isoRun, receivePort.sendPort);
      sendPort = await receivePort.first;
      msg = await sendReceive(sendPort, "foo");
    }

    msg = await sendReceive(sendPort, tileMap);

    msg['DECODED'].forEach((key, features){
      //debugPrint("FEATURES... $key $features", wrapWidth: 1024);
    });
    _cachedVectorData[tileMap['coordsKey']]?.geoJson = msg['DECODED'];
    return tileMap['coordsKey'];
  }


  @override
  void initState() {

    super.initState();
    /// Experimental // ///////////////////////////////////////////////////////////////////
    ///geoJson = Geo().process();
    geoJson = {};

    vectorOptions = widget.vectorTileLayerOptions;
    optimisations = vectorOptions.optimisations ?? Optimisations();
    debugOptions = vectorOptions.debugOptions ?? DebugOptions();
    underZoom = vectorOptions.underZoom ?? 0;
    vectorStyle = vectorOptions.vectorStyle ?? Styles.mapBoxClassColorStyles;

    var mapController = vectorOptions.mapController;
    if( mapController != null ) {
      mapController.mapEventStream.listen((event) {

        /// hack to see if we can speed up pinchzooms...
        /// use hairline if middle of pinchzoom
        if( optimisations.pinchZoomOption) {
          if (event.source == MapEventSource.onMultiFinger &&
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

        if (
        vectorOptions.useBackupTiles &&
            (!_recentTilesCompleted.containsKey(coordsKey) ||
                debugBackupTiles)) {
          Coords backupCoords;

          /// If we've found backuptiles, we don't want to pursue any more
          var haveBackup = false;

          /// This works by expanding on a power of 2, eg tile 32,11 covers
          /// 64,22 & 65,22 & 64,23 & 65, 23 in one direction, and 16,10 in going
          /// backwards. So if we've recently completed it, there's a good chance
          /// it's a the cache.
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
      }
    }

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
             optimisations, vectorOptions.useImages, vectorStyle, geoJson  )
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
            /// /////////////////////////////////////////////////////
            await isoTest( { 'bytes': bytes, 'coordsKey' : coordsKey, 'tileZoom': _tileZoom} );

            if( !vectorOptions.useImages ) {
              if( cachedVectorData != null )
                cachedVectorData.units = bytes;

              if( cachedVectorData != null )
                MapboxTile.decode(
                  coordsKey, cachedVectorData, {}, vectorOptions.vectorStyle, _tileZoom,
                  debugOptions);

            } else {

              await decodeImageFromList(bytes).then(( image ){
                if( cachedVectorData != null )
                  cachedVectorData.image = image;
              });
            }

            _recentTilesCompleted[coordsKey] = DateTime.now();

            ///backup tiles uses these to know which it can use as a backup
            _outstandingTileLoads.remove(coordsKey);

            setState(() {});

          } catch (e) {
            print("$e");
          }
        });
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


    ///print("Tidying...${_recentTilesCompleted.keys.length}");
    ///print("VectorCache ${_cachedVectorData.keys.length}");
    ///_recentTilesCompleted.removeWhere((key, timeCompleted) => DateTime.now().difference(timeCompleted).inSeconds >= 2);

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
    DateTime.now().difference(timeCompleted).inMinutes >= 5);

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







