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
import 'package:vector_math/vector_math_64.dart' hide Colors;


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

    var strokeScale = 1.0;

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
        var key = "$layerString|$type|$thisClass";

        if (!options.containsKey('labelsOnly') && path != null) {
          if(includeFeature) {
            /// we're keeping layers separate, as we need to know which layers are "on top" of which others,
            /// otherwise water can end up on top of a road for example

            if(!pathMap.containsKey(key)) {
              var style = Styles.getStyle2( layerString, type, thisClass, tileZoom, strokeScale, 2 );

              pathMap[key] = { 'path': dartui.Path(), 'class' : thisClass, 'type' : type, 'layerString' : layerString,
                'count' : 1, 'style' : style, 'color': style.color }; // init
            } else {
              pathMap[key]['path'].addPath(path, Offset(0, 0));
              pathMap[key]['count']++;
            }
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
      var seenLabel = {}; // prevent dupes...

      for(var pointInfo in labelPointlist) {
        var layerString = pointInfo[1];

        var thisClass = pointInfo[2]['class'] ?? 'default';
        var includeFeature = Styles.includeFeature(layerString, pointInfo[2]['type'], thisClass, tileZoom);

        if( includeFeature ) {
          var info = pointInfo[2]['name'];

          if (info != null && !seenLabel.containsKey(info)) {
            seenLabel[info] = true;
            cachedInfo['geomInfo']['text'].add(
                {'text': info.toString(), 'pointInfo': pointInfo[0]});
          }
          includeSummary[ layerString + "_" + thisClass +"_" + tileZoom.toString() ] = true;
        } else {
          excludeSummary[ layerString + "_" + thisClass + "_" + tileZoom.toString() ] = true;
        }
      }
    }

    cachedInfo['paintedLayerSegments']++;
    cachedInfo['paintState'] = 'finished';

    print("INCLUDES: $includeSummary");
    print("EXCLUDES $excludeSummary");
  }
}




class VectorPainter extends CustomPainter {

  final tilesToRender;
  final tileZoom;
  final cachedVectorDataMap;
  final levelUpDiff;

  TextPainter cachedTextPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center);

  List<Map<String, bool>> layerDisplaySegments = Filters.layerDisplaySegments();

  VectorPainter(List<VTile> this.tilesToRender, this.tileZoom, this.cachedVectorDataMap, this.levelUpDiff);

  @override
  void paint(Canvas canvas, Size size) {

    for (var tile in tilesToRender) {
      var pos = cachedVectorDataMap[tileCoordsToKey(tile.coords)]['positionInfo'];

      var matrix = Matrix4.identity()
        ..translate(  pos['pos'].x,  pos['pos'].y )
        ..scale( pos['scale']  )
      ;

      for (var layer in cachedVectorDataMap[tileCoordsToKey(tile.coords)]['geomInfo']['paths']) {

        for (var layerKey in layer['pathMap'].keys) { /// we have a map for each layer, paths should be combined to same style/type

          var pathMap = layer['pathMap'][layerKey];

          if( pathMap.containsKey('path') && pathMap.containsKey('style')) {

            var style = pathMap['style'];
            canvas.drawPath(
                pathMap['path'].transform(matrix.storage), style);
          } else {
          }
        }
      }

      for (var text in cachedVectorDataMap[tileCoordsToKey(tile.coords)]['geomInfo']['text']) {

        var translatedPos = text['pointInfo']
            .scale(pos['scale'],pos['scale'])
            .translate(pos['pos'].x,  pos['pos'].y);

        _drawTextAt(text['text'], translatedPos, canvas, pos['scale'], matrix); // we don't want to scale text
      }
    }
  }


  void _drawTextAt(String text, Offset position, Canvas canvas, scale, matrix) {

    TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 14 //scale == 1 ? scale : 16 / scale, // diffratio, wondering if this may give an none fraction optimisations..
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
  bool shouldRepaint(VectorPainter oldDelegate) =>
      tilesToRender != oldDelegate.tilesToRender ||
          tileZoom != oldDelegate.tileZoom ||
          cachedVectorDataMap != oldDelegate.cachedVectorDataMap;


}

