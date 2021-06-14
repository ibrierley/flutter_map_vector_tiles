import 'dart:typed_data';
import 'dart:ui' as dartui;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'vector_tile.pb.dart' as vector_tile;
import 'filters.dart';
import 'styles.dart';
import 'package:flutter_map_vector_tile/VectorTileWidget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vector_math/vector_math_64.dart' as VectorMath hide Colors;
import 'dart:math' as DartMath;
import 'package:flutter/painting.dart';
//import 'package:geojson/geojson.dart';
import 'package:geojson_vi/geojson_vi.dart';

const RADTODEG = 57.2958;
const DEGTORAD = 0.0174533;

int decodeZigZag( int byte ) { /// decodes from mapbox small int style
  return ((byte >> 1) ^ -(byte & 1)).toInt();
}

String tileCoordsToKey(Coords coords) {
  return '${coords.x}:${coords.y}:${coords.z}';
}

enum GeomType {
  polygon,
  linestring,
  point
}

class GeomStore {
  List<Map<String, PathInfo>> pathStore = []; /// rename/rejig as not really paths as such...
  List<Label> labels = [];
  List<Offset> points = [];
  List<Map> roadList = [];
  GeomStore(this.pathStore, this.labels, this.points, this.roadList );
}

class PathInfo {
  dartui.Path path;
  String pclass = "default";
  String type = "default";
  String layerString = "default";
  int count = 0;
  Paint? style;
  Map featureInfo;

  PathInfo(this.path, this.pclass, this.type, this.layerString, this.featureInfo, this.count);
}

class PositionInfo {
  CustomPoint point;
  double width;
  double height;
  String coordsKey;
  double scale;
  PositionInfo({required this.point, required this.width, required this.height, required this.coordsKey, required this.scale});

}

class VTCache {
  Uint8List? units;
  String state;
  String coordsKey;
  double tileZoom;
  PositionInfo? positionInfo;
  GeomStore? geomInfo;
  dartui.Image? image;
  DateTime lastUsed;
  Map? geoJson;

  VTCache( this.units, this.state, this.coordsKey, this.tileZoom, this.geomInfo, this.lastUsed);
}

class Road {
  String text;
  String thisClass;
  Path path;

  Road(this.text, this.thisClass, this.path);
}

class Label {
  String text;
  String dedupeKey;
  String coordsKey;
  Offset point;
  Offset? transformedPoint;
  Offset? boundNW;
  Offset? boundSE;
  int boundNWx = 0; // trying ints for performance
  int boundNWy = 0;
  int boundSEx = 0;
  int boundSEy = 0;
  bool isRoad;
  bool keepUpright = true;
  double angle;
  int priority = 1; // 0-2 atm
  TextPainter textPainter;
  Label( {required this.text, required this.point, required this.textPainter,
    required this.dedupeKey, required this.priority, required this.coordsKey,  this.isRoad = false, this.angle = 0.0 } );
}

class TileStats {
  int labels = 0, paths = 0, polys = 0, points = 0, labelPoints = 0, polyPoints = 0, linePoints = 0;
  TileStats();
  void dump() { print("labels: ${this.labels}, paths: ${this.paths}, polys: ${this.polys}, labelPoints: ${this.labelPoints}, polyPoints ${this.polyPoints}, linePoints: ${this.linePoints}"); }
}



class MapboxTile {

  static void summaryAdd( key, map ) {
    map[ key ] = map.containsKey(key) ? map[ key ]++ : 1;
  }

