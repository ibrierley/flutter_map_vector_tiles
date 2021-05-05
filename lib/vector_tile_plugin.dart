import 'dart:ui' as dartui;
import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'vector_tile.pb.dart' as vector_tile;
import 'filters.dart';
import 'styles.dart';
import 'package:flutter_map_vector_tile/VectorTileWidget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vector_math/vector_math_64.dart' as VectorMath hide Colors;
//import 'package:vector_math/vector_math.dart' as Test hide Colors;

int decodeZigZag( int byte ) { /// decodes from mapbox small int style
  return ((byte >> 1) ^ -(byte & 1)).toInt();
}

String tileCoordsToKey(Coords coords) {
  return '${coords.x}:${coords.y}:${coords.z}';
}

class MapboxTile {

  static void decode( coordsKey, cachedInfo, options, vectorStyles, tileZoom ) {

    var includeSummary = {};
    var excludeSummary = {};
    var objectStats = { 'labels': 0, 'paths': 0, 'polys' : 0, 'points': 0, 'labelPoints': 0, 'polyPoints': 0, 'linePoints': 0 } ;

    var strokeScale = 2.0; /// remove the need for this hardcoded here

    vector_tile.Tile vt;

    try {
      vt = vector_tile.Tile.fromBuffer(cachedInfo['units']);
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

      Map<String, dynamic> pathMap = { };  //path => path, class => class, type => type, layer => layer

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
              reps =0;

              if (feature.type.toString() == 'POLYGON') {
                if (path == null) path = dartui.Path();
                path.addPolygon(polyPoints, true);
                objectStats['polys']++;
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
              ncx = (cx.toDouble() / 16).floorToDouble(); // Change /16 to a tileRatio passed in..
              ncy = (cy.toDouble() / 16).floorToDouble();
            }

            var type = feature.type.toString();
            if (command == 'C') { // CLOSE

            } else if (command == 'M') { // MOVETO
              if (type == 'POLYGON') {
                polyPoints = [];
                polyPoints.add(Offset(ncx, ncy));
                objectStats['polyPoints']++;
              } else if (type == 'LINESTRING') {
                if (path == null) path = dartui.Path();
                path.moveTo(ncx, ncy);

              } else if (type == 'POINT') {
                pointList.add(Offset(ncx, ncy));
                labelPointlist.add([Offset(ncx, ncy),layer.name, featureInfo  ]);  /// May want to add a style here, to draw last thing...
                objectStats['points']++;
                objectStats['labelPoints']++;
              }

            } else if (command == 'L') { // LINETO

              if (type == 'POLYGON') {
                polyPoints.add(Offset(ncx, ncy));
                objectStats['polyPoints']++;
              } else if (type == 'LINESTRING') {
                path.lineTo(ncx, ncy);
                objectStats['linePoints']++;
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
        var detailType = featureInfo['type'] ?? 'default'; // this may be a track (which is listed as a road and has a type of track)

        var key = "$layerString|$type|$thisClass";

        if (!options.containsKey('labelsOnly') && path != null) {
          if(includeFeature) {
            /// we're keeping layers separate, as we need to know which layers are "on top" of which others,
            /// otherwise water can end up on top of a road for example

            if(!pathMap.containsKey(key)) {
              pathMap[key] = { 'path': dartui.Path(), 'class' : thisClass, 'type' : type, 'layerString' : layerString,
                'count' : 1,  }; // init
            }

            pathMap[key]['path'].addPath(path, Offset(0, 0));
            pathMap[key]['count']++;
            objectStats['paths']++;
            includeSummary[ key + "|" + tileZoom.toString() ] = true;
          } else {
            excludeSummary[ key + "|" + tileZoom.toString() ] = true;
          }
          path = null;
        }
      }

      cachedInfo['geomInfo']['paths'].add({'layerString': layerString, 'pathMap': pathMap });
    } // layer


    if(!options.containsKey('noLabels') && labelPointlist.length != null) {

      for(var pointInfo in labelPointlist) {
        var layerString = pointInfo[1];

        var thisClass = pointInfo[2]['class'] ?? 'default';
        var includeFeature = Styles.includeFeature(layerString, pointInfo[2]['type'], thisClass, tileZoom);

        if( includeFeature ) {
          var info = pointInfo[2]['name'];

          if (info != null) {

            TextStyle textStyle = TextStyle(
                color: Colors.black,
                fontSize: 14 //scale == 1 ? scale : 16 / scale, // diffratio, wondering if this may give an none fraction optimisations..
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

            cachedInfo['geomInfo']['text'].add(
                {
                  'text': info.toString(),
                  'pointInfo': pointInfo[0],
                  'textPainter': textPainter
                });
          }
          objectStats['labels']++;

          includeSummary[ layerString + "_" + thisClass +"_" + tileZoom.toString() ] = true;
        } else {
          excludeSummary[ layerString + "_" + thisClass + "_" + tileZoom.toString() ] = true;
        }
      }
    }

    cachedInfo['paintedLayerSegments']++;

    print("ObjectStats is $objectStats");
    print("INCLUDES: $includeSummary");
    print("EXCLUDES $excludeSummary");
  }
}




class VectorPainter extends CustomPainter {

  final tilesToRender;
  final tileZoom;
  final cachedVectorDataMap;
  final levelUpDiff;
  final usePerspective;

  TextPainter cachedTextPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center);

  List<Map<String, bool>> layerDisplaySegments = Filters.layerDisplaySegments();

  VectorPainter(List<VTile> this.tilesToRender, this.tileZoom, this.cachedVectorDataMap, this.levelUpDiff, this.usePerspective);

  @override
  void paint(Canvas canvas, Size size) {

    var strokeScale = 1.0;
    var seenLabel = {};
    var rotatePerspective = -1.4; // only used if we're using perspective enabled

    var pointPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    for (var tile in tilesToRender) {
      var pos = cachedVectorDataMap[tileCoordsToKey(tile.coords)]['positionInfo'];

      var matrix;
      if( !usePerspective ) {
        matrix = Matrix4.identity()
          ..translate(  pos['pos'].x,  pos['pos'].y )
          ..scale( pos['scale'] );
      } else  {
        // https://github.com/google/vector_math.dart/blob/527da5771eb7f1bd61b9e5fdb884891d46c3235d/lib/src/vector_math_64/opengl.dart
        //matrix = VectorMath.makePerspectiveMatrix(math.pi / 2, 2.0, -100000.0, 100000.0)
        matrix = Matrix4.identity()
          ..setEntry(3, 2, 0.002) // perspective
          ..translate(0.0, 0.0, 0.0)
          ..rotateX(rotatePerspective)
          ..translate(pos['pos'].x, pos['pos'].y)
          ..scale(pos['scale'], pos['scale'])


          ;
      }

      for (var layer in cachedVectorDataMap[tileCoordsToKey(tile.coords)]['geomInfo']['paths']) {
        for (var layerKey in layer['pathMap'].keys) { /// we have a map for each layer, paths should be combined to same style/type

          var pathMap = layer['pathMap'][layerKey];

          if( pathMap.containsKey('path') ) {
            var style = Styles.getStyle2( pathMap['layerString'], pathMap['type'], pathMap['class'], tileZoom, strokeScale, 2 );
            canvas.drawPath(
                pathMap['path'].transform(matrix.storage), style);
          } else {
          }
        }
      }
    }

    /// All labels should come on top of paths etc, so moved loop out here
    for (var tile in tilesToRender) {
      var pos = cachedVectorDataMap[tileCoordsToKey(
          tile.coords)]['positionInfo'];

      var matrix;
      if( !usePerspective) {
        matrix = Matrix4.identity()
          ..translate(pos['pos'].x, pos['pos'].y)
          ..scale(pos['scale'])
        ;

      } else {
        matrix = Matrix4.identity()
          ..setEntry(3, 2, 0.002) // perspective
          ..translate(0.0, 0.0, 0.0)
          ..rotateX(rotatePerspective)
          ..translate(pos['pos'].x, pos['pos'].y)
          ..scale(pos['scale'], pos['scale'])

        ;
      }


      for (var text in cachedVectorDataMap[tileCoordsToKey(tile.coords)]['geomInfo']['text']) {
        /// prevent dupe labels from different tiles
        if(!seenLabel.containsKey(text['text'])) {

          ///var centerPoint = Offset(text['pointInfo'].dx - text['textPainter'].width / 2,
          ///    text['pointInfo'].dy + (text['textPainter'].height/2));
          ///
          var transformedPoint = MatrixUtils.transformPoint(matrix, text['pointInfo']);
          //var transformedCenterPoint = Offset(transformedPoint.dx - text['textPainter'].width / 2 / pos['scale'],
           //   (transformedPoint.dy + (text['textPainter'].height / 2 / pos['scale']) ) );


          // https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/painting/matrix_utils.dart
          ///var transformedCenterPoint = MatrixUtils.transformPoint(matrix, centerPoint);

          canvas.drawPoints( PointMode.points, [ transformedPoint ], pointPaint );

          _drawTextAt(text['text'], transformedPoint, canvas, pos['scale'],
              text['textPainter']); // we don't want to scale text
          seenLabel[text['text']] = true;
        }
      }


    }
  }


  void _drawTextAt(String text, Offset position, Canvas canvas, scale, textPainter) {

    Offset drawPosition =
      Offset(position.dx - textPainter.width / 2, position.dy + (textPainter.height/2));
    textPainter.paint(canvas, drawPosition);
  }

  @override
  bool shouldRepaint(VectorPainter oldDelegate) =>
      tilesToRender != oldDelegate.tilesToRender ||
          tileZoom != oldDelegate.tileZoom ||
          cachedVectorDataMap != oldDelegate.cachedVectorDataMap;


}

