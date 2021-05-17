import 'dart:typed_data';
import 'dart:ui' as dartui;
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'vector_tile.pb.dart' as vector_tile;
import 'filters.dart';
import 'styles.dart';
import 'package:flutter_map_vector_tile/VectorTileWidget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vector_math/vector_math_64.dart' as VectorMath hide Colors;
import 'dart:math' as DartMath;

int decodeZigZag( int byte ) { /// decodes from mapbox small int style
  return ((byte >> 1) ^ -(byte & 1)).toInt();
}

String tileCoordsToKey(Coords coords) {
  return '${coords.x}:${coords.y}:${coords.z}';
}

class GeomStore {
  List<Map<String,dynamic>> pathStore; /// rename/rejig as not really paths as such...
  List<Label> labels;
  List<Offset> points;
  GeomStore( this.pathStore, this.labels, this.points );
}

class PathInfo {
  dartui.Path path;
  String pclass;
  String type;
  String layerString;
  int count;

  PathInfo(this.path, this.pclass, this.type, this.layerString, this.count);
}

class PositionInfo {
  CustomPoint point;
  double width;
  double height;
  String coordsKey;
  double scale;
  PositionInfo({this.point, this.width, this.height, this.coordsKey, this.scale});

}

class VTCache {
  Uint8List units;
  String state;
  String coordsKey;
  double tileZoom;
  PositionInfo positionInfo;
  GeomStore geomInfo;

  VTCache( this.units, this.state, this.coordsKey, this.tileZoom, this.positionInfo, this.geomInfo);
}

class Label {
  String text;
  Offset point;
  Offset transformedPoint;
  Offset boundNW;
  Offset boundSE;
  TextPainter textPainter;
  Label( this.text, this.point, this.textPainter);
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

  static void decode( coordsKey, cachedInfo, options, vectorStyles, tileZoom, DebugOptions debugOptions ) {

    Map<String, int> includeSummary = {};
    Map<String, int> excludeSummary = {};
    TileStats tileStats = new TileStats();

    vector_tile.Tile vt;

    try {
      vt = vector_tile.Tile.fromBuffer(cachedInfo.units);
    } catch (e) {
      print("Problem getting from buffer $e");
    }

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

    for( var layer in vt.layers) {

      Map<String, PathInfo> pathMap = {};  //path => path, class => class, type => type, layer => layer

      var layerString = layer.name.toString();

      if(layerSummary.containsKey(layerString)) {
        layerSummary[layerString]++;
      } else {
        layerSummary[layerString] = 0;
      }

      var command = '';

      dartui.Path path;
      List<Offset> pointList = [];

      for (var feature in layer.features) {

        var featureInfo = {};

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
              } else {
                path.close();
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
              } else if (type == 'LINESTRING') {
                if (path == null) path = dartui.Path();
                path.moveTo(ncx, ncy);

              } else if (type == 'POINT') {
                pointList.add(Offset(ncx, ncy));
                labelPointlist.add([Offset(ncx, ncy),layer.name, featureInfo  ]);  /// May want to add a style here, to draw last thing...
                tileStats.points++;
                tileStats.labelPoints++;
              }

            } else if (command == 'L') { // LINETO

              if (type == 'POLYGON') {
                polyPoints.add(Offset(ncx, ncy));
                tileStats.polyPoints++;
              } else if (type == 'LINESTRING') {
                path.lineTo(ncx, ncy);
                tileStats.linePoints++;
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

        if (!options.containsKey('labelsOnly') && path != null) {
          if(includeFeature) {
            /// we're keeping layers separate, as we need to know which layers are "on top" of which others,
            /// otherwise water can end up on top of a road for example

            if(!pathMap.containsKey(key)) {
              pathMap[key] = PathInfo(dartui.Path(), thisClass, type, layerString, 1 );
            }

            pathMap[key].path.addPath(path, Offset(0, 0));
            pathMap[key].count++;
            tileStats.paths++;
            summaryAdd(summaryKey, includeSummary);
          } else {
            summaryAdd(summaryKey, excludeSummary);
          }
          path = null;
        }
      }

      ///cachedInfo['geomInfo']['paths'].add({'layerString': layerString, 'pathMap': pathMap });
      cachedInfo.geomInfo.pathStore.add({'layerString': layerString, 'pathMap': pathMap });

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

            /// feel like this shouldn't be here, but is an optimisation.
            /// Cache it in the Vector Painter ?
            TextStyle textStyle = TextStyle(
                color: Colors.black,
                fontSize: 14 //scale == 1 ? scale : 16 / scale, // diffratio, ?
            );
            TextSpan textSpan = TextSpan(
              text: info.toString(),
              style: textStyle,
            );

            var textPainter = TextPainter(
                text: textSpan,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center)
              ..layout(minWidth: 0, maxWidth: double.infinity)
              ..text = textSpan;

            cachedInfo.geomInfo.labels.add(
              Label( info.toString(), pointInfo[0], textPainter ) );

          }
          tileStats.labels++;

          summaryAdd(summaryKey, includeSummary);
        } else {
          summaryAdd(summaryKey, excludeSummary);
        }
      }
    }

    ///tileStats.dump();
    if( debugOptions.featureSummary ) {
      print("INCLUDES: $includeSummary");
      print("EXCLUDES $excludeSummary");
    }
  }
}




