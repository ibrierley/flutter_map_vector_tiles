import 'dart:ui' as dartui;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'vector_tile.pb.dart' as vector_tile;
import 'filters.dart';
import 'styles.dart';
import 'package:flutter_map_vector_tile/VectorTileWidget.dart';


int decodeZigZag( int byte ) { /// decodes from mapbox small int style
  return ((byte >> 1) ^ -(byte & 1)).toInt();
}

class VectorPainter extends CustomPainter {

  Listenable _repaint;
  final Map styles;
  final cachedInfo;
  final currentTileCoordsToRenderMap;
  final options;
  final Map vectorStyles;
  final tileZoom;
  ValueNotifier<int>  paintNotifier;

  TextPainter cachedTextPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center);

  List<Map<String, bool>> layerDisplaySegments = Filters.layerDisplaySegments();

  VectorPainter(this.styles, this.cachedInfo, this.currentTileCoordsToRenderMap, this.options, this.vectorStyles, this.tileZoom, this.paintNotifier) : super(repaint: paintNotifier) {
    _repaint = paintNotifier;
  }

  @override
  void paint(Canvas canvas, Size size) {

    vector_tile.Tile vt;
    cachedInfo['paintState'] = 'stillPainting';

    var coordsKey = cachedInfo['coordsKey'];

    try {
      vt = vector_tile.Tile.fromBuffer(cachedInfo['units']);
    } catch (e) {
      print("Problem getting from buffer $e");
    }

    int reps = 0;

    Map<String, int> layerOrderMap = styles['defaultLayerOrder'] ?? Styles.defaultLayerOrder();

    if(layerOrderMap.keys.length > 0) {
      vt.layers.sort((a, b) {
        return (layerOrderMap[ a.name ] ?? 15).compareTo(
            layerOrderMap[ b.name ] ?? 15);
      });
    }

    var layerCount = 0;

    Map layerSummary = {};

    List labelPointlist = [];
    var levelUpDiffFactor = cachedInfo['levelUpDiffFactor'] ?? 0; // move outside loop, pass in;

    for( var layer in vt.layers) {

      if(!currentTileCoordsToRenderMap.containsKey(coordsKey)) {
        return;
      }

      Map<String, dartui.Path> pathMap = { 'default':  dartui.Path()};

      var layerString = layer.name.toString();

      var styleInfo;
      if(vectorStyles.containsKey(layerString)) { /// maybe not needed..
        styleInfo = vectorStyles[layerString];
      }

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
                } else if (type == 'LINESTRING') {
                  if (path == null) path = dartui.Path();
                  path.moveTo(ncx, ncy);

                } else if (type == 'POINT') {
                  pointList.add(Offset(ncx, ncy));
                  labelPointlist.add([Offset(ncx, ncy),layer.name, featureInfo  ]);  /// May want to add a style here, to draw last thing...
                }

              } else if (command == 'L') { // LINETO

                if (type == 'POLYGON') {
                  polyPoints.add(Offset(ncx, ncy));
                } else if (type == 'LINESTRING')
                  path.lineTo(ncx, ncy);
              } else {
                print("Incorrect command string");
              }

            gIndex += 2;
            reps--;
          }
        }

        var includeFeature = Styles.includeFeature(layerString, type, featureInfo);
        var thisClass = featureInfo['class'] ?? 'default';

        if (!options.containsKey('labelsOnly') && pointList.length != 0) {
          var paintStyle = Styles.getStyle(layerString, type, featureInfo, styleInfo, cachedInfo['levelUpDiffFactor']);
          if(includeFeature) {
            //todo
          }
          pointList = [];
        }

        if (!options.containsKey('labelsOnly') && path != null) {
          if(includeFeature) {
            if(!pathMap.containsKey(thisClass)) pathMap[thisClass] = dartui.Path();
            pathMap[thisClass].addPath(path,Offset(0,0));
          }
          path = null;
        }
      }

      cachedInfo['geomInfo']['paths'].add({'pathMap': pathMap, 'canvas': canvas, 'layerString': layerString, 'diffFactor' : levelUpDiffFactor });
      drawPaths(pathMap, canvas, layerString, levelUpDiffFactor);
    } // layer

     if(!options.containsKey('noLabels') && labelPointlist.length != null) {
       var seenLabel = {}; // prevent dupes...

       for(var pointInfo in labelPointlist) {

         var info = pointInfo[2]['name'];

         if(info != null && !seenLabel.containsKey(info)) {
           seenLabel[info] = true;
           _drawTextAt(info.toString(), pointInfo[0], canvas,cachedInfo['levelUpDiffFactor'] );
           cachedInfo['geomInfo']['text'].add({'text' : info.toString(), 'pointInfo' :pointInfo[0], 'canvas': canvas, 'diffFactor' : levelUpDiffFactor });
         }
       }
     }

     cachedInfo['paintedLayerSegments']++;
     cachedInfo['paintState'] = 'finished';

  }

  void drawPaths(Map pathMap, canvas, layerString, [diffRatio = 0]) { /// need to turn into a list...?
    for(var className in pathMap.keys) {
      if(Styles.includeFeature(layerString, '', className, diffRatio)) {
        var paintStyle = Styles.getStyle2(layerString, 'path', className, tileZoom, diffRatio);
        canvas.drawPath(pathMap[className], paintStyle);
      }
    }
  }

  void _drawTextAt(String text, Offset position, Canvas canvas, diffRatio) {
    TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12 / diffRatio,
    );
    TextSpan textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    var textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
    ..layout(minWidth: 0, maxWidth: double.infinity)
    ..text = textSpan;

    Offset drawPosition =
    Offset(position.dx - textPainter.width / 2, position.dy + (textPainter.height/2));
    textPainter.paint(canvas, drawPosition);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}