  static void decode( coordsKey, VTCache cachedInfo, options, vectorStyle, tileZoom, DebugOptions debugOptions ) {

    print("DECODING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! $coordsKey");

    Map<GeomType,List> fullGeomMap = { GeomType.linestring: [], GeomType.polygon: [], GeomType.point:  []}; /// I don't know if we will want this..may be better to separate into roads, labels, paths etc...?
    Map<String, int> includeSummary = {};
    Map<String, int> excludeSummary = {};
    TileStats tileStats = new TileStats();
    cachedInfo.state = 'Decoding';
    late vector_tile.Tile vt;

    var units = cachedInfo.units;

    if(units != null)
      vt = vector_tile.Tile.fromBuffer(units);

    int reps = 0;

    Map<String, int> layerOrderMap = Styles.defaultLayerOrder();

    if(layerOrderMap.keys.length > 0) {

      vt.layers.sort((a, b) {
        return (layerOrderMap[ a.name ] ?? 15).compareTo(
            layerOrderMap[ b.name ] ?? 15);
      });
    }

    Map layerSummary = {};

    List labelPointlist = [];
    List<Road> roadLabelList = [];

    ///print("HERE");

    var layers = cachedInfo.geoJson ?? {};
    layers.forEach((layerString, features) {
    ///for(var layer in vt.layers) {
      ///
      ///print("POSTCODING $layerString");
      Map<String, PathInfo> pathMap = {};

      //Map<String, PathInfo> pathMap = {};  //path => path, class => class, type => type, layer => layer

      ///var layerString = layer.name.toString();

      if(layerSummary.containsKey(layerString)) {
        layerSummary[layerString]++;
      } else {
        layerSummary[layerString] = 0;
      }

      for (var feature in features) {
        ///print("FT $feature");
        var thisClass = feature['properties'].containsKey('class') ?
        feature['properties']['class'] : 'default';

        ///print("THIS CLASS IS $thisClass");
        ///var key = "L:$layerString>T:${}>C:$thisClass";
        var geom = feature['geometry'];
        var geomType = geom['type'];
        var coords = geom['coordinates'];

        var key = "L:$layerString>C:$thisClass";
        ///print("$key");
        if(geomType == 'POINT') {
          ///print("pointhere");
          List<Offset> pointsList = [];
          //for(var coords in geom['coordinates']) {
            ///print("coords $coords");
            pointsList.add(Offset(coords[0],coords[1]));
         // }
        } else if( geomType == "LINESTRING") {
          var path = dartui.Path();
          for(var coordsSet in geom['coordinates']) {
            //var subPath = dartui.Path();
            if(coordsSet.length > 0) {
              path.moveTo(coordsSet[0][0],coordsSet[0][1]);
              for(var index = 1; index < coordsSet.length; index++) {
                path.lineTo(coordsSet[index][0],coordsSet[index][1]);
              }
            }
            ///path.addPath(subPath,Offset(0,0));
          }
          //pathMap[key]?.path = path;
          ///print("POLY $path");
          //var key = "L:$layerString>C:$thisClass";
          //print("$key");
          if(!pathMap.containsKey(key)) {
            ///print("Creating new $key as not exists");
            pathMap[key] = PathInfo(path, thisClass, geomType, layerString, feature, 1 );
            var style = Styles.getStyle(vectorStyle, feature,
                layerString, geomType, tileZoom,
                2, 2);
            pathMap[key]?.style = style;
          } else {
            ///print("Adding path $key");
            pathMap[key]?.path.addPath(path, Offset(0, 0));
          }
          /// /////////////////////////cachedInfo.geomInfo?.pathStore.add(pathMap);
        } else if( geomType == "POLYGON") {
          var path = dartui.Path();
          for(var coordsSet in geom['coordinates']) {
            List<Offset> pointsList = [];
            //if(coordsSet.length > 0) {
              //var subPath = dartui.Path();
              ///print("Adding new points...");
              for(var index = 0; index < coordsSet.length; index++) {
                pointsList.add(Offset(coordsSet[index][0],coordsSet[index][1]));
              }
              //print("addin poly $key $pointsList");
            path.addPolygon(pointsList, true);
            //}

          }
          //pathMap[key]?.path = path;
          ///print("POLY $path");
          //var key = "L:$layerString>C:$thisClass";
          //print("$key");
          if(!pathMap.containsKey(key)) {
            ///print("Creating new $key as not exists");
            pathMap[key] = PathInfo(path, thisClass, geomType, layerString, feature, 1 );
            var style = Styles.getStyle(vectorStyle, feature,
                layerString, geomType, tileZoom,
                2, 2);
            pathMap[key]?.style = style;
          } else {
            ///print("Adding poly path $key");
            pathMap[key]?.path.addPath(path, Offset(0, 0));
          }
          /// ////////////////////////////////////////////cachedInfo.geomInfo?.pathStore.add(pathMap);
        }






        /// Note "type" is a bit confusing, as there seems to be a feature type eg "track",
        /// and a shape type eg "LINESTRING" when decoding

        //var includeFeature = Styles.includeFeature(vectorStyle, layerString, type, featureInfo, tileZoom);
        //var thisClass = featureInfo['class'] ?? 'default';

        //var key = "L:$layerString>T:$type>C:$thisClass";
        //var summaryKey = key + "|" + tileZoom.toString();

        /*
        if(includeFeature) {
          if(geomType == GeomType.point) item = point;
          if(geomType == GeomType.linestring || geomType == GeomType.polygon) item = path;

          if( debugOptions.features ) print("$geomType ${layer.name} $featureInfo $item");

          if(layer.name == 'road') {

            var name = featureInfo['ref'] ?? featureInfo['name'];
            if( name == null) name = "";

            if( path != null )
              roadLabelList.add( Road( name, featureInfo['class'], path ) );
          }

          if(fullGeomMap[geomType] != null)
            fullGeomMap[geomType]?.add([type, layer.name, featureInfo, item]); /// not sure if we need this fully yet....
        }

         */

        /*
        if (!options.containsKey('labelsOnly') && path != null) {
          if(includeFeature) {
            /// we're keeping layers separate, as we need to know which layers are "on top" of which others,
            /// otherwise water can end up on top of a road for example

            if(!pathMap.containsKey(key)) {
              pathMap[key] = PathInfo(dartui.Path(), thisClass, type, layerString, featureInfo, 1 );
            }

            pathMap[key]?.path.addPath(path, Offset(0, 0));
            pathMap[key]?.count++;
            tileStats.paths++;
            if( debugOptions.featureSummary ) summaryAdd(summaryKey, includeSummary);
          } else {
            if( debugOptions.featureSummary ) summaryAdd(summaryKey, excludeSummary);
          }
        }
        */


        //path = null;
      }

      pathMap.forEach((pathKey, pathInfo) {
        ///print("Final keys..$pathKey $pathInfo");
        cachedInfo.geomInfo?.pathStore.add(pathMap); ///need to explain the logic a bit more here...
      });


      //cachedInfo.geomInfo?.pathStore.add(pathMap);

    }); // layer


    if(!options.containsKey('noLabels')) {

      for(var pointInfo in labelPointlist) {
        var layerString = pointInfo[1];
        var featureInfo = pointInfo[2]; // redo this to a class ?

        var thisClass = pointInfo[2]['class'] ?? 'default';
        var includeFeature = Styles.includeFeature(vectorStyle, layerString, pointInfo[2]['type'], featureInfo, tileZoom);
        var summaryKey = "L:" + layerString + "_C:" + thisClass +"_Z:" + tileZoom.toString();

        if( includeFeature ) {
          var info = pointInfo[2]['name'];

          if (info != null) {

            /// feel like getNewPainter should be cached and set in the painter...
            /// also use better params for pointInfo and maybe a class..
            cachedInfo.geomInfo?.labels.add(
              Label( text: info.toString(), point: pointInfo[0],
                  textPainter: getNewPainter(info.toString()), dedupeKey: pointInfo[3],
                  priority: pointInfo[4], coordsKey: coordsKey ) );

          }
          tileStats.labels++;

          summaryAdd(summaryKey, includeSummary);
        } else {
          summaryAdd(summaryKey, excludeSummary);
        }
      }
    }

    if(!debugOptions.skipRoadLabels) {
      for (var road in roadLabelList) {

        var halfway;
        var metrics = road.path.computeMetrics();
        for( dartui.PathMetric metric in metrics) {
          /// get halfway point to display text at along along road
          halfway = metric.getTangentForOffset(metric.length / 2);

          if( metric.length < 100.0) { /// Make this into an option min pathsize for labels
            continue;
          }
        }

        if(halfway != null)
          cachedInfo.geomInfo?.labels.add(
              Label( text: road.text, point: halfway.position, textPainter: getNewPainter(road.text),
                  dedupeKey: road.text + '|' + coordsKey, priority: 2,
                  coordsKey: coordsKey, angle: halfway.angle, isRoad: true ) ); /// use named params and a class for pointInfo

      }
    }

    ///tileStats.dump();
    if( debugOptions.featureSummary ) {
      print("INCLUDES: $includeSummary");
      print("EXCLUDES $excludeSummary");
    }

    ///print("$fullGeomMap");
    cachedInfo.state = 'Decoded';
  }
}




