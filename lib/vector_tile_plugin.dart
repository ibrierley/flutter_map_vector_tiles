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
  String pclass;
  String type;
  String layerString;
  int count;
  Paint? style;

  PathInfo(this.path, this.pclass, this.type, this.layerString, this.count);
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

  VTCache( this.units, this.state, this.coordsKey, this.tileZoom, this.geomInfo);
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
  int priority = 3;
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

  static void decode( coordsKey, VTCache cachedInfo, options, vectorStyles, tileZoom, DebugOptions debugOptions ) {

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

    for(var layer in vt.layers) {

      Map<String, PathInfo> pathMap = {};  //path => path, class => class, type => type, layer => layer

      var layerString = layer.name.toString();

      if(layerSummary.containsKey(layerString)) {
        layerSummary[layerString]++;
      } else {
        layerSummary[layerString] = 0;
      }

      var command = '';

      dartui.Path? path;
      List<Offset> pointList = [];

      for (var feature in layer.features) {

        var featureInfo = {};
        var item; // path or point
        var point;

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

          featureInfo[layer.keys[feature.tags[tagIndex]]] = val;
        }


        List<Offset> polyPoints = [];

        var type = feature.type.toString();
        GeomType geomType = GeomType.linestring;

        if(layerSummary.containsKey(type)) {
          layerSummary[type]++;
        } else {
          layerSummary[type] = 1;
        }

        var geometry = feature.geometry;

        var gIndex = 0;
        int cx = 0; int cy = 0;

        while(gIndex < geometry.length) {
          var commandByte = geometry[ gIndex ];

          if(reps == 0) {
            command = 'M';
            var checkCom = commandByte & 0x7;
            reps = commandByte >> 3;
            if(checkCom == 1) {
              command = 'M';
            } else if (checkCom == 2) {
              command = 'L';
            } else if (checkCom == 7) {
              command = 'C';
              reps = 0;

              if (feature.type.toString() == 'POLYGON') {
                if (path == null) path = dartui.Path();
                path.addPolygon(polyPoints, true);
                tileStats.polys++;
                polyPoints = [];
                geomType = GeomType.polygon;
              } else {
                path?.close();
              }

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

            } else if (command == 'M') { // MOVETO
              if (type == 'POLYGON') {
                polyPoints = [];
                polyPoints.add(Offset(ncx, ncy));
                tileStats.polyPoints++;
                geomType = GeomType.polygon;

              } else if (type == 'LINESTRING') {
                if (path == null) path = dartui.Path();
                path.moveTo(ncx, ncy);
                geomType = GeomType.linestring;

              } else if (type == 'POINT') {

                point = Offset(ncx, ncy);
                pointList.add(point);

                var dedupeKey = featureInfo['name'] ?? point.toString();
                dedupeKey += '_' + coordsKey;
                var priority = 1; // 1 is best priority

                /// We want a poi or a shop label to appear rather than a housenum if poss
                if(layer.name == "housenum_label") {
                  featureInfo['name'] = featureInfo['house_num'];
                  dedupeKey = "${featureInfo['name']}|$point";
                  priority = 9;
                }

                labelPointlist.add([ point, layer.name, featureInfo, dedupeKey, priority ]);  /// May want to add a style here, to draw last thing..., move into a class

                tileStats.points++;
                tileStats.labelPoints++;
                geomType = GeomType.point;

              }

            } else if (command == 'L') { // LINETO

              if (type == 'POLYGON') {
                polyPoints.add(Offset(ncx, ncy));
                tileStats.polyPoints++;
                geomType = GeomType.polygon;
              } else if (type == 'LINESTRING') {

                path?.lineTo(ncx, ncy);
                tileStats.linePoints++;
                geomType = GeomType.linestring;
              }
            } else {
              print("Incorrect command string");
            }

            gIndex += 2;
            reps--;
          }
        }

        /// Note "type" is a bit confusing, as there seems to be a feature type eg "track",
        /// and a shape type eg "LINESTRING" when decoding

        var includeFeature = Styles.includeFeature(layerString, type, featureInfo['class'], tileZoom);
        var thisClass = featureInfo['class'] ?? 'default';

        var key = "L:$layerString>T:$type>C:$thisClass";
        var summaryKey = key + "|" + tileZoom.toString();

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

        if (!options.containsKey('labelsOnly') && path != null) {
          if(includeFeature) {
            /// we're keeping layers separate, as we need to know which layers are "on top" of which others,
            /// otherwise water can end up on top of a road for example

            if(!pathMap.containsKey(key)) {
              pathMap[key] = PathInfo(dartui.Path(), thisClass, type, layerString, 1 );
            }

            pathMap[key]?.path.addPath(path, Offset(0, 0));
            pathMap[key]?.count++;
            tileStats.paths++;
            if( debugOptions.featureSummary ) summaryAdd(summaryKey, includeSummary);
          } else {
            if( debugOptions.featureSummary ) summaryAdd(summaryKey, excludeSummary);
          }
          path = null;
        }
      }

      cachedInfo.geomInfo?.pathStore.add(pathMap);

    } // layer


    if(!options.containsKey('noLabels') && labelPointlist.length != null) {

      for(var pointInfo in labelPointlist) {
        var layerString = pointInfo[1];

        var thisClass = pointInfo[2]['class'] ?? 'default';
        var includeFeature = Styles.includeFeature(layerString, pointInfo[2]['type'], thisClass, tileZoom);
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

        if(road.text != null && halfway != null)
          cachedInfo.geomInfo?.labels.add(
              Label( text: road.text, point: halfway.position, textPainter: getNewPainter(road.text),
                  dedupeKey: road.text + '|' + coordsKey, priority: 3,
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
      this.debugOptions, this.optimisations, this.useImages);

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

    print("$tileZoom");

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

      // May need to clip off the tile if there are overlapping problems with joining
      // paths. This may help, but it makes any perspective clipping difficult as its not a rect
      // unless we clip/draw on a transformed canvas or something fiddly
      // leaving this code here, just to think about, it doesn't really work

      // var clipOffset = Offset(pos['pos'].x, pos['pos'].y);
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
            var style = pathMap?.style ?? Styles.getStyle(
                pathMap?.layerString, pathMap?.type, pathMap?.pclass, tileZoom,
                pos?.scale, 2);

            ///canvas.drawPath( pathMap.path.transform(matrix.storage), style );

            /// if we've pinchzooming, use thin lines for speed
            var oldStrokeWidth = style.strokeWidth;
            if (optimisations.pinchZoom) style.strokeWidth = 0.0;
            if( pathMap != null)
              canvas.drawPath(pathMap.path, style);
            style.strokeWidth = oldStrokeWidth;
          }
        }
      }
      if (debugOptions.tiles) {
        /// display tile square and coords
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

    Map qMap = {};
    for (var label in prevLabels) {
      if (wantedLabels.containsKey(label.dedupeKey)) {
        if (!checkLabelOverlaps(hiPriQueue, label)) {
          hiPriQueue.add(label);
          qMap[label.dedupeKey] = label;
        }
      }
    }

    List<Label> nextQ = [];
    for (var dedupeKey in wantedLabels.keys) {
      if (qMap.containsKey(dedupeKey)) {
        continue;
      }
      nextQ.add(wantedLabels[dedupeKey]);
    }

    nextQ.sort((a, b) {
      int cmp = a.priority.compareTo(b.priority);
      if (cmp != 0) return cmp;

      return a.dedupeKey.compareTo(b.dedupeKey);

      /// keep order consistent..
    });

    for (Label label in nextQ) {
      if (checkLabelOverlaps(hiPriQueue, label)) {
        continue;
      }
      hiPriQueue.add(label);
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
        isAntiAlias: true,
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
    var padding = 5.0;

    //label.boundNW = Offset( label.transformedPoint.dx - (labelLength * widthFactor / 2) - padding , label.transformedPoint.dy - (labelLength * widthFactor / 2) - padding);
    //label.boundSE = Offset( label.boundNW.dx + (labelLength * widthFactor ) + padding, label.boundNW.dy + (labelLength * widthFactor ) + padding);
    // Seeing if ints will speed things up, as we don't really care about accuracy and do a lot of collision checks, prob overoptimisation
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
          tileZoom != oldDelegate.tileZoom ||
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