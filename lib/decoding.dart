import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'vector_tile.pb.dart' as vector_tile;
import 'vector_tile_plugin.dart';
import 'package:flutter_map_vector_tile/styles.dart';
import 'VectorTileWidget.dart';
import 'quickstyles.dart';

class Decoding {

  static Map geomToCanvasObjects(checkedLayers, vectorStyle, coordsKey, options,
      tileZoom, [ VTCache? cachedInfo ]) {
    List labelPointlist = [];
    List<Road> roadLabelList = [];

    List pathLayers = [];

    if (checkedLayers == null) {
      print("checkedLayer was null...");
      checkedLayers = [];
    }

    for (var featureLayer in checkedLayers) {
      Map<String, PathInfo> pathMap = {};
      Map<String, PathInfo> outlinePathMap = {};

      for (var feature in featureLayer) {
        var layerString = feature['layerString'];

        var thisClass = feature['properties'].containsKey('class') ?
        feature['properties']['class'] : 'default';

        var geom = feature['geometry'];
        var geomType = geom['type'];
        var coords = geom['coordinates'];

        var key = "L:$layerString>C:$thisClass";

        if (geomType == 'POINT') {
          List<Offset> pointsList = [];
          var priority = 1;

          var point = Offset(coords[0], coords[1]);
          pointsList.add(point);

          var dedupeKey = feature['properties']['name'] ?? point.toString();
          dedupeKey = "${coordsKey}|" + dedupeKey;

          if (layerString == "housenum_label" &&
              !feature['properties'].containsKey('name')) {
            feature['properties']['name'] = feature['properties']['house_num'];
            dedupeKey = "${feature['properties']['name']}|$point";
            priority = 2;
          }

          labelPointlist.add(
              [ point, layerString, feature, dedupeKey, priority]);
        } else if (geomType == "LINESTRING") {
          var path = ui.Path();
          for (var coordsSet in geom['coordinates']) {
            if (coordsSet.length > 0) {
              path.moveTo(coordsSet[0][0], coordsSet[0][1]);
              for (var index = 1; index < coordsSet.length; index++) {
                path.lineTo(coordsSet[index][0], coordsSet[index][1]);
              }
            }
          }

          if (!pathMap.containsKey(key)) {
            pathMap[key] =
                PathInfo(path, thisClass, geomType, layerString, feature, 1);

            Paint style = Styles.getStyle(
                vectorStyle,
                feature,
                layerString,
                geomType,
                tileZoom,
                2,
                2);
            pathMap[key]?.style = style;
          } else {
            pathMap[key]?.path.addPath(path, Offset(0, 0));
          }
          if (layerString == 'road') {
            var name = feature['properties']['ref'] ??
                feature['properties']['name'];
            if (name != null)
              roadLabelList.add(
                  Road(name, feature['properties']['class'], path));
          }
        } else if (geomType == "POLYGON") {
          var path = ui.Path();
          for (var coordsSet in geom['coordinates']) {
            List<Offset> pointsList = [];
            for (var index = 0; index < coordsSet.length; index++) {
              pointsList.add(Offset(coordsSet[index][0], coordsSet[index][1]));
            }
            path.addPolygon(pointsList, true);
          }

          if (!pathMap.containsKey(key)) {
            pathMap[key] =
                PathInfo(path, thisClass, geomType, layerString, feature, 1);

            var style = Styles.getStyle(
                vectorStyle,
                feature,
                layerString,
                geomType,
                tileZoom,
                2,
                2);
            pathMap[key]?.style = style;
          } else {
            pathMap[key]?.path.addPath(path, Offset(0, 0));
          }

          var outlineKey = key + "_outline";
          if (feature.containsKey('fill-outline-color')) {
            if (!outlinePathMap.containsKey(outlineKey)) {
              outlinePathMap[outlineKey] =
                  PathInfo(path, thisClass, geomType, layerString, feature, 1);
              outlinePathMap[outlineKey]?.path = path;
              outlinePathMap[outlineKey]?.style = Paint()
                ..color = getColorFromString(feature['fill-outline-color'])
                ..style = PaintingStyle.stroke
                ..strokeWidth = 0.0;
            } else {
              outlinePathMap[outlineKey]?.path.addPath(path, Offset(0, 0));
            }

            // pathMap[key + "_outline"]?.style = style;
          }
        }
      }

      /*
      if(cachedInfo != null) {
        pathMap.forEach((pathKey, pathInfo) {
          //cachedInfo.geomInfo?.pathStore.add(pathMap);
          ///need to explain the logic a bit more here...
        });
      }

       */

      cachedInfo?.geomInfo?.pathStore.add(pathMap);

      pathMap.forEach((key, value) {
        pathLayers.add(value);
      });
      outlinePathMap.forEach((key, value) {
        pathLayers.add(value);
      });
    } // layer

    return {
      'pathLayers': pathLayers,
      'roadLabelList': roadLabelList,
      'labelPointList': labelPointlist
    };
  }