class VectorPainter extends CustomPainter {

  final dimensions;
  final tilesToRender;
  final tileZoom;
  final cachedVectorDataMap;
  final underZoom;
  final usePerspective;
  final debugOptions;
  final rotation;
  final Optimisations optimisations;

  static final Map<String, Label> labelsOnDisplay = {};

  TextPainter cachedTextPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center);

  List<Map<String, bool>> layerDisplaySegments = Filters.layerDisplaySegments();

  VectorPainter(Offset this.dimensions, double this.rotation,  List<VTile> this.tilesToRender, this.tileZoom,
      this.cachedVectorDataMap, this.underZoom, this.usePerspective,
      this.debugOptions, this.optimisations);

  @override
  void paint(Canvas canvas, Size size) {

    var seenLabel = {};
    var rotatePerspective = -1.25; //-1.25; // only used if we're using perspective enabled
    var widgetRotation = this.rotation;
    var isRotated = false;
    if(widgetRotation != 0.0 ) isRotated = true;
    var devicePerspectiveAngle =  DartMath.atan2( size.width/2 , size.height) * 57.2958;

    var pointPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    
    Map<String, bool> tileCoordsDisplayed = {};
    List<Label> renderLabels = [];

    if( usePerspective ) {
      var m = Matrix4.identity()
        ..rotateY(
            devicePerspectiveAngle * 0.0174) // device vanishing point offset
        ..setEntry(3, 2, 0.0015) // general distance perspective
        ..rotateX(rotatePerspective); // horizontal level angle change
      canvas.save();
      canvas.transform( m.storage );
    }

    /// Drawing normal paths
    for (var tile in tilesToRender) {
      String tileCoordsKey = tileCoordsToKey(tile.coords);
      PositionInfo pos = cachedVectorDataMap[tileCoordsKey].positionInfo;
      
      tileCoordsDisplayed[tileCoordsKey] = true;

      Matrix4 matrix = Matrix4.identity()
          ..translate( pos.point.x,  pos.point.y )
          ..scale( pos.scale );

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

      for (var layer in cachedVectorDataMap[tileCoordsToKey(tile.coords)].geomInfo.pathStore) {
        for (var layerKey in layer['pathMap'].keys) { /// we have a map for each layer, paths should be combined to same syle/type
          var pathMap = layer['pathMap'][layerKey];

          if( pathMap.path != null ) {
            var style = Styles.getStyle2( pathMap.layerString, pathMap.type, pathMap.pclass, tileZoom, pos.scale, 2 );
            ///canvas.drawPath( pathMap['path'].transform(matrix.storage), style );

            /// if we've pinchzooming, use thin lines for speed
            if( optimisations.pinchZoom ) style.strokeWidth = 0.0;
            if( optimisations.hairlineOption && tileZoom < 11) style.strokeWidth = 0.0;

            canvas.drawPath( pathMap.path, style );

          }
        }
      }
      if( debugOptions.tiles ) { /// display tile square and coords
        _debugTiles(canvas, tile);
      }

       canvas.restore();
    }

    if( usePerspective ) canvas.restore();

    /// we want to keep previous labels displayed to show first if tiles
    /// haven't gone out of view

    labelsOnDisplay.removeWhere((key, keyLabel) => !tileCoordsDisplayed.containsKey(keyLabel));

    /// Calculated transformed Label position and do collision detection
    /// to decide which to cull.
    /// All labels should come on top of paths etc, so moved loop out here
    for (var tile in tilesToRender) {
      String tileCoordsKey = tileCoordsToKey(tile.coords);
      PositionInfo pos = cachedVectorDataMap[tileCoordsKey].positionInfo;

      Matrix4 matrix;
      if( !usePerspective) {
        matrix = Matrix4.identity();
        matrix..translate(pos.point.x, pos.point.y)
          ..scale(pos.scale);

      } else {
        matrix = Matrix4.identity()
          ..rotateY(devicePerspectiveAngle * 0.0174)
          ..setEntry(3, 2, 0.0015) // perspective
          ..rotateX(rotatePerspective)

          // normal position
          ..translate(pos.point.x, pos.point.y)
          ..scale(pos.scale, pos.scale);
      }

      /// There's a slight issue as labels aren't reverse transformed to account for
      /// widget rotations. Gets fiddly, but we could probably sort if we care enough
      for (Label label in cachedVectorDataMap[tileCoordsToKey(tile.coords)].geomInfo.labels) {
        label.transformedPoint = MatrixUtils.transformPoint(matrix, label.point);
        _updateLabelBounding( label );
        renderLabels.add(label);
      }
    }

    /// Not sure this sort makes any diff. The general idea was that labels seem
    /// to glitch in which is displayed, as a lot is happening and there is no
    /// order as the tiles come in and out, so I was trying to at least make sure
    /// a random ordering doesn't mean one label gets past collision detection one
    /// frame when it didn't before. We also need to be careful to remember the
    /// labels must be consistent accross tiles and tile changes

    renderLabels.sort((a, b) => a.text.compareTo(b.text));

    for (Label label in renderLabels ) {
      /// prevent dupe labels from different tiles
      if(!seenLabel.containsKey(label.text)) {  ///careful this may not match up with our ondisplay list ?

        /// boundary box check (slight bug that it rotates unlike text)
        
        if( checkLabelOverlaps( label, canvas, debugOptions.labels ) ) {
          labelsOnDisplay.remove(label.text);
          continue;
        }

        canvas.drawPoints( PointMode.points, [ label.transformedPoint ], pointPaint );

        /// if its rotated, we want to keep the text unrotated
        var drawPoint = label.transformedPoint;
        if( isRotated) {
          drawPoint = Offset(0.0, 0.0);
          canvas.save(); // can we transform all first, as save is quite expensive...
          canvas.translate(label.transformedPoint.dx, label.transformedPoint.dy);
          canvas.rotate(-widgetRotation * 0.0174533);
        }

        _drawTextAt(label.text, drawPoint, canvas, 1,
            label.textPainter); // we don't want to scale text

        if( isRotated ) {
          canvas.restore();
        }

        seenLabel[label.text] = true;
        labelsOnDisplay[label.text] = label;

      } else {
      }
    }
  }

  void _drawTextAt(String text, Offset position, Canvas canvas, scale, textPainter) {

    Offset drawPosition =
      Offset(position.dx - textPainter.width / 2, position.dy + (textPainter.height/2));
    textPainter.paint(canvas, drawPosition);
  }



  bool checkLabelOverlaps( Label label, Canvas canvas, debugLabels  ) { // add fontsize (14) to the check...

    if( debugLabels ) debugRect(canvas, label);
    bool collides = false;

    labelsOnDisplay.keys.forEach((key) {

      Label compareLabel = labelsOnDisplay[key];  // [coord, label]

      if( compareLabel != label) {

        if ((label.boundNW.dx < compareLabel.boundSE.dx) &&
            (label.boundSE.dx > compareLabel.boundNW.dx) &&
            (label.boundNW.dy < compareLabel.boundSE.dy) &&
            (label.boundSE.dy > compareLabel.boundNW.dy)) {

          collides = true;
        }
      }
    });

    return collides;
  }

  void _updateLabelBounding(Label label) {
    var widthFactor = 10.0;
    var heightFactor = 40.0;
    var labelLength = label.text.length;

    label.boundNW = Offset( label.transformedPoint.dx - (labelLength * widthFactor / 2) , label.transformedPoint.dy - 4);
    label.boundSE = Offset(label.boundNW.dx + (labelLength * widthFactor ), label.boundNW.dy + heightFactor );

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
    path.moveTo(label.boundNW.dx, label.boundNW.dy);
    path.lineTo(label.boundSE.dx, label.boundNW.dy);
    path.lineTo(label.boundSE.dx, label.boundSE.dy);
    path.lineTo(label.boundNW.dx, label.boundSE.dy);
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