class VectorPainter extends CustomPainter {

  final dimensions;
  final tilesToRender;
  final tileZoom;
  final Map<String, VTCache> cachedVectorDataMap;
  final underZoom;
  final usePerspective;
  final debugOptions;
  final rotation;
  final Optimisations optimisations;
  final useImages;
  final vectorStyle;
  final geoJson;

  static Map<String, Map<String, Label>> cachedLabelsPerTile = {};
  static DateTime timeSinceLastClean = DateTime.now();
  static Map<String, bool> prevTilesLoaded = {};
  static double prevTileZoom = 0.0;
  static List<Label> prevLabels = [];

  TextPainter cachedTextPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center);

  List<Map<String, bool>> layerDisplaySegments = Filters.layerDisplaySegments();

  VectorPainter(Offset this.dimensions, double this.rotation,
      List<VTile> this.tilesToRender, this.tileZoom,
      this.cachedVectorDataMap, this.underZoom, this.usePerspective,
      this.debugOptions, this.optimisations, this.useImages, this.vectorStyle, this.geoJson);

  @override
  void paint(Canvas canvas, Size size) {
    var rotatePerspective = -1.25; //-1.25; // only used if we're using perspective enabled
    var widgetRotation = this.rotation;
    var isRotated = false;
    if (widgetRotation != 0.0) isRotated = true;
    widgetRotation = widgetRotation % 360;

    var devicePerspectiveAngle = DartMath.atan2(size.width / 2, size.height) *
        57.2958;

    Map<String, Label> wantedLabels = {};
    List<Label> hiPriQueue = [];

    var pointPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    if (usePerspective) {
      var m = Matrix4.identity()
        ..rotateY(
            devicePerspectiveAngle * 0.0174) // device vanishing point offset
        ..setEntry(3, 2, 0.0015) // general distance perspective
        ..rotateX(rotatePerspective); // horizontal level angle change

      canvas.save();
      canvas.transform(m.storage);
    }

    Rect myRect = Offset(0,0) & Size(256.0,256.0);
    /// Normal paths
    for (var tile in tilesToRender) {
      String tileCoordsKey = tileCoordsToKey(tile.coords);
      PositionInfo? pos = cachedVectorDataMap[tileCoordsKey]?.positionInfo;

      if(useImages) {
        if ((pos != null) && (cachedVectorDataMap[tileCoordsKey]?.image != null)) {
          paintTile(canvas, pos, cachedVectorDataMap[tileCoordsKey]?.image);
        }
        continue;
      }



      Matrix4 matrix = Matrix4.identity();
      if(pos != null)
        matrix..translate(pos.point.x.toDouble(), pos.point.y.toDouble())
        ..scale(pos.scale);

      canvas.save();
      canvas.transform(matrix.storage);

      /// clip prevents the odd clashing artifact with overlapping tiles features

      canvas.clipRect(myRect);

      //if we need a clip that isn't already transformed, we can use below..
      //if( pos != null) {
      //  var adjustedSize = Offset(256.0, 256.0).scale(pos.scale, pos.scale);
      //  Rect myRect = Offset(pos.point.x.toDouble(), pos.point.y.toDouble()) & Size(adjustedSize.dx, adjustedSize.dy);
      //  canvas.clipRect(myRect);
      //}
      // var adjustedSize = Offset(256.0, 256.0).scale(pos['scale'], pos['scale']);

      // Rect myRect = Offset(pos['pos'].x, pos['pos'].y) & Size(adjustedSize.dx, adjustedSize.dy);
      // canvas.clipRect(myRect);

      List<Map<String, PathInfo>> dataMap = cachedVectorDataMap[tileCoordsKey]?.geomInfo?.pathStore ?? [];

      for (Map<String, PathInfo> layer in dataMap) {
        for (var layerKey in layer.keys) {
          /// we have a map for each layer, paths should be combined to same style/type
          PathInfo? pathMap = layer[layerKey];

          if (pathMap?.path != null) {
            // cache style if we can to save lookups, we may want to add
            // a method to reload new styles in though

            var style = pathMap?.style ?? Styles.getStyle(vectorStyle, pathMap?.featureInfo,
                pathMap?.layerString, pathMap?.type, tileZoom,
                pos?.scale, 2);

            /// if we've pinchzooming, use thin lines for speed
            var oldStrokeWidth = style.strokeWidth;
            if (optimisations.pinchZoom) style.strokeWidth = 0.0;

            if( pathMap != null) {
              ///canvas.drawPath(pathMap.path.transform(matrix.storage), style);
              canvas.drawPath(pathMap.path, style);
              style.strokeWidth = oldStrokeWidth;
            }
          }
        }
      }
      if (debugOptions.tiles) {
        _debugTiles(canvas, tile);
      }

      canvas.restore();
    }

    if (usePerspective) canvas.restore();

    /// End Normal Paths

    if (useImages) return;

    /// Start draw Labels

    /// Calculated transformed Label position and do collision detection
    /// to decide which to cull.
    /// All labels should come on top of paths etc, so moved loop out here
    ///
    for (var tile in tilesToRender) {
      String tileCoordsKey = tileCoordsToKey(tile.coords);
      PositionInfo? pos = cachedVectorDataMap[tileCoordsKey]?.positionInfo;

      if (cachedVectorDataMap[tileCoordsKey]?.state != 'Decoded') continue;

      Matrix4 matrix;
      if (!usePerspective) {
        matrix = Matrix4.identity();
        if( pos != null )
        matrix
          ..translate(pos.point.x.toDouble(), pos.point.y.toDouble())
          ..scale(pos.scale);
      } else {
        matrix = Matrix4.identity()
          ..rotateY(devicePerspectiveAngle * 0.0174)
          ..setEntry(3, 2, 0.0015) // perspective
          ..rotateX(rotatePerspective);

        // normal position
          if( pos != null )
            matrix..translate(pos.point.x.toDouble(), pos.point.y.toDouble())
              ..scale(pos.scale, pos.scale);
      }

      /// There's a slight issue as labels aren't reverse transformed to account for
      /// widget rotations. Gets fiddly, but we could probably sort if we care enough

      var labels =  cachedVectorDataMap[tileCoordsKey]?.geomInfo?.labels ?? [];
      for (Label label in labels) {
        label.transformedPoint =
            MatrixUtils.transformPoint(matrix, label.point);

        wantedLabels[label.dedupeKey] = label;

        _updateLabelBounding(label);
      }
    }
    /// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if(false && geoJson != null) {
      ///print("herexxxx $geoJson");
      var paths = geoJson['paths'];
      var paint = Paint();
      paint.color = Colors.green;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 3.0;
      if( paths != null) {
        print("Paths is $paths");
        for (var feature in paths) {
          print("Drawing feature");
          canvas.drawPath(feature, paint);
        }
      }
    }

    _orderLabelsAndDraw(
        wantedLabels, hiPriQueue, canvas, pointPaint, widgetRotation,
        isRotated);
  }

  void _drawTextAt(Offset position, Canvas canvas, scale, textPainter) {
    Offset drawPosition =
    Offset(position.dx - textPainter.width / 2,
        position.dy + (textPainter.height / 2));
    textPainter.paint(canvas, drawPosition);
  }

  void _orderLabelsAndDraw(wantedLabels, hiPriQueue, canvas, pointPaint,
      widgetRotation, isRotated) {

    ///print("Wanted ${wantedLabels.length}, Prev ${prevLabels.length}");
    var start = DateTime.now();

    Map qMap = {};
    for (var label in prevLabels) {
      if (wantedLabels.containsKey(label.dedupeKey)) {
        if (!checkLabelOverlaps(hiPriQueue, label)) {
          hiPriQueue.add(label);
          qMap[label.dedupeKey] = label;
        }
      }
    }

    List<List<Label>> priorityQ = [[],[],[]];
    for (var dedupeKey in wantedLabels.keys) {
      if (qMap.containsKey(dedupeKey)) {
        continue;
      }
      priorityQ[wantedLabels[dedupeKey].priority].add(wantedLabels[dedupeKey]);
    }

    var nextQ = [...priorityQ[0], ...priorityQ[1], ...priorityQ[2]];

    /*
    var p2 = DateTime.now().difference(start).inMicroseconds;

    nextQ.sort((a, b) {
      int cmp = a.priority.compareTo(b.priority);
      if (cmp != 0) return cmp;

      return a.dedupeKey.compareTo(b.dedupeKey);

      /// keep order consistent..
    });
    */
;

    var count = hiPriQueue.length;
    for (Label label in nextQ) {
      if ((count > 25 && tileZoom < 16) || checkLabelOverlaps(hiPriQueue, label)) {
        continue;
      }
      hiPriQueue.add(label);
      count++;
    }

    prevLabels = []; // reset our list of labels to carry over as hipri q
    Map<String, Label> justSeenLabels = {};


    for (Label label in hiPriQueue) {
      if (justSeenLabels.containsKey(label.dedupeKey)) continue;

      var tp = label.transformedPoint;

      if (!label.isRoad)
        if( tp != null )
          canvas.drawPoints(
            PointMode.points, [ tp ], pointPaint);

      _drawLabels(label, canvas, isRotated, widgetRotation);

      prevLabels.add(label);
      justSeenLabels[label.dedupeKey] = label;

      if (debugOptions.labels)
        print("Already seen ${label.text} ${label.dedupeKey} so skipping");
    }

    var end = DateTime.now().difference(start).inMilliseconds;;

    if (debugOptions.labels) {
      justSeenLabels.forEach((key, label) {
        debugRect(canvas, label);
      });
    }
  }

  void _drawLabels(Label label, Canvas canvas, bool isRotated,
      double widgetRotation) {
    var drawPoint = label.transformedPoint;

    /// if map rotated, we want to keep most non-road labels unrotated

    var transformedPoint = label.transformedPoint;
    if (label.isRoad) { // dont want to reverse rotate like normal labels

      drawPoint = Offset(0.0, -17.0);

      canvas.save();

      if(transformedPoint != null)
        canvas.translate(transformedPoint.dx, transformedPoint.dy); // text height offset back to center

      /// text can be upside down, try and prevent it
      double angleDeg = getNoneUpsideDownTextAngle(label, widgetRotation);

      canvas.rotate((angleDeg) * DEGTORAD);

      _drawTextAt(drawPoint, canvas, 1,
          label.textPainter); //
      canvas.restore();

    } else {

      if (isRotated) { // we need to realign the text so its upright
        drawPoint = Offset(0.0, 0.0);
        canvas
            .save(); // can we transform all first, as save is quite expensive...
        if( transformedPoint != null)
          canvas.translate(
            transformedPoint.dx, transformedPoint.dy);
        canvas.rotate(-widgetRotation * 0.0174533);
      }

      if( drawPoint != null)
        _drawTextAt(drawPoint, canvas, 1,
          label.textPainter); // we don't want to scale text

      if (isRotated) {
        canvas.restore();
      }
    }
  }

  void paintTile(canvas, pos, image) {
    paintImage(canvas: canvas,
        rect: Rect.fromLTWH(pos.point.x, pos.point.y, pos.width, pos.height),
        scale: pos.scale,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topLeft,
        filterQuality: FilterQuality.medium,
        isAntiAlias: false, // true will give unwanted visible tile edges
        image: image);
  }


  bool checkLabelOverlaps( List labelsToCheck, Label label  ) { // add fontsize (14) to the check...

    var collides = false;

    for( var compareLabel in labelsToCheck) {
      if( compareLabel != label) {
        if ((label.boundNWx < compareLabel.boundSEx) &&
            (label.boundSEx > compareLabel.boundNWx) &&
            (label.boundNWy < compareLabel.boundSEy) &&
            (label.boundSEy > compareLabel.boundNWy)) {

          collides = true;
          break; // skip the rest
        }
      }
    }

    return collides;
  }

  void _updateLabelBounding(Label label) {
    var widthFactor = 9.0; // how big as a ratio of text to size up
    var labelLength = label.text.length;
    var padding = 10.0;

    var tp = label.transformedPoint;
    if( tp != null ) {
      label.boundNWx =
          (tp.dx - (labelLength * widthFactor / 2) -
              padding).toInt();
      label.boundNWy =
          (tp.dy - (labelLength * widthFactor / 2) -
              padding).toInt();
      label.boundSEx =
          (label.boundNWx + (labelLength * widthFactor) + padding).toInt();
      label.boundSEy =
          (label.boundNWy + (labelLength * widthFactor) + padding).toInt();
    }

    // Original, but would now need to take into account rotated bounding boxes, so going for an easy option above of just making it square
    // We may want to try rotated boxes, but could be expensive

  }

  double getNoneUpsideDownTextAngle(Label label, double widgetRotation) {
    var angleDeg = -label.angle * RADTODEG;
    angleDeg += 90;

    if(angleDeg > 180) angleDeg -= 180;
    if(angleDeg < 0) angleDeg += 180;

    if(widgetRotation + angleDeg > 180 && (widgetRotation + angleDeg < 360)) {
      angleDeg -= 180;
    }

    angleDeg -= 90;

    return angleDeg;
  }

  void _debugTiles(Canvas canvas, VTile tile) {

    var paint = Paint()
      ..color = Colors.yellowAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(256.0, 0);
    path.lineTo(256.0, 256.0);
    path.lineTo(0, 256.0);
    path.close();

    canvas.drawPath(path, paint);

    TextStyle textStyle = TextStyle(
        color: Colors.yellow,
        fontSize: 14 //scale == 1 ? scale : 16 / scale, // diffratio, ?
    );
    TextSpan textSpan = TextSpan(
      text: tile.coords.toString(),
      style: textStyle,
    );

    var textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(minWidth: 0, maxWidth: double.infinity)
      ..text = textSpan;

    textPainter.paint(canvas, Offset(0.0,0.0));
  }

  void debugRect(canvas, Label label) {
    Path path = Path();

    var nwx = label.boundNWx.toDouble();
    var nwy = label.boundNWy.toDouble();
    var sex = label.boundSEx.toDouble();
    var sey = label.boundSEy.toDouble();

      path.moveTo(nwx, nwy);
      path.lineTo(sex, nwy);
      path.lineTo(sex, sey);
      path.lineTo(nwx, sey);

    path.close();

    var paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3.0;

    canvas.drawPath( path, paint);
  }

  @override
  bool shouldRepaint(VectorPainter oldDelegate) =>
      tilesToRender != oldDelegate.tilesToRender ||
          ///tileZoom != oldDelegate.tileZoom ||
          cachedVectorDataMap != oldDelegate.cachedVectorDataMap;
}

TextPainter getNewPainter(String text) {
  TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 14 //scale == 1 ? scale : 16 / scale, // diffratio, ?
  );
  TextSpan textSpan = TextSpan(
    text: text,
    style: textStyle,
  );

  return TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center)
    ..layout(minWidth: 0, maxWidth: double.infinity)
    ..text = textSpan;
}