  static dynamic pathsToImage(checkedLayers, vectorStyle, coordsKey, options,
      tileZoom) async {
    var pathLayers = geomToCanvasObjects(
        checkedLayers, vectorStyle, coordsKey, options, tileZoom, null);

    var vtc = VTCache(

      /// hmm this is a bit of a mess, needs some refactoring
        null, 'gettingHttp', coordsKey, tileZoom, GeomStore([], [], [], []),
        DateTime.now()
    );
    vtc.geoJson = { 'layers': checkedLayers};

    MapboxTile.decodeGeoToNative(
        pathLayers,
        coordsKey,
        vtc,
        {},
        vectorStyle,
        tileZoom,
        DebugOptions());

    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    var dpr = ui.window.devicePixelRatio;
    if (dpr < 2) dpr = 2;
    canvas.scale(dpr, dpr);

    for (var pathInfo in pathLayers['pathLayers']) {
      pathInfo.style.isAntiAlias = true;
      canvas.drawPath(pathInfo.path, pathInfo.style);
    }

    ui.Image picture = await recorder.endRecording().toImage(
        (256 * dpr).ceil(), (256 * dpr).ceil());
    var imageByteData = await picture.toByteData(format: ui.ImageByteFormat.png);

    return imageByteData;
  }


  static dynamic decodeBytesToGeom(vectorStyle, coordsKey, bytes, options,
      tileZoom) async {
    final Map decoded = {};

    late vector_tile.Tile vt;

    if (bytes != null)
      vt = vector_tile.Tile.fromBuffer(bytes);

    int reps = 0;

    /// We prob don't need this now unless using the old style methods...
    Map<String, int> layerOrderMap = DefaultQuickStyles.defaultLayerOrder();

    if (layerOrderMap.keys.length > 0) {
      vt.layers.sort((a, b) {
        return (layerOrderMap[ a.name ] ?? 15).compareTo(
            layerOrderMap[ b.name ] ?? 15);
      });
    }

    Map layerSummary = {};

    for (var layer in vt.layers) {
      final layerString = layer.name.toString();

      decoded[layerString] = [];

      if (layerSummary.containsKey(layerString)) {
        layerSummary[layerString]++;
      } else {
        layerSummary[layerString] = 0;
      }

      for (var feature in layer.features) {
        Map<String, dynamic> fullFeature = { 'type': "Feature"};
        final properties = {};
        final geometryInfo = {};

        var command = '';

        for (var tagIndex = 0; tagIndex < feature.tags.length; tagIndex += 2) {
          final valIndex = feature.tags[tagIndex + 1];
          final layerObj = layer.values[valIndex];
          var val;

          if (layerObj.hasIntValue()) {
            val = layerObj.intValue.toInt();
          } else if (layerObj.hasUintValue()) {
            val = layerObj.uintValue.toInt();
          } else if (layerObj.hasSintValue()) {
            val = layerObj.sintValue.toInt();
          } else if (layerObj.hasDoubleValue()) {
            val = layerObj.doubleValue.toDouble();
          } else if (layerObj.hasStringValue()) {
            val = layerObj.stringValue;
          } else if (layerObj.hasBoolValue()) {
            val = layerObj.boolValue;
          } else {
            print("VAL NOT CATERERED FOR $val");
          }

          properties[layer.keys[feature.tags[tagIndex]]] = val;
        }

        fullFeature['properties'] = properties;

        final List coordinatesList = [];
        List coords = [];

        var type = feature.type.toString();
        geometryInfo['type'] = type;

        if (layerSummary.containsKey(type)) {
          layerSummary[type]++;
        } else {
          layerSummary[type] = 1;
        }

        var geometry = feature.geometry;

        var gIndex = 0;
        int cx = 0;
        int cy = 0;

        while (gIndex < geometry.length) {
          final commandByte = geometry[ gIndex ];

          if (reps == 0) {
            command = 'M';
            var checkCom = commandByte & 0x7;
            reps = commandByte >> 3;

            if (checkCom == 1) {
              command = 'M';
            } else if (checkCom == 2) {
              command = 'L';
            } else if (checkCom == 7) {
              command = 'C';
              reps = 0;
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
              if (coords.length != 0) {
                coordinatesList.add(coords);
              }
              coords = [];
            } else if (command == 'M') { // MOVETO
              if (coords.length != 0) coordinatesList.add(coords);
              coords = [[ncx, ncy]];
            } else if (command == 'L') { // LINETO
              coords.add([ncx, ncy]);
            } else {
              print("Incorrect command string");
            }

            gIndex += 2;
            reps--;
          }
        }

        if (coords.length != 0) coordinatesList.add(coords);
        coords = [];
        if (geometryInfo['type'] == "POINT") {
          geometryInfo['coordinates'] = coordinatesList[0][0];
        } else {
          geometryInfo['coordinates'] = coordinatesList;
        }
        fullFeature['geometry'] = geometryInfo;
        fullFeature['layerString'] = layerString;

        if (true)
          decoded[layerString].add(fullFeature);
      }
    } // layer

    return decoded;
  }

}
