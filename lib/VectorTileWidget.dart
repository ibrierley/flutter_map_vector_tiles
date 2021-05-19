import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as dartui;
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

class VectorWidget extends StatefulWidget {
  final rotation;
  final cachedVectorDataMap;
  final List<VTile> tilesToRender;
  final tileZoom;
  final underZoom;
  final usePerspective;
  final debugOptions;
  final optimisations;

  VectorWidget(
      this.rotation,
      this.cachedVectorDataMap,
      this.tilesToRender,
      this.tileZoom,
      this.underZoom,
      this.usePerspective,
      this.debugOptions,
      this.optimisations,
      );

  @override
  State<StatefulWidget> createState() {
    return _VectorWidgetState();
  }
}

class _VectorWidgetState extends State<VectorWidget> {

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width * 2.0;
    var height = MediaQuery.of(context).size.height;
    var dimensions = Offset(width,height);

    var box = SizedBox(
        width: width*1.25,
        height: height*1.25,
        child: RepaintBoundary (
          child: CustomPaint(
            isComplex: true, //Tells flutter to cache the painter.
            painter: VectorPainter( dimensions, widget.rotation, widget.tilesToRender, widget.tileZoom,
                widget.cachedVectorDataMap, widget.underZoom, widget.usePerspective,
                widget.debugOptions, widget.optimisations ) )
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

  VectorTileLayerPluginOptions vectorOptions;
  Bounds _globalTileRange;
  Tuple2<double, double> _wrapX;
  Tuple2<double, double> _wrapY;
  double _tileZoom;
  VectorLevel _level;
  StreamSubscription _moveSub;
  CustomPoint _tileSize;

  ValueNotifier<int> paintNotifier;

  final Map<double, VectorLevel> _levels = {};

  Map<String, VTCache>_cachedVectorData = {};
  Timer _housekeepingTimer;

  Map<String, DateTime> _outstandingTileLoads = {};
  Map<String, DateTime> _recentTilesCompleted = {};
  Map vectorStyle;

  int _secondsBetweenListCleanups = 20;
  DateTime _lastTileListCleanupTime = DateTime.now();

  LatLng _prevCenter;
  int underZoom;
  Optimisations optimisations;
  DebugOptions debugOptions;

  @override
  void initState() {
    vectorOptions = widget.vectorTileLayerOptions;
    optimisations = vectorOptions.optimisations;
    debugOptions = vectorOptions.debugOptions;
    underZoom = vectorOptions.underZoom;
    vectorStyle = vectorOptions.vectorStyle;

    if( vectorOptions.mapController != null ) {
      ///print("have a map controller");
      vectorOptions.mapController.mapEventStream.listen((event) {
        ///print("Map event $event ${ event.zoom } ${event.source } ");

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

    super.initState();
    _tileSize = CustomPoint(vectorOptions.tileSize, vectorOptions.tileSize);
    _resetView();
    _moveSub = widget.stream.listen((_) => _handleMove());
    _housekeepingTimer = Timer.periodic(Duration(hours: 24), (Timer t) => _tidyOldTileListEntries());

  }

  @override
  void dispose() {
    super.dispose();
    _moveSub?.cancel();
    _housekeepingTimer.cancel();
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
    var tileCenter = tileRange.getCenter();
    var queue = <Coords>[];
    var _backupTiles = {};
    var _tiles = {};
    var _haveBackupTileMap = {};
    Map levelupCoordsMap = {};

    /// Just a little bit of housekeeping we don't need to run too much
    /// to keep an eye on old tiles in a completed tile check
    if (DateTime.now().difference(_lastTileListCleanupTime) >
        Duration(seconds: _secondsBetweenListCleanups)) {
      _lastTileListCleanupTime = DateTime.now();
    }

    _setView(map.center, map.zoom);


    /// We try and preload some tiles if option set, so with panning there isn't such
    /// a delay in loading the next tile.

    int miny = tileRange.min.y - 0; // leaving these in there as was playing to adjust with extra tile loading
    int maxy = tileRange.max.y + 0;
    int minx = tileRange.min.x - 0;
    int maxx = tileRange.max.x + 0;


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
                        VTile(backupCoords, _tileZoom, false, backupCoords);

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
            VTile(_wrapCoords(queue[i]), null, true, null);
      }
    }

    var tilesToRender = <VTile>[];
    for (var tile in _tiles.values) {
      if ((_level != null) && (tile.coords.z - _level.zoom).abs() <= 1 + math.pow(2, underZoom)) {
        if (!_cachedVectorData.containsKey(_tileCoordsToKey(tile.coords))) {
          if ( debugOptions.decoding) print("Calling fechData for ${tile.coords} ");
          fetchData(tile.coords, 1);
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
      _cachedVectorData[_tileCoordsToKey(tile.coords)].positionInfo = _createTilePositionInfo(tile); /// need to recreate backup tile info on diff zoom...
    }


    return Container(
           color: Colors.blueGrey,
         child: VectorWidget(widget.mapState.rotation, _cachedVectorData, allTilesToRender, _tileZoom, underZoom,
             vectorOptions.usePerspective, vectorOptions.debugOptions,
             optimisations  )
     );
  }

  PositionInfo _createTilePositionInfo( tile ) {
    var coords = tile.coords;
    var tilePos = _getTilePos(coords);
    var level = _levels[coords.z];
    var tileSize = getTileSize();
    var pos = (tilePos).multiplyBy(level.scale) + level.translatePoint;
    var width = tileSize.x * level.scale;
    var height = tileSize.y * level.scale;
    var coordsKey = _tileCoordsToKey(coords);

    PositionInfo tilePositionInfo = PositionInfo(point: pos, width: width, height: height, coordsKey: coordsKey, scale: width / tileSize.x );

    return tilePositionInfo;

  }


  void fetchData(coords, method) async {

    if( coords.z <= 0) {
      print("Level ${coords.z} too low, not grabbing tile");
      return null;
    }

    var url = vectorOptions.tileProvider.getTileUrl(
        coords, vectorOptions);

    var coordsKey = _tileCoordsToKey(coords);

    if (!_recentTilesCompleted.containsKey(coordsKey))
      _outstandingTileLoads[coordsKey] = DateTime.now();

    if(_cachedVectorData.containsKey(coordsKey)) {
      if(_cachedVectorData[coordsKey].state == 'trying') { /// Not convinced state does anything really...
        print("Still trying...returning");
        return null;
      }

    } else {
      List<Label> labelList = [];
      if(!_cachedVectorData.containsKey(coordsKey)) {
        _cachedVectorData[coordsKey] = VTCache( /// hmm this is a bit of a mess, needs some refactoring
          null, 'gettingHttp', coordsKey, _tileZoom, PositionInfo(),  GeomStore([], labelList, [], [])
        );

      }

      if (_cachedVectorData[coordsKey].state == 'gettingHttp') {

        DefaultCacheManager().getSingleFile(url).then( ( value ) async {

            _cachedVectorData[coordsKey].units = value.readAsBytesSync();
            /// move this to a catchError maybe, not sure it will do anything here now ?
            /// does it just fail or return null...
            if( _cachedVectorData[coordsKey].units == null ) {
              print("Not in cache so doing an http retry");
              var response = await retry.RetryClient(http.Client()).get(Uri.parse(url));
              _cachedVectorData[coordsKey].units = response.body.codeUnits;
            } else {
              if( debugOptions.decoding) {
                print("Got $coordsKey via DefaultCacheManager");
              }
            }

            try {
            _cachedVectorData[coordsKey].state = 'got';

            MapboxTile.decode(coordsKey, _cachedVectorData[coordsKey], {}, {}, _tileZoom, debugOptions);

            _recentTilesCompleted[coordsKey] = DateTime.now(); ///backup tiles uses these to know which it can use as a backup
            _outstandingTileLoads.remove(coordsKey);

            if( debugOptions.decoding ) print("decoded $coordsKey}");

            setState(() {

            });

            } catch (e) {
              print("$e");
            }

        } );
      }
    }

  }

  /// ////////////// END MAIN NEW VECTOR CODE ///////////////////////////////////

  CustomPoint getTileSize() {
    return _tileSize;
  }

  void _updateLevels() {
    var zoom = _tileZoom;
    var maxZoom = vectorOptions.maxZoom;

    if (zoom == null) return null;

    for (var z in _levels.keys) {
      if (_levels[z].children.isNotEmpty || z == zoom) {
        _levels[z].zIndex = maxZoom = (zoom - z).abs();
      }
    }

    var max = vectorOptions.maxZoom + underZoom;

    for(var tempZoom in [for(var i=1.0; i<max; i+=1.0) i]) {

      var level = _levels[tempZoom];
      var map = this.map;

      if (level == null) {

        level = _levels[tempZoom.toDouble()] = VectorLevel();
        level.zIndex = vectorOptions.maxZoom;
        var newOrigin = map.project(map.unproject(map.getPixelOrigin()), tempZoom);
        if (newOrigin != null) {
          level.origin = newOrigin;
        } else {
          level.origin = CustomPoint(0.0, 0.0);
        }
        level.zoom = tempZoom;
        _setZoomTransform(level, map.center, map.zoom);
      }

    }

    _level = _levels[zoom];

  }

  void _setZoomTransform(VectorLevel level, LatLng center, double zoom) {
    var scale = map.getZoomScale(zoom, level.zoom);
    var pixelOrigin = map.getNewPixelOrigin(center, zoom).round();
    if (level.origin == null) {
      return;
    }
    var translate = level.origin.multiplyBy(scale) - pixelOrigin;
    level.translatePoint = translate;
    level.scale = scale;
  }

  void _setZoomTransforms(LatLng center, double zoom) {
    for (var i in _levels.keys) {
      _setZoomTransform(_levels[i], center, zoom);
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
      (map.project(LatLng(0.0, crs.wrapLng.item1), tileZoom).x / tileSize.x)
          .floor()
          .toDouble();

      var second =
      (map.project(LatLng(0.0, crs.wrapLng.item2), tileZoom).x / tileSize.y)
          .ceil()
          .toDouble();
      _wrapX = Tuple2(first, second);
    }


    _wrapY = crs.wrapLat;
    if (_wrapY != null) {
      var first =
      (map.project(LatLng(crs.wrapLat.item1, 0.0), tileZoom).y / tileSize.x)
          .floor()
          .toDouble();
      var second =
      (map.project(LatLng(crs.wrapLat.item2, 0.0), tileZoom).y / tileSize.y)
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

    /// We don't want to consider a tile outstanding forever, but it may vary
    /// We could tie it into some tileretry/timeout setting somewhere, but that
    /// may be quite tricky, so currently we'll suggest 1 day. It will get removed
    /// if the tile is tried another time and completed.
    _outstandingTileLoads.removeWhere((key, timeCompleted) =>
    DateTime.now().difference(timeCompleted).inMinutes >= 1440);

    /// We only want to try and use our retries within a reasonable session
    /// So we'll assume people will be fine with a reset of our retries every
    /// day
    _recentTilesCompleted.removeWhere((key, timeCompleted) =>
    DateTime.now().difference(timeCompleted).inMinutes >= 1440);
  }

  Coords _wrapCoords(Coords coords) {
    var newCoords = Coords(
      _wrapX != null
          ? wrapNum(coords.x.toDouble(), _wrapX)
          : coords.x.toDouble(),
      _wrapY != null
          ? wrapNum(coords.y.toDouble(), _wrapY)
          : coords.y.toDouble(),
    );
    newCoords.z = coords.z.toDouble();
    return newCoords;
  }

  CustomPoint _getTilePos(Coords coords) {
    var level = _levels[coords.z];
    return coords.scaleBy(getTileSize()) - level.origin;
  }

  double wrapNum(double x, Tuple2<double, double> range, [bool includeMax]) {
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
  final String urlTemplate;

  /// If `true`, inverses Y axis numbering for tiles (turn this on for
  /// [TMS](https://en.wikipedia.org/wiki/Tile_Map_Service) services).
  final bool tms;

  /// If not `null`, then tiles will pull's WMS protocol requests
  final WMSTileLayerOptions wmsOptions;

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
  ImageProvider placeholderImage;

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
  DebugOptions debugOptions;
  Map vectorStyle;
  int underZoom;
  MapController mapController;
  Optimisations optimisations;

  VectorTileLayerPluginOptions({
    this.urlTemplate,
    this.tileSize = 256.0,
    this.maxZoom = 18.0,
    this.zoomReverse = false,
    this.zoomOffset = 0.0,
    this.additionalOptions = const <String, String>{},
    this.subdomains = const <String>[],
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.placeholderImage,
    this.tileProvider = const NonCachingNetworkTileProvider(),
    this.tms = false,
    this.wmsOptions = null,
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
  double zIndex;
  CustomPoint origin;
  double zoom;
  CustomPoint translatePoint;
  double scale;
}

class VTile {
  final Coords coords;
  final double displayedZ;
  bool current;
  final backupCoords;

  VTile(this.coords, this.displayedZ, this.current, this.backupCoords);
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

  DebugOptions({ this.tiles = false, this.labels = false, this.decoding = false, this.featureSummary = false, this.features = false, this.roads = false, this.skipRoadLabels = true });
}







