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
    ///..strokeCap = StrokeCap.round
    ..isAntiAlias = false;

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

    "default": {
      'include': false,
      'default': { 'color': Colors.grey, 'min': 0, 'max': 21},
    },

    ///mapbox streets
    "road": {
      'include': true,
      'default':      { 'color': Colors.black26,  'min': 15, 'max' : 21 },
      'service':      { 'color':  Colors.white30, 'min': 14, 'max' : 21 },
      'street':       { 'color': Colors.white54,  'min': 15, 'max' : 21 },
      'pedestrian':   { 'color': Colors.white54,  'min': 15, 'max' : 21 },
      'street_limited': { 'color': Colors.white54, 'min': 15, 'max' : 21 },
      'motorway' :    { 'color': Colors.deepPurple, 'min': 10, 'max' : 21 },
      'trunk':        { 'color': Colors.deepPurple, 'min': 10, 'max' : 21 },
      'trunk_link':   { 'color': Colors.deepPurple, 'min': 10, 'max' : 21 },
      'primary' :     { 'color': Colors.yellow,     'min': 11, 'max' : 21 },
      'primary_link': { 'color': Colors.yellow,     'min': 11, 'max' : 21 },
      'secondary':    { 'color': Colors.orangeAccent, 'min': 12, 'max' : 21 },
      'secondary_link': { 'color': Colors.orangeAccent, 'min': 12, 'max' : 21 },
      'tertiary':     { 'color': Colors.yellow,     'min': 13, 'max' : 21 },
      'tertiary_link': { 'color': Colors.yellow,    'min': 13, 'max' : 21 },
      "path":         { 'color': Colors.white54,    'min': 16, 'max' : 21 },
      'track':        { 'color': Colors.white38,    'min': 16, 'max' : 21 },
      'residential':  { 'color': Colors.white54,    'min': 16, 'max' : 21 },
      'major_rail':   { 'color': Colors.black,      'min': 10, 'max' : 21 },
      'minor_rail':   { 'color': Colors.black12,    'min': 11, 'max' : 21 },
      'service_rail': { 'color': Colors.black,      'min': 10, 'max' : 21 },
      'construction': { 'color': Colors.brown,      'min': 14, 'max' : 21 },
      'ferry':        { 'color': Colors.brown,      'min': 13, 'max' : 21 },
    },

    "motorway_junction": {
      'include': true,
      'default': { 'color': Colors.deepPurple, 'min': 0, 'max' : 21 },
      },

      "landuse": {
        'include': true,
        'default':  { 'color': Colors.lightGreen, 'min': 14, 'max': 21},
        'airport':  { 'color': Colors.grey,       'min': 12, 'max': 21},
        'hospital': { 'color': Colors.grey,       'min': 14, 'max': 21},
        'sand':     { 'color': Colors.amber,      'min': 14, 'max': 21},
        'playground': { 'color': Colors.blueGrey, 'min': 14, 'max': 21},
        'grass':    { 'color': Colors.lightGreen, 'min': 14, 'max': 21},
        'park':     { 'color': Colors.lightGreen, 'min': 14, 'max': 21},
        'pitch':    { 'color': Colors.green,      'min': 14, 'max': 21},
        'parking':  { 'color': Colors.blueGrey,   'min': 14, 'max': 21},
        'wood':     { 'color': Colors.green,      'min': 14, 'max': 21},
        'agriculture': { 'color': Colors.brown,   'min': 14, 'max': 21},
        'school':   { 'color': Colors.grey,       'min': 14, 'max': 21},
        'scrub' :   { 'color': Colors.grey,       'min': 14, 'max': 21},
        'cemetery': { 'color': Colors.grey,       'min': 14, 'max': 21},
        'rock' :    { 'color': Colors.grey,       'min': 14, 'max': 21},
      },
      "landuse_overlay": {
        'include': false,
        'default': { 'color': Colors.green, 'min': 0, 'max': 21},
        "national_park": { 'color': Colors.green, 'min': 15, 'max': 21},
      },

      "water": {
        'include': true,
        'default': { 'color': Colors.blue, 'min': 11, 'max': 21},
      },
      "waterway": {
        'include': true,
        'default': { 'color': Colors.blue, 'min': 11, 'max': 21},
        'river':   { 'color': Colors.blue, 'min': 13, 'max': 21},
        'canal': { 'color': Colors.blue, 'min': 13, 'max': 21},
      },
      "transit_stop": {
          'include': true,
          "default": { 'color': Colors.deepOrange, 'min': 13, 'max': 21 }
      },

      "building": {
        'include': false,
        "default": { 'color': Colors.blueGrey, 'min': 16, 'max': 21 },
      },
      "structure": {
        'include': false,
        "default": { 'color': Colors.blueGrey, 'min': 16, 'max': 21 },
        'fence': { 'color': Colors.brown, 'min': 17, 'max': 21 },
      },
      "barrierline": {
        'include': true,
        "default": { 'color': Colors.purple, 'min': 0, 'max': 21},
      },
      "aeroway": {
        'include': true,
        "default": { 'color': Colors.orange, 'min': 11, 'max': 21},
      },
      "waterway_label": {
        'include': false,
        'default': { 'color': Colors.black54, 'min': 15, 'max': 21},
      },
      "poi_label": {
        'include': false,
        'default': { 'color': Colors.orangeAccent, 'min': 15, 'max': 21},
      },
      "transit_stop_label": {
        'include': true,
        'default': { 'color': Colors.black54, 'min': 15, 'max': 21},
      },
      "road_point": {
        'include': true,
        'default': { 'color': Colors.black54, 'min': 15, 'max': 21},
      },
      "road_label": {
        'include': true,
        "default": { 'color': Colors.black, 'min': 15, 'max': 21},
      },
      "rail_station_label": {
        'include': true,
        "default": { 'color': Colors.black, 'min': 15, 'max': 21},
      },
      "natural_label": {
        'include': true,
        'default': { 'color': Colors.brown, 'min': 15, 'max': 21},
      },


      'place_label': {
        'include': true,
        'default':    { 'color': Colors.grey, 'min': 0, 'max': 21},
        'settlement': { 'color': Colors.grey, 'min': 9, 'max': 21},
        'settlement_subdivision': { 'color': Colors.grey, 'min': 14, 'max': 21},
        'park_like':  { 'color': Colors.grey, 'min': 14, 'max': 21},
      },

      "airport_label": {
        'include': true,
        'default': { 'color': Colors.grey, 'min': 0, 'max': 21},
      },
      "housenum_label": {
        'include': false,
        'default': { 'color': Colors.grey, 'min': 17, 'max': 21},
      },
      "mountain_peak_label": {
        'include': false,
        'default': { 'color': Colors.brown, 'min': 16, 'max': 21},
      },
      "state_label": {
        'include': true,
        'default': { 'color': Colors.grey, 'min': 13, 'max': 21},
      },
      "marine_label": {
        'include': true,
        'default': { 'color': Colors.blueGrey, 'min': 0, 'max': 21},
      },
      "country_label": {
        'include': true,
        'default': { 'color': Colors.blueGrey, 'min': 0, 'max': 21},
      },

      ///traffic mapbox
      'traffic': {
        'include': true,
        'default': { 'color': Colors.blueGrey, 'min': 15, 'max': 21},
        'primary': { 'color': Colors.blue, 'min': 15, 'max': 21},
        'secondary': { 'color': Colors.blue, 'min': 15, 'max': 21},
        'tertiary': { 'color': Colors.black38, 'min': 15, 'max': 21},
        'street': { 'color': Colors.black26, 'min': 15, 'max': 21},
      },

      ///mapbox terrain
      'contour': {
        'include': false,
        'default': { 'color': Colors.grey, 'min': 0, 'max': 21},
      },
      'landcover': {
        'include': false,
        'default': { 'color': Colors.grey, 'min': 0, 'max': 21 },
        'grass': {   'color': Colors.green, 'min': 0, 'max': 21 },
        'crop': {    'color': Colors.yellow, 'min': 0, 'max': 21 },
      },
      'hillshade': {
        'include': false,
        'default': { 'color': Colors.grey, 'min': 0, 'max': 21 },
        'shadow': { 'color': Colors.grey, 'min': 0, 'max': 21 },
      },
      ///tegola   https://tegola.io/styles/hot-osm.json
     'buildings': {
        'include': false,
        'default': { 'color': Colors.grey , 'min': 0, 'max': 21},
      },
      'land': {
        'include': false,
        'default': { 'color': Colors.green , 'min': 0, 'max': 21},
      },
      'landuse_areas' : {
        'include': false,
        'default': { 'color': Colors.brown, 'min': 0, 'max': 21},
        'leisure': { 'color': Colors.green , 'min': 0, 'max': 21},
      },
      'landcover': {
        'include': false,
        'default': { 'color': Colors.grey, 'min': 0, 'max': 21},
        'grass': { 'color': Colors.green, 'min': 0, 'max': 21},
        'crop': { 'color': Colors.yellow, 'min': 0, 'max': 21},
      },
      'hillshade': {
        'include': false,
        'default': { 'color': Colors.grey, 'min': 0, 'max': 21},
        'shadow': { 'color': Colors.grey, 'min': 0, 'max': 21},
      },
      'transport_lines': {
        'include': true,
        'default': { 'color': Colors.white60, 'min': 0, 'max': 21},
      },
     'amenity_points' : {
        'include': true,
        'default': { 'color': Colors.white60, 'min': 0, 'max': 21},
      },

  };

  static Map<String, Map<String, double>> classStrokeWidthClasses = { /// maybe move this into colorstyles above and rename
    "default": { "default": 2 },
    "road": { "default": 2, "street_limited": 2, "pedestrian" : 1, "path" : 3, "service" : 1, 'motorway': 6,'street': 2, "primary" : 4, "secondary": 3, "tertiary": 2, "trunk": 4, "trunk_link": 4, "major_rail": 3, "minor_rail": 2, "service_rail" : 1, },
  };

  static bool includeFeature(layerString, type, thisClass, zoom) { //reduce code...
    var includeFeature = classColorStyles['default']['include'];

    if(classColorStyles.containsKey(layerString)) {
      includeFeature = classColorStyles[layerString]['include'];

      var classOptions = classColorStyles['default'];

      if( classColorStyles[layerString].containsKey(thisClass) ) {
        classOptions = classColorStyles[layerString][thisClass];
      }

      if( includeFeature && classOptions.containsKey('min') ) {
        if( zoom < classOptions['min'] ) {
          includeFeature = false;
        }
      }

      if( includeFeature && classOptions.containsKey('max') ) {
        if( zoom > classOptions['max'] ) {
          includeFeature = false;
        }
      }
    } else {
      print("[$layerString] is NOT in styling list");
    }

    return includeFeature;
  }

  static Paint getStyle2(layerString, type, className, tileZoom, scale, diffRatio) {
    var paint = defaultPaint;
    var styleInfo = classColorStyles;

    if(type == 'path' || type == 'line')    paint.style = PaintingStyle.stroke; // are roads filled ?
    if(type == 'polygon' || type == 'fill') paint.style = PaintingStyle.fill;

    if(styleInfo.containsKey(layerString)) {
      if(styleInfo[layerString].containsKey(className)) {
        paint.color = styleInfo[layerString][className]['color'];
      } else {
        paint.color = styleInfo[layerString]['default']['color'];
      }
    }

    if(classStrokeWidthClasses.containsKey(layerString)) {
      paint.strokeWidth = classStrokeWidthClasses[layerString][className] ?? classStrokeWidthClasses[layerString]['default'];
    } else {
      paint.strokeWidth = classStrokeWidthClasses['default']['default'];
    }

    paint.strokeWidth =  (paint.strokeWidth / scale); ///.ceilToDouble();

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
          if(layer.containsKey('paint')) {
            stringToHsl(layer['paint']['line-color']);
          }

        } else if(layer['type'] == 'fill') {
          if(layer.containsKey('paint')) {
            stringToHsl(layer['paint']['fill-color']);
          }
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