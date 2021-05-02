import 'dart:ui' as dartui;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'vector_tile.pb.dart' as vector_tile;
import 'filters.dart';
import 'styles.dart';
import 'package:flutter_map_vector_tile/VectorTileWidget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;


int decodeZigZag( int byte ) { /// decodes from mapbox small int style
  return ((byte >> 1) ^ -(byte & 1)).toInt();
}

String tileCoordsToKey(Coords coords) {
  return '${coords.x}:${coords.y}:${coords.z}';
}

class MapboxTile {

  static void decode( coordsKey, cachedInfo, options, vectorStyles, tileZoom ) {

    print("Decoding....$options ${cachedInfo.keys}");
    var includeSummary = {};
    var excludeSummary = {};
    var start = DateTime.now();

    vector_tile.Tile vt;
    cachedInfo['paintState'] = 'stillPainting';

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

    var layerCount = 0;

    Map layerSummary = {};

    List labelPointlist = [];
    var levelUpDiffFactor = cachedInfo['levelUpDiffFactor'] ?? 0; // move outside loop, pass in;

    for( var layer in vt.layers) {

      Map<String, dartui.Path> pathMap = { };  //class

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

        var includeFeature = Styles.includeFeature(layerString, type, featureInfo['class'], tileZoom);
        var thisClass = featureInfo['class'] ?? 'default';
        //print("ReturnedVal: Zoom is $tileZoom, $layerString $thisClass $type, includeFeature is $includeFeature");

        if (!options.containsKey('labelsOnly') && path != null) {
          if(includeFeature) {
            //print("Including $tileZoom $layerString $thisClass");
            if(!pathMap.containsKey(thisClass)) pathMap[thisClass] = dartui.Path();
            pathMap[thisClass].addPath(path,Offset(0,0));
            includeSummary[ layerString + "_" + thisClass +"_" + tileZoom.toString() ] = true;
          } else {
            //print("Excluding $tileZoom $layerString $thisClass");
            excludeSummary[ layerString + "_" + thisClass + "_" + tileZoom.toString() ] = true;
          }
          path = null;
        }
      }

      cachedInfo['geomInfo']['paths'].add({'layerString': layerString, 'pathMap': pathMap });
    } // layer

    if(!options.containsKey('noLabels') && labelPointlist.length != null) {
      var seenLabel = {}; // prevent dupes...

      for(var pointInfo in labelPointlist) {
        var info = pointInfo[2]['name'];

        if(info != null && !seenLabel.containsKey(info)) {
          seenLabel[info] = true;
          cachedInfo['geomInfo']['text'].add({'text' : info.toString(), 'pointInfo' :pointInfo[0] });
        }
      }
    }

    var end = DateTime.now().difference(start).inMicroseconds;

    print("TIMING! Mapbox tile decode took us $end");
    print("Decode done for $coordsKey");

    cachedInfo['paintedLayerSegments']++;
    cachedInfo['paintState'] = 'finished';

    print("INCLUDES");
    print("$includeSummary");
    print("EXCLUDES");
    print("$excludeSummary");

  }

}




class VectorPainter extends CustomPainter {

  final tilesToRender;
  final tileZoom;
  final cachedVectorDataMap;

  TextPainter cachedTextPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center);

  List<Map<String, bool>> layerDisplaySegments = Filters.layerDisplaySegments();

  VectorPainter(List<VTile> this.tilesToRender, this.tileZoom, this.cachedVectorDataMap);

  @override
  void paint(Canvas canvas, Size size) {
    var paintTimeStart =  DateTime.now();

    for (var tile in tilesToRender) {
      var pos = cachedVectorDataMap[tileCoordsToKey(tile.coords)]['positionInfo'];

      var strokeScale = 1; /// debug try both 1 & 16 use pos['scale'] if scaling the whole canvas....

      var matrix = Matrix4.identity()
        ..translate(  pos['pos'].x,  pos['pos'].y )
        ..scale( pos['scale'] );

      var start = DateTime.now();

      for (var layer in cachedVectorDataMap[tileCoordsToKey(tile.coords)]['geomInfo']['paths']) {
        var layerName = layer['layerString'];

        for(var className in layer['pathMap'].keys) {

          ///if (Styles.includeFeature(layerName, '', className, 2)) {
              var paintStyle = Styles.getStyle2(
                     layerName, 'path', className, tileZoom,
                     strokeScale, 2);

              canvas.drawPath(layer['pathMap'][className].transform(matrix.storage), paintStyle);
          ///}
        }
      }
      var end = DateTime.now().difference(start).inMicroseconds;

      //print("TIMING! Canvas paths drawing time μs:  $end");

      start = DateTime.now();
      for (var text in cachedVectorDataMap[tileCoordsToKey(tile.coords)]['geomInfo']['text']) {

        var translatedPos = text['pointInfo']
            .scale(pos['scale'],pos['scale'])
            .translate(pos['pos'].x,  pos['pos'].y);

        _drawTextAt(text['text'], translatedPos, canvas, pos['scale'], 2, matrix); // we don't want to scale text
      }
      end = DateTime.now().difference(start).inMicroseconds;
      //print("TIMING! Canvas text drawing time μs:  $end");
      start = DateTime.now();

      end = DateTime.now().difference(start).inMicroseconds;
      //print("TIMING! Canvas restore time μs:  $end");

      end = DateTime.now().difference(paintTimeStart).inMicroseconds;
      //print("TIMING! Canvas whole paint time μs:  $end");

    }


  }

  /*
  void drawPaths(Map pathMap, canvas, layerString, [diffRatio = 0]) { /// need to turn into a list...?
    for(var className in pathMap.keys) {
      if(Styles.includeFeature(layerString, '', className, diffRatio)) {
        //var paintStyle = Styles.getStyle2(layerString, 'path', className, strokeScale,  diffRatio);
        //canvas.drawPath(pathMap[className], paintStyle);
      }
    }
  }
  */


  void _drawTextAt(String text, Offset position, Canvas canvas, scale, diffRatio, matrix) {

    TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 16 //scale == 1 ? scale : 16 / scale, // diffratio, wondering if this may give an none fraction optimisations..
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
  bool shouldRepaint(CustomPainter oldDelegate) => true;


}

