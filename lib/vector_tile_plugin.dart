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
  Label? backgroundLabel;
  Label( {required this.text, required this.point, required this.textPainter,
    required this.dedupeKey, required this.priority, required this.coordsKey,  this.isRoad = false, this.angle = 0.0, this.backgroundLabel } );
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

  static void decodeGeoToNative( coordsKey, VTCache cachedInfo, options, vectorStyle, tileZoom, DebugOptions debugOptions ) {

    var start = DateTime.now();

    Map<String, int> includeSummary = {};
    Map<String, int> excludeSummary = {};
    TileStats tileStats = new TileStats();
    cachedInfo.state = 'Decoding';

    var jsonMap = cachedInfo.geoJson ?? {};

    var pathLayers = geomToPathLayers(jsonMap['layers'], vectorStyle, coordsKey, options, tileZoom, cachedInfo);

    if(!options.containsKey('noLabels')) {

      for(var pointInfo in pathLayers['labelPointList']) {
        var layerString = pointInfo[1];

        var thisClass = pointInfo[2]['properties']['class'] ?? 'default';
        var summaryKey = "L:" + layerString + "_C:" + thisClass +"_Z:" + tileZoom.toString();

        if( true ) {
          var info = pointInfo[2]['properties']['name'];

          if (info != null) {
            var backPainter = getNewPainter(info.toString(), Colors.white, 12.0, 2.0);
            var backgroundLabel =
              Label( text: info.toString(), point: pointInfo[0],
                  textPainter: backPainter, dedupeKey: pointInfo[3] + '_b',
                  priority: pointInfo[4], coordsKey: coordsKey );

            cachedInfo.geomInfo?.labels.add(
                Label( text: info.toString(), point: pointInfo[0],
                    textPainter: getNewPainter(info.toString(), Colors.black, 12.0, 1.0), dedupeKey: pointInfo[3],
                    priority: pointInfo[4], coordsKey: coordsKey, backgroundLabel: backgroundLabel ) );
          }
          tileStats.labels++;

          summaryAdd(summaryKey, includeSummary);
        }
      }
    }

    if(!debugOptions.skipRoadLabels) {
      for (var road in pathLayers['roadLabelList']) {

        var halfway;
        var metrics = road.path.computeMetrics();
        for( dartui.PathMetric metric in metrics) {
          /// get halfway point to display text at along along road
          halfway = metric.getTangentForOffset(metric.length / 2);

          if( metric.length < 100.0) { /// Make this into an option min pathsize for labels
            continue;
          }
        }

        if(halfway != null && road.text != "")
          cachedInfo.geomInfo?.labels.add(
              Label( text: road.text, point: halfway.position, textPainter: getNewPainter(road.text, Colors.black, 12.0, 1.0),
                  dedupeKey: road.text + '|' + coordsKey, priority: 2,
                  coordsKey: coordsKey, angle: halfway.angle, isRoad: true ) ); /// use named params and a class for pointInfo

      }
    }

    if( debugOptions.featureSummary ) {
      print("INCLUDES: $includeSummary");
      print("EXCLUDES $excludeSummary");
    }

    cachedInfo.state = 'Decoded';

    //var end = DateTime.now().difference(start);
    //print("decode to paths took...${end.inMilliseconds} milli");
    //print("dpr here is ${dartui.window.devicePixelRatio}");

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
  final useCanvas;
  final highZoomCanvas;
  final vectorStyle;
  final geoJson;

  static Map<String, Map<String, Label>> cachedLabelsPerTile = {};
  static DateTime timeSinceLastClean = DateTime.now();
  static Map<String, bool> prevTilesLoaded = {};
  static double prevTileZoom = 0.0;
  static List<Label> prevLabels = [];

  List<Map<String, bool>> layerDisplaySegments = Filters.layerDisplaySegments();

  VectorPainter(Offset this.dimensions, double this.rotation,
      List<VTile> this.tilesToRender, this.tileZoom,
      this.cachedVectorDataMap, this.underZoom, this.usePerspective,
      this.debugOptions, this.optimisations, this.useImages, this.useCanvas, this.highZoomCanvas, this.vectorStyle, this.geoJson );

  @override
  void paint(Canvas canvas, Size size) {
    final double rotatePerspective = -1.25; //-1.25; // only used if we're using perspective enabled
    double widgetRotation = this.rotation;
    bool isRotated = false;
    if (widgetRotation != 0.0) isRotated = true;
    widgetRotation = widgetRotation % 360;

    final devicePerspectiveAngle = DartMath.atan2(size.width / 2, size.height) *
        57.2958;

    Map<String, Label> wantedLabels = {};
    List<Label> hiPriQueue = [];

    var start = DateTime.now();

    final pointPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    if (usePerspective) {
      final m = Matrix4.identity()
        ..rotateY(
            devicePerspectiveAngle * 0.0174) // device vanishing point offset
        ..setEntry(3, 2, 0.0015) // general distance perspective
        ..rotateX(rotatePerspective); // horizontal level angle change

      canvas.save();
      canvas.transform(m.storage);
    }

    final Rect myRect = Offset(0,0) & Size(256.0,256.0);
    /// Normal paths
    for (var tile in tilesToRender) {
      var usedPaintedImage = false;
      final String tileCoordsKey = tileCoordsToKey(tile.coords);
      final PositionInfo? pos = cachedVectorDataMap[tileCoordsKey]?.positionInfo;

      if(useImages && cachedVectorDataMap[tileCoordsKey]?.image != null && tileZoom < highZoomCanvas) {
        if ((pos != null) && (cachedVectorDataMap[tileCoordsKey]?.image != null)) {
          ///print("PAINTING TILE $tileZoom");
          paintTile(canvas, pos, cachedVectorDataMap[tileCoordsKey]?.image);
          usedPaintedImage = true;
        }
        //usedPaintedImage = true;
      }




      final Matrix4 matrix = Matrix4.identity();
      if(pos != null)
        matrix..translate(pos.point.x.toDouble(), pos.point.y.toDouble())
        ..scale(pos.scale);

      canvas.save();
      canvas.transform(matrix.storage);

      /// clip prevents the odd clashing artifact with overlapping tiles features

      if(!useImages) canvas.clipRect(myRect); /// feel like vectors want this, but images don't, introduced hairline crack between tiles ?

      //if we need a clip that isn't already transformed, we can use below..
      //if( pos != null) {
      //  var adjustedSize = Offset(256.0, 256.0).scale(pos.scale, pos.scale);
      //  Rect myRect = Offset(pos.point.x.toDouble(), pos.point.y.toDouble()) & Size(adjustedSize.dx, adjustedSize.dy);
      //  canvas.clipRect(myRect);
      //}
      // var adjustedSize = Offset(256.0, 256.0).scale(pos['scale'], pos['scale']);

      // Rect myRect = Offset(pos['pos'].x, pos['pos'].y) & Size(adjustedSize.dx, adjustedSize.dy);
      // canvas.clipRect(myRect);

      if(!usedPaintedImage && (useCanvas || (tileZoom >= highZoomCanvas))) {

        final List<
            Map<String, PathInfo>> dataMap = cachedVectorDataMap[tileCoordsKey]
            ?.geomInfo?.pathStore ?? [];

        for (Map<String, PathInfo> layer in dataMap) {
          for (var layerKey in layer.keys) {
            /// we have a map for each layer, paths should be combined to same style/type
            PathInfo? pathMap = layer[layerKey];

            if (pathMap?.path != null) {
              // cache style if we can to save lookups, we may want to add
              // a method to reload new styles in though

              final style = pathMap?.style ?? Styles.getStyle(
                  vectorStyle,
                  pathMap?.featureInfo,
                  pathMap?.layerString,
                  pathMap?.type,
                  tileZoom,
                  pos?.scale,
                  2);


              /// if we've pinchzooming, use thin lines for speed
              double oldStrokeWidth = style.strokeWidth;
              if (optimisations.pinchZoom) {
                ///print("Style optimisation");
                ///if(!usedPaintedImage)
                 /// style.strokeWidth = 0.0;
              }

              if (pathMap != null) {
                ///canvas.drawPath(pathMap.path.transform(matrix.storage), style);
                ///print("DRAWING VECTOR MAP path $tileZoom!!!!!!");
                canvas.drawPath(pathMap.path, style);
                style.strokeWidth = oldStrokeWidth;
              }
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

    ///if (useImages) return;

    /// Start draw Labels

    /// Calculated transformed Label position and do collision detection
    /// to decide which to cull.
    /// All labels should come on top of paths etc, so moved loop out here
    ///
    for (var tile in tilesToRender) {
      final String tileCoordsKey = tileCoordsToKey(tile.coords);
      final PositionInfo? pos = cachedVectorDataMap[tileCoordsKey]?.positionInfo;

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

      final List labels =  cachedVectorDataMap[tileCoordsKey]?.geomInfo?.labels ?? [];

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
        isRotated, tileZoom, debugOptions);

    var end = DateTime.now().difference(start).inMilliseconds;
    //print("draw paint took...${end} milliseconds");
  }

  static void _drawTextAt(Offset position, Canvas canvas, scale, textPainter) {
    final Offset drawPosition =
    Offset(position.dx - textPainter.width / 2,
        position.dy + (textPainter.height / 2));
    textPainter.paint(canvas, drawPosition);
  }

  static void _orderLabelsAndDraw(wantedLabels, hiPriQueue, canvas, pointPaint,
      widgetRotation, isRotated, tileZoom, debugOptions) {


    final Map qMap = {};
    for (var label in prevLabels) {
      if (wantedLabels.containsKey(label.dedupeKey)) {
        if (!checkLabelOverlaps(hiPriQueue, label)) {
          hiPriQueue.add(label);
          qMap[label.dedupeKey] = label;
        }
      }
    }

    final List<List<Label>> priorityQ = [[],[],[]];
    for (var dedupeKey in wantedLabels.keys) {
      if (qMap.containsKey(dedupeKey)) {
        continue;
      }
      priorityQ[wantedLabels[dedupeKey].priority].add(wantedLabels[dedupeKey]);
    }

    final nextQ = [...priorityQ[0], ...priorityQ[1], ...priorityQ[2]];

    int count = hiPriQueue.length;
    for (Label label in nextQ) {
      if (((count > 25 && tileZoom < 16) || checkLabelOverlaps(hiPriQueue, label))) {
        continue;
      }
      hiPriQueue.add(label);
      count++;
    }

    prevLabels = []; // reset our list of labels to carry over as hipri
    final Map<String, Label> justSeenLabels = {};


    for (Label label in hiPriQueue) {
      if (justSeenLabels.containsKey(label.dedupeKey)) continue;

      final tp = label.transformedPoint;

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

  static void _drawLabels(Label label, Canvas canvas, bool isRotated,
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
      final double angleDeg = getNoneUpsideDownTextAngle(label, widgetRotation);

      canvas.rotate((angleDeg) * DEGTORAD);

      _drawTextAt(drawPoint, canvas, 1,
          label.textPainter); //
      canvas.restore();

    } else {

      /// /////////////////////////////////////////////////////////////////////////////////////////////////////////

      if (isRotated) { // we need to realign the text so its upright
        drawPoint = Offset(0.0, 0.0);
        canvas
            .save(); // can we transform all first, as save is quite expensive...
        if( transformedPoint != null)
          canvas.translate(
            transformedPoint.dx, transformedPoint.dy);
        canvas.rotate(-widgetRotation * 0.0174533);
      }

      if( drawPoint != null) {
        if(label.backgroundLabel != null) {
          _drawTextAt(drawPoint, canvas, 1,
              label.backgroundLabel?.textPainter); //
        }
        _drawTextAt(drawPoint, canvas, 1,
            label.textPainter); // we don't want to scale text
      }
      if (isRotated) {
        canvas.restore();
      }
    }
  }

  static void paintTile(canvas, pos, image) {
    paintImage(canvas: canvas,
        rect: Rect.fromLTWH(pos.point.x, pos.point.y, pos.width, pos.height),
        scale: pos.scale,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topLeft,
        filterQuality: FilterQuality.low,
        isAntiAlias: false, // true will give unwanted visible tile edges
        image: image);
  }


  static bool checkLabelOverlaps( List labelsToCheck, Label label  ) { // add fontsize (14) to the check...

    bool collides = false;

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

  static void _updateLabelBounding(Label label) {
    final widthFactor = 9.0; // how big as a ratio of text to size up
    final labelLength = label.text.length;
    final padding = 10.0;

    final tp = label.transformedPoint;
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

  static double getNoneUpsideDownTextAngle(Label label, double widgetRotation) {
    double angleDeg = -label.angle * RADTODEG;
    angleDeg += 90;

    if(angleDeg > 180) angleDeg -= 180;
    if(angleDeg < 0) angleDeg += 180;

    if(widgetRotation + angleDeg > 180 && (widgetRotation + angleDeg < 360)) {
      angleDeg -= 180;
    }

    angleDeg -= 90;

    return angleDeg;
  }

  static void _debugTiles(Canvas canvas, VTile tile) {

    final paint = Paint()
      ..color = Colors.yellowAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(256.0, 0);
    path.lineTo(256.0, 256.0);
    path.lineTo(0, 256.0);
    path.close();

    canvas.drawPath(path, paint);

    final TextStyle textStyle = TextStyle(
        color: Colors.yellow,
        fontSize: 14 //scale == 1 ? scale : 16 / scale, // diffratio, ?
    );
    final TextSpan textSpan = TextSpan(
      text: tile.coords.toString(),
      style: textStyle,
    );

    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(minWidth: 0, maxWidth: double.infinity)
      ..text = textSpan;

    textPainter.paint(canvas, Offset(0.0,0.0));
  }

  static void debugRect(canvas, Label label) {
    final Path path = Path();

    var nwx = label.boundNWx.toDouble();
    var nwy = label.boundNWy.toDouble();
    var sex = label.boundSEx.toDouble();
    var sey = label.boundSEy.toDouble();

      path.moveTo(nwx, nwy);
      path.lineTo(sex, nwy);
      path.lineTo(sex, sey);
      path.lineTo(nwx, sey);

    path.close();

    final paint = Paint();
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

TextPainter getNewPainter(String text, color, fontSize, strokeWidth) {
  ///final TextStyle textStyle = TextStyle(
  ///    color: color,
  ///    fontSize: fontSize, //scale == 1 ? scale : 16 / scale, // diffratio, ?
  ///    foreground: Paint()
  ///    ..style = PaintingStyle.stroke
  ///    ..strokeWidth = strokeWidth
  ///    ..color = color,
    //background: Paint() // block background for text
    //  ..style = PaintingStyle.stroke
    //  ..strokeWidth = strokeWidth * 2
    //  ..color = Colors.red,

  ///);
  final TextSpan textSpan = TextSpan(
    text: text,
    //style: textStyle,
    style: Styles.labelTextStyles['blackNormalThick']
  );

  return TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center)
    ..layout(minWidth: 0, maxWidth: double.infinity)
    ..text = textSpan;
}

