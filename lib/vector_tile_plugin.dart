import 'dart:ui' as dartui;
import 'dart:ui';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

import 'vector_tile.pb.dart' as vector_tile;
import 'filters.dart';
import 'styles.dart';


class VectorTilesImageProvider extends TileProvider {
  final TileLayerOptions tileLayerOptions;
  final Map styles;

  VectorTilesImageProvider({this.tileLayerOptions, this.styles});

  @override
  ImageProvider getImage(Coords<num> coords, TileLayerOptions options) {
    return VectorTileImage(
      coords,
      tileLayerOptions,
      styles,
    );
  }
}

class VectorTileImage extends ImageProvider<VectorTileImage> {

  final Coords coords;
  final TileLayerOptions tileLayerOptions;
  final Map styles;

  VectorTileImage(this.coords,this.tileLayerOptions, this.styles);

  @override
  ImageStreamCompleter load(VectorTileImage key, decode) {
    return MultiFrameImageStreamCompleter(
        codec: _loadAsync(key),
        scale: 1,
        informationCollector: () sync* {
          yield DiagnosticsProperty<ImageProvider>('Image provider', this);
          yield DiagnosticsProperty<ImageProvider>('Image key', key);
        });
  }

  Future<Codec> _loadAsync(VectorTileImage key) async {
    assert(key == this);

    var url = tileLayerOptions.tileProvider.getTileUrl(
        coords, tileLayerOptions);

    var response = await retry(
          () => http.get(url).timeout(Duration(seconds: 5)),
      retryIf: (e) => e is TimeoutException,
    );

    var layerList = protobufUnitsToObj(response.body.codeUnits, tileLayerOptions);

    dartui.PictureRecorder recorder = dartui.PictureRecorder();

    Canvas canvas = Canvas(recorder);

    var dpr = dartui.window.devicePixelRatio;
    canvas.scale(dpr, dpr);

    VectorPainter openPainter = VectorPainter(layerList, styles);

    openPainter.paint(canvas,Size(tileLayerOptions.tileSize,tileLayerOptions.tileSize));

    /// rendering can be a bit fuzzy, so scaling below suggested from https://github.com/flutter/flutter/issues/17782 not sure if this helps or not...
    var im = await recorder.endRecording().toImage((tileLayerOptions.tileSize.toInt() * dpr).ceil(), (tileLayerOptions.tileSize.toInt() * dpr).ceil());


    var byteData = await im.toByteData(format: dartui.ImageByteFormat.png);
    var bytes = byteData.buffer.asUint8List();

    if (byteData == null) {
      return Future<Codec>.error('Failed to load tile for coords: $coords');
    }

    return PaintingBinding.instance.instantiateImageCodec(bytes);

  }

  @override
  Future<VectorTileImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture(this);
  }

}

List protobufUnitsToObj( units, tileLayerOptions ) {

  vector_tile.Tile vt = vector_tile.Tile.fromBuffer(units);

  int reps = 0;
  var layerList = [];

  for( var layer in vt.layers) {

    var featureList = [];
    var layerInfo = {'name': layer.name};
    var command = '';

    for (var feature in layer.features) {

      var geometry = feature.geometry;
      var drawObj = [];
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
            drawObj.add([command,null,null,feature.type.toString()]);
          } else {
            print("Shouldn't have got here, some command unknown");
          }
          gIndex++;
        } else {
          cx += decodeZigZag(geometry[ gIndex ]);
          cy += decodeZigZag(geometry[ gIndex + 1]);

          drawObj.add(
              [command, cx, cy, feature.type.toString()]
          );
          gIndex += 2;
          reps--;
        }
      }

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

      featureList.add({ 'info': featureInfo, 'drawObj': drawObj });
    }

    layerList.add({ 'info': layerInfo, 'featureList': featureList });
  }

  return layerList;

}

int decodeZigZag( int byte ) { /// decodes from mapbox small int style
  return ((byte >> 1) ^ -(byte & 1)).toInt();
}


class VectorPainter extends CustomPainter {
  final layerList;
  final Map styles;

  VectorPainter(this.layerList, this.styles);

  @override
  void paint(Canvas canvas, Size size) {

    var textStyle = TextStyle(
      color: Colors.black12.withOpacity(1),
      decorationStyle: dartui.TextDecorationStyle.solid,
      decorationThickness: 0.25,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 10,
    );


    Map<String, int> layerOrderMap = styles['defaultLayerOrder'] ?? Styles.defaultLayerOrder();

    if(layerOrderMap.keys.length > 0) {
      layerList.sort((a, b) {
        return (layerOrderMap[ a['info']['name'] ] ?? 15).compareTo(
            layerOrderMap[ b['info']['name'] ] ?? 15);
      });
    }

    final pointMode = dartui.PointMode.points;

    var cx = 0.0; var cy = 0.0;

    for( var layer in layerList ) {
      dartui.Path path;
      List<Offset> pointList = [];
      List labelPointlist = [];
      var layerInfo = layer['info'];

      for (var featureList in layer['featureList']) {
        List<Offset> polyPoints = [];
        var commandList = featureList['drawObj'];
        var lastType;

        if(!Filters.isAllowed(layerInfo['name'], featureList['info'])) {
          break;
        }

        for (var c = 0; c < commandList.length; c++) {
          var el = commandList[c];
          var type = el[3];
          String command = el[0];

          if (command == 'M' || (command == 'L')) {
            cx = el[1].toDouble();
            cy = el[2].toDouble();
          }

          var ncx = (cx / 16).floorToDouble(); /// NEED TO SORT PASSING TILE RATIO
          var ncy = (cy / 16).floorToDouble(); /// SORT TILE RATIO

          lastType = el[3];

          if (command == 'C') { // CLOSE
            if (type == 'POLYGON') {
              if (path == null) path = dartui.Path();
              path.addPolygon(polyPoints, true);
            } else {
              path.close();
            }
          } else if (command == 'M') { // MOVETO

            if (type == 'POLYGON') {
                polyPoints = [];
                polyPoints.add(Offset(ncx, ncy));

            } else if (type == 'LINESTRING') {
              if (path == null) path = dartui.Path();
              path.moveTo(ncx, ncy);

            } else if (type == 'POINT') {
              pointList.add(Offset(ncx, ncy));
              labelPointlist.add([Offset(ncx, ncy),layerInfo['name'],featureList['info'] ]);
            }

          } else if (command == 'L') { // LINETO

            if (type == 'POLYGON') {
              polyPoints.add(Offset(ncx, ncy));
            } else if (type == 'LINESTRING')
              path.lineTo(ncx, ncy);
          } else {
            print("Incorrect command string");
          }
        }

        if (pointList.length != 0) {
          var paintStyle = Styles.getStyle(layerInfo['name'], lastType, featureList['info'], styles);
          canvas.drawPoints(pointMode, pointList, paintStyle);
          pointList = [];
        }

        if (path != null) {
          var paintStyle = Styles.getStyle(layerInfo['name'], lastType, featureList['info'], styles);
          canvas.drawPath(path, paintStyle);
          path = null;
        }

        if(labelPointlist.length != null) {
          for(var pointInfo in labelPointlist) {

            var info = pointInfo[2]['name'];
            if(info != null) {
              /// print("$pointInfo"); good for debugging info on points and layer info to remove
              TextPainter textPainter = TextPainter(
                  text: TextSpan(text: info.toString(), style: textStyle),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr
              )
                ..layout(maxWidth: size.width - 12.0 - 12.0);

              textPainter.paint(canvas, pointInfo[0]);
            }
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}



