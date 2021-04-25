import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


class Styles {

  static Paint defaultPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.grey
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true;

  static TextPainter defaultTextPainter = TextPainter(
      text: TextSpan(
        text: '',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center);


  static Map<String, int> defaultLayerOrder() {
    return {
      'water' : 15,
      'waterway' : 2,
      'landuse': 3,
      'road': 6,
      'structure': 4,
      'building' : 5,
      'poi_label' : 10,
      'natural_label' : 9,
      'transit_stop_label' : 12,
      'place_label' : 13,
    };
  }

  static Map<String, Map<String, dynamic>> classColorStyles = {
    ///mapbox streets
    "road": { 'include': true, 'default': Colors.black26, 'service': Colors.white30, 'street': Colors.white54, 'pedestrian': Colors.white54, 'service': Colors.white54, 'street_limited': Colors.white54,
      'motorway' : Colors.deepPurple, 'trunk': Colors.deepPurple, 'trunk_link': Colors.deepPurple, 'primary' : Colors.yellow, 'primary_link': Colors.yellow, 'secondary': Colors.orangeAccent,
      'secondary_link': Colors.orangeAccent,'tertiary': Colors.yellow, 'tertiary_link': Colors.yellow,
      "path": Colors.white54, 'track': Colors.white38, 'residential': Colors.white54, 'major_rail': Colors.black, 'minor_rail': Colors.black12, 'service_rail': Colors.black, 'construction': Colors.brown },
    "motorway_junction": {'include': true, 'default': Colors.deepPurple },
    "landuse": {'include': false, 'default': Colors.lightGreen, 'sand': Colors.amber, 'playground': Colors.blueGrey, 'grass': Colors.lightGreen, 'park': Colors.lightGreen, 'pitch': Colors.green,
      'parking': Colors.blueGrey, 'wood': Colors.green, 'agriculture': Colors.brown, 'school': Colors.grey,  },
    "landuse_overlay" : { 'include': false,'default': Colors.green, "national_park": Colors.green },
    "water": { 'include': true,'default': Colors.blue },
    "waterway": { 'include': true, 'default': Colors.blue },
    "transit_stop": { 'include': true,"default": Colors.deepOrange},
    "building": { 'include': false, "default": Colors.blueGrey },
    "structure": { 'include': false, "default": Colors.blueGrey, 'fence': Colors.brown },
    "barrierline": {'include': false, "default": Colors.purple },
    "aeroway": { 'include': true, "default": Colors.orange },
    "waterway_label": { 'include': false, 'default': Colors.black54 },
    "poi_label": { 'include': false, 'default': Colors.orangeAccent },
    'transit_stop_label' : { 'include': true, 'default': Colors.black54 },
    "road_point": { 'include': true, 'default': Colors.black54 },
    "road_label": { 'include': true, "default": Colors.black },
    "rail_station_label": { 'include': true,"default": Colors.black },
    "natural_label": { 'include': true,'default': Colors.brown },
    "place_label": { 'include': true,'default': Colors.grey },
    "airport_label": { 'include': true, 'default': Colors.grey },
    "housenum_label": { 'include': false, 'default': Colors.grey },
    "mountain_peak_label": { 'include': false, 'default': Colors.brown },
    "state_label": { 'include': false, 'default': Colors.grey },
    "marine_label": { 'include': false, 'default': Colors.blueGrey },
    "country_label": { 'include': true, 'default': Colors.blueGrey },
    "default": { 'include': false, 'default': Colors.grey },

    ///traffic mapbox
    'traffic': { 'include': true, 'default': Colors.blueGrey, 'primary': Colors.blue, 'secondary': Colors.blue, 'tertiary': Colors.black38, 'street': Colors.black26 },

    ///mapbox terrain
    'contour': { 'include': false,'default': Colors.grey },
    'landcover': { 'include': false, 'default': Colors.grey, 'grass': Colors.green, 'crop': Colors.yellow },
    'hillshade': { 'include': false, 'default': Colors.grey, 'shadow': Colors.grey},

    ///tegola   https://tegola.io/styles/hot-osm.json
    'buildings': { 'include': false, 'default': Colors.grey },
    'land': { 'include': false, 'default': Colors.green },
    'landuse_areas' : { 'include': false,'default': Colors.brown, 'leisure': Colors.green },
    'landcover': { 'include': false, 'default': Colors.grey, 'grass': Colors.green, 'crop': Colors.yellow },
    'hillshade': { 'include': false, 'default': Colors.grey, 'shadow': Colors.grey},
    'transport_lines': { 'include': true, 'default': Colors.white60 },
    'amenity_points' : { 'include': true, 'default': Colors.white60 },
  };

  static Map<String, Map<String, double>> classStrokeWidthClasses = {
    "default": { "default": 2 },
    "road": { "default": 2, "street_limited": 2, "pedestrian" : 1, "path" : 3, "service" : 1, 'motorway': 6,'street': 2, "primary" : 4, "secondary": 3, "tertiary": 2, "trunk": 4, "trunk_link": 4, "major_rail": 3, "minor_rail": 2, "service_rail" : 1, },
  };

  static bool includeFeature(layerString, type, thisClass, [sizeDiffRatio = 1, zoom]) { //reduce code...
    var includeFeature = classColorStyles['default']['include'];

    if(classColorStyles.containsKey(layerString)) {
      includeFeature = classColorStyles[layerString]['include'];
    }
    return includeFeature;
  }

  static Paint getStyle2(layerString, type, className, tileZoom, diffRatio) {
    var paint = defaultPaint;
    var styleInfo = classColorStyles;

    if(type == 'path' || type == 'line')    paint.style = PaintingStyle.stroke; // are roads filled ?
    if(type == 'polygon' || type == 'fill') paint.style = PaintingStyle.fill;

    if(styleInfo.containsKey(layerString)) {
      if(styleInfo[layerString].containsKey(className)) {
        paint.color = styleInfo[layerString][className];
      } else {
        paint.color = styleInfo[layerString]['default'];
      }
    }
    if(classStrokeWidthClasses.containsKey(layerString)) {
      paint.strokeWidth = classStrokeWidthClasses[layerString][className] ?? classStrokeWidthClasses[layerString]['default'];
    } else {
      paint.strokeWidth = classStrokeWidthClasses['default']['default'];
    }

    paint.strokeWidth = paint.strokeWidth * tileZoom / 16;
    if(diffRatio > 0) paint.strokeWidth = paint.strokeWidth / diffRatio; // hmm not sure this is needed ?

    paint.strokeWidth = paint.strokeWidth * tileZoom / 5;

    return paint;
  }

  static Paint getStyle(layerString, type, featureInfo, styleInfo, [sizeDiffRatio = 1]) {

    /// See https://docs.mapbox.com/vector-tiles/reference/mapbox-streets-v7/#water
    ///
    /// see style json at https://github.com/openmaptiles/maptiler-basic-gl-style/blob/master/style.json for thoughts...

    var paint = defaultPaint;
    if(styleInfo == null) {
      styleInfo = classColorStyles;
    } else {
      if(styleInfo.containsKey('type')) {
        if(styleInfo['type'] == 'line') {
          paint.style = PaintingStyle.stroke;
          stringToHsl(styleInfo['paint']['line-color']);
        } else if(styleInfo['type'] == 'fill') {
          paint.style = PaintingStyle.fill;
        }
      }
    }

    if (type == 'POLYGON' || type == 'POINT') {
      paint.style = PaintingStyle.fill;
    } else {
      paint.style = PaintingStyle.stroke;
    }

    // bit ugly below, needs rejigging
    if(classColorStyles.containsKey(layerString)) {
      if(classColorStyles[layerString].containsKey(featureInfo['class'])) {
        paint.color = classColorStyles[layerString][featureInfo['class']];
      } else {
        paint.color = classColorStyles[layerString]['default'];
      }
    } else {
      ///print("NOTHING FOUND FOR $layerString with class ${featureInfo['class']}");
    }

    if(classStrokeWidthClasses.containsKey(layerString)) {
      if(classStrokeWidthClasses[layerString].containsKey(featureInfo['class'])) {
        paint.strokeWidth = classStrokeWidthClasses[layerString][featureInfo['class']];
      } else {
        paint.strokeWidth = classStrokeWidthClasses[layerString]['default'];
      }
    }

    paint.strokeWidth = paint.strokeWidth / sizeDiffRatio;

    return paint;
  }

  static Future<Map<dynamic,dynamic>> getJsonTestStyle(filename) async {
    return await rootBundle.loadString('assets/data/streets.json')
    .then((contents){
      Map<dynamic,dynamic> json = jsonDecode(contents);
      return json;
    });
  }
}

void checkMapboxFilters(Map<dynamic,dynamic> style, String haveLayer,Map featureInfo) {
  var paintType = PaintingStyle.stroke;

  try {
    for (var layer in style['layers']) {

      var matches = false;

      if (layer.containsKey('source-layer')) {

        if (layer['source-layer'] != haveLayer) continue;
        matches = true;
      }
      if (layer.containsKey('class')) {

        if (layer['class'] != featureInfo['class']) continue;
        matches = true;
      }

      if(matches == false) continue;

      if(layer.containsKey('type')) {
        if(layer['type'] == 'line') {
          paintType = PaintingStyle.stroke;
          if(layer.containsKey('paint')) {
            stringToHsl(layer['paint']['line-color']);
          }

        } else if(layer['type'] == 'fill') {
          if(layer.containsKey('paint')) {
            stringToHsl(layer['paint']['fill-color']);
          }

          paintType = PaintingStyle.stroke;
        } else if(layer['type'] == 'symbol') {
          // todo
        }
      }

      break;
    }
  } catch(e) {
    print("exception $e");
  }




}

List stringToHsl(string) {
  RegExp exp = new RegExp(r"/hsl\((\d+),\s*([\d.]+)%,\s*([\d.]+)%\)/g");
  var matches = exp.allMatches(string);
  return matches.toList();
}