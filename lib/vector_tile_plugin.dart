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

  static void decode( coordsKey, cachedInfo, options, vectorStyles ) {

    print("Decoding....");

    vector_tile.Tile vt;
    cachedInfo['paintState'] = 'stillPainting';

    ///var coordsKey = cachedInfo['coordsKey'];

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

      ///if(!currentTileCoordsToRenderMap.containsKey(coordsKey)) {
      ///  return;
      ///}

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

      cachedInfo['geomInfo']['paths'].add({'pathMap': pathMap, 'layerString': layerString });
      ///drawPaths(pathMap, canvas, layerString, levelUpDiffFactor);
    } // layer

    if(!options.containsKey('noLabels') && labelPointlist.length != null) {
      var seenLabel = {}; // prevent dupes...

      for(var pointInfo in labelPointlist) {

        var info = pointInfo[2]['name'];

        if(info != null && !seenLabel.containsKey(info)) {
          seenLabel[info] = true;
          ///_drawTextAt(info.toString(), pointInfo[0], canvas,cachedInfo['levelUpDiffFactor'] );
          cachedInfo['geomInfo']['text'].add({'text' : info.toString(), 'pointInfo' :pointInfo[0] });
        }
      }
    }

    print("Decode done for $coordsKey");
    print("Cachedinfo is $cachedInfo");

    cachedInfo['paintedLayerSegments']++;
    cachedInfo['paintState'] = 'finished';

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

    print("PAINTING!!!!");
    print("Vectordatamap ${cachedVectorDataMap}");

    for (var tile in tilesToRender) {
      print("Want to paint ${tile.coords}");
      print("Cache geomInfo is ${cachedVectorDataMap[tileCoordsToKey(tile.coords)]['geomInfo']}");
      print("Position is ${cachedVectorDataMap[tileCoordsToKey(tile.coords)]['positionInfo']}");
      var pos = cachedVectorDataMap[tileCoordsToKey(tile.coords)]['positionInfo'];

      print(" X IS ${pos['pos'].x}");
      print("SCALE IS ${pos['scale']}");
      var matrix = Matrix4.identity()..translate(  pos['pos'].x,  pos['pos'].y )..scale( pos['scale'] );
      print("$matrix");
      //print("matrix is $matrix");

      //matrix = cachedVectorDataMap[tileCoordsToKey(tile.coords)]['positionInfo']; /// ///////////////////////////////////


      for (var path in cachedVectorDataMap[tileCoordsToKey(tile.coords)]['geomInfo']['paths']) {
        ///var transformedPath = path['pathMap'].transform(matrix);
        ///print("TRANSPATH $transformedPath");
        ///drawPaths(path['pathMap'], canvas, path['layerString'], 2); /// get rid of need for diffratio.....
        print("drawing path ${path['pathMap']}");
        for(var className in path['pathMap'].keys) {

          print("Classname $className");
          if (Styles.includeFeature(path['layerString'], '', className, 2)) {
            print("here2");
            var paintStyle = Styles.getStyle2(
                path['layerString'], 'path', className, tileZoom, 2);
            print("here3");

            path['pathMap'].forEach(( key, value ){
              //print("kv $key, $value");
              //canvas.drawPath(value, paintStyle);
              print("val $value, matrix $matrix");
              canvas.drawPath(value.transform(matrix.storage), paintStyle);
            });
            //print("${path['pathMap']['layerString']}");
            //var tpath = path['pathMap'];
            //var tpath = path['layerString'][className].transform(matrix);
            //if( path['layerString'].containsKey(className) ) {
            //  print("Want to do ${path['layerString']['pathMap']}");
            //  canvas.drawPath(path['layerString']['pathMap'][className], paintStyle);
            //}
          }
        }
      }
      print("here6");
      canvas.save();
      canvas.transform(matrix.storage);
      for (var text in cachedVectorDataMap[tileCoordsToKey(tile.coords)]['geomInfo']['text']) {
        //_drawTextAt(text['text'], text['pointInfo'], canvas, 2); /// get rid of need for diffratio.....
        _drawTextAt(text['text'], text['pointInfo'], canvas, 2, matrix);
        //print( "Drawing text $text");
      }
      canvas.restore();

    }


      //drawPaths(pathMap, canvas, layerString, levelUpDiffFactor);

          // _drawTextAt(info.toString(), pointInfo[0], canvas,cachedInfo['levelUpDiffFactor'] );


  }

  void drawPaths(Map pathMap, canvas, layerString, [diffRatio = 0]) { /// need to turn into a list...?
    for(var className in pathMap.keys) {
      if(Styles.includeFeature(layerString, '', className, diffRatio)) {
        var paintStyle = Styles.getStyle2(layerString, 'path', className, tileZoom, diffRatio);
        canvas.drawPath(pathMap[className], paintStyle);
      }
    }
  }

  void _drawTextAt(String text, Offset position, Canvas canvas, diffRatio, matrix) {

    //canvas.save();
    //canvas.transform(matrix.storage);

    TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 2, // diffratio
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

    //canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;


}

