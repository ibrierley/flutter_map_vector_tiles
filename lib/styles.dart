import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


class Styles {

  static Map<String, int> defaultLayerOrder() {
    return {
      'water' : 15,
      'waterway' : 3,
      'landuse': 2,
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
      'include': true,
      'default': { 'color': Colors.yellow, 'min': 10, 'max': 21},
    },

    "admin": {
      'include': true,
      'default': { 'color': Colors.deepPurple, 'min': 0, 'max': 21, 'hairline': { "<" : 0 } },
    },

    ///mapbox streets
    ///hairline = switch to a hairline width of 0 for optimisation at low zoom levels where we dont care
    "road": {
      'include': true,
      'default':      { 'color': Colors.blueGrey.shade900,    'min': 15, 'max' : 21, 'hairline': { "<" : 14 } },
      'service':      { 'color': Colors.blueGrey.shade600,    'min': 14, 'max' : 21, 'hairline': { "<" : 14 } },
      'street':       { 'color': Colors.blueGrey.shade600,    'min': 15, 'max' : 21, 'hairline': { "<" : 14 } },
      'pedestrian':   { 'color': Colors.blueGrey.shade600,    'min': 15, 'max' : 21, 'hairline': { "<" : 14 } },
      'street_limited': { 'color': Colors.blueGrey.shade600,  'min': 15, 'max' : 21, 'hairline': { "<" : 14 } },
      'motorway' :    { 'color': Colors.blueGrey.shade800,    'min': 5,  'max' : 21, 'hairline': { "<" : 10 } }, ///
      'trunk':        { 'color': Colors.blueGrey.shade700,    'min': 5,  'max' : 21, 'hairline': { "<" : 10 } }, ///
      'trunk_link':   { 'color': Colors.blueGrey.shade700,    'min': 7,  'max' : 21, 'hairline': { "<" : 10 } }, ///
      'primary' :     { 'color': Colors.blueGrey.shade600,    'min': 17, 'max' : 21, 'hairline': { "<" : 13 } }, // A roads
      'primary_link': { 'color': Colors.blueGrey.shade600,    'min': 17, 'max' : 21, 'hairline': { "<" : 13 } },
      'secondary':    { 'color': Colors.blueGrey.shade500,    'min': 12, 'max' : 21, 'hairline': { "<" : 14 } },
      'secondary_link': { 'color': Colors.blueGrey.shade500,  'min': 12, 'max' : 21, 'hairline': { "<" : 14 } },
      'tertiary':     { 'color': Colors.blueGrey.shade500,    'min': 13, 'max' : 21, 'hairline': { "<" : 14 } },
      'tertiary_link': { 'color': Colors.blueGrey.shade400,   'min': 13, 'max' : 21, 'hairline': { "<" : 14 } },
      'path':         { 'color': Colors.brown.shade800,       'min': 16, 'max' : 21, 'hairline': { "<" : 14 } },
      'track':        { 'color': Colors.brown.shade800,       'min': 16, 'max' : 21, 'hairline': { "<" : 14 } },
      'residential':  { 'color': Colors.blue,                 'min': 16, 'max' : 21, 'hairline': { "<" : 14 } },
      'major_rail':   { 'color': Colors.blueGrey.shade900,    'min': 13, 'max' : 21, 'hairline': { "<" : 12 } }, // make prob darker than roads...
      'minor_rail':   { 'color': Colors.blueGrey.shade600,    'min': 14, 'max' : 21, 'hairline': { "<" : 13 } },
      'service_rail': { 'color': Colors.blueGrey.shade500,    'min': 13, 'max' : 21, 'hairline': { "<" : 13 } },
      'construction': { 'color': Colors.brown,                'min': 14, 'max' : 21, 'hairline': { "<" : 13 } },
      'ferry':        { 'color': Colors.brown,                'min': 13, 'max' : 21, 'hairline': { "<" : 13 } },
    },

    "motorway_junction": {
      'include': true,
      'default': { 'color': Colors.deepPurple, 'min': 6, 'max' : 21 },
      },

      "landuse": {
        'include': true,
        'default':  { 'color': Colors.lightGreen,          'min': 14, 'max': 21},
        'airport':  { 'color': Colors.grey,                'min': 12, 'max': 21},
        'hospital': { 'color': Colors.grey,                'min': 14, 'max': 21},
        'sand':     { 'color': Colors.amber,                'min': 12, 'max': 21},
        'playground': { 'color': Colors.green.shade400,     'min': 14, 'max': 21},
        'grass':    { 'color': Colors.lightGreen,          'min': 12, 'max': 21},
        'park':     { 'color': Colors.lightGreen,           'min': 12, 'max': 21},
        'pitch':    { 'color': Colors.green,                'min': 12, 'max': 21},
        'parking':  { 'color': Colors.green.shade100,       'min': 14, 'max': 21},
        'wood':     { 'color': Colors.green,                'min': 0, 'max': 21},
        'agriculture': { 'color': Colors.green.shade700,    'min': 12, 'max': 21},
        'school':   { 'color': Colors.grey,                 'min': 13, 'max': 21},
        'scrub' :   { 'color': Colors.grey,                 'min': 0, 'max': 21},
        'cemetery': { 'color': Colors.green.shade600,       'min': 14, 'max': 21},
        'rock' :    { 'color': Colors.grey,                 'min': 0, 'max': 21},
        'glacier' : { 'color': Colors.grey,                 'min': 12, 'max': 21},
      },
      "landuse_overlay": {
        'include': true,
        'default': { 'color': Colors.green, 'min': 12, 'max': 21},
        "national_park": { 'color': Colors.green, 'min': 12, 'max': 21},
        "wetland_noveg" : { 'color': Colors.grey.shade900, 'min': 11, 'max': 21},
        "wetland" : { 'color': Colors.grey.shade900, 'min': 12, 'max': 21},
      },

      "water": {
        'include': true,
        'default': { 'color': Colors.blue.shade500, 'min': 0, 'max': 21},
      },
      "waterway": {
        'include': true,
        'default': { 'color': Colors.blue.shade700, 'min': 13, 'max': 21},
        'river':   { 'color': Colors.blue.shade600, 'min': 12, 'max': 21},
        'canal': { 'color': Colors.blue.shade600, 'min': 12, 'max': 21},
        'stream': { 'color': Colors.blue.shade900, 'min': 14, 'max': 21},
      },
      "transit_stop": {
          'include': true,
          "default": { 'color': Colors.deepOrange, 'min': 14, 'max': 21 }
      },

      "building": {
        'include': true,
        "default": { 'color': Colors.grey.shade600, 'min': 15, 'max': 21 },
      },
      "structure": {
        'include': true,
        "default": { 'color': Colors.grey.shade600, 'min': 15, 'max': 21 },
        'fence': { 'color': Colors.brown.shade300, 'min': 15, 'max': 21 },
      },
      "barrierline": {
        'include': true,
        "default": { 'color': Colors.purple, 'min': 12, 'max': 21},
      },
      "aeroway": {
        'include': true,
        "default": { 'color': Colors.orange, 'min': 12, 'max': 21},
      },
      "waterway_label": {
        'include': true,
        'default': { 'color': Colors.black, 'min': 15, 'max': 21},
      },
      "poi_label": {
        'include': true,
        'default': { 'color': Colors.orangeAccent, 'min': 15, 'max': 21},
      },
      "transit_stop_label": {
        'include': true,
        'default': { 'color': Colors.black, 'min': 14, 'max': 21},
      },
      "road_point": {
        'include': true,
        'default': { 'color': Colors.black, 'min': 14, 'max': 21},
      },
      "road_label": {
        'include': true,
        "default": { 'color': Colors.black, 'min': 14, 'max': 21},
      },
      "rail_station_label": {
        'include': true,
        "default": { 'color': Colors.black, 'min': 14, 'max': 21},
      },
      "natural_label": {
        'include': true,
        'default': { 'color': Colors.brown, 'min': 14, 'max': 21},
        'landform': { 'color': Colors.brown, 'min': 12, 'max': 21},
        'sea': { 'color': Colors.black, 'min': 0, 'max': 21},
        'stream': { 'color': Colors.black, 'min': 14, 'max': 21},
      },


      'place_label': {
        'include': true,
        'default':    { 'color': Colors.black, 'min': 0, 'max': 21},
        'settlement': { 'color': Colors.black, 'min': 0, 'max': 21},
        'settlement_subdivision': { 'color': Colors.grey, 'min': 14, 'max': 21},
        'park_like':  { 'color': Colors.black, 'min': 14, 'max': 21},
        // types, refine by class doesn't reduce labels enough, but types is useful here..
        'types' : {
          'village':  { 'color': Colors.black, 'min': 15, 'max': 21},
          'suburb':   { 'color': Colors.black, 'min': 15, 'max': 21},
          'hamlet':   { 'color': Colors.black, 'min': 15, 'max': 21},
          'city':     { 'color': Colors.black, 'min': 11, 'max': 21},
          'town':     { 'color': Colors.black, 'min': 12, 'max': 21},
        }
      },

      "airport_label": {
        'include': true,
        'default': { 'color': Colors.black, 'min': 0, 'max': 21},
      },
      "housenum_label": {
        'include': true,
        'default': { 'color': Colors.black, 'min': 17, 'max': 21},
      },
      "mountain_peak_label": {
        'include': true,
        'default': { 'color': Colors.black, 'min': 16, 'max': 21},
      },
      "state_label": {
        'include': true,
        'default': { 'color': Colors.black, 'min': 13, 'max': 21},
      },
      "marine_label": {
        'include': true,
        'default': { 'color': Colors.black, 'min': 0, 'max': 21},
      },
      "country_label": {
        'include': true,
        'default': { 'color': Colors.black, 'min': 0, 'max': 21},
      },

      ///traffic mapbox
      'traffic': {
        'include': true,
        'default': { 'color': Colors.blueGrey, 'min': 15, 'max': 21},
        'primary': { 'color': Colors.blue, 'min': 15, 'max': 21},
        'secondary': { 'color': Colors.blue, 'min': 15, 'max': 21},
        'tertiary': { 'color': Colors.grey, 'min': 15, 'max': 21},
        'street': { 'color': Colors.grey, 'min': 15, 'max': 21},
      },

      ///mapbox terrain
      'contour': {
        'include': false,
        'default': { 'color': Colors.grey, 'min': 0, 'max': 21},
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
        'default': { 'color': Colors.green.shade400, 'min': 0, 'max': 21},
        'leisure': { 'color': Colors.green , 'min': 0, 'max': 21},
      },
      'landcover': {
        'include': false,
        'default': { 'color': Colors.green.shade50, 'min': 0, 'max': 21},
        'grass': { 'color': Colors.green, 'min': 0, 'max': 21},
        'crop': { 'color': Colors.green.shade700, 'min': 0, 'max': 21},
      },
      'hillshade': {
        'include': false,
        'default': { 'color': Colors.green.shade100, 'min': 0, 'max': 21},
        'shadow': { 'color': Colors.grey, 'min': 0, 'max': 21},
      },
      'transport_lines': {
        'include': true,
        'default': { 'color': Colors.grey, 'min': 0, 'max': 21},
      },
     'amenity_points' : {
        'include': true,
        'default': { 'color': Colors.grey, 'min': 0, 'max': 21},
      },

  };

  static Map<String, Map<String, double>> classStrokeWidthClasses = { /// maybe move this into colorstyles above and rename
    "default": { "default": 2 },
    "admin" : { "default" : 0.8 },
    "road": { "default": 2, "street_limited": 2, "pedestrian" : 1, "path" : 2, "service" : 2, 'motorway': 2,'street': 2, "primary" : 2, "secondary": 2, "tertiary": 2, "trunk": 2, "trunk_link": 2, "major_rail": 2, "minor_rail": 1, "service_rail" : 1, },
  };

  static bool includeFeature(layerString, type, thisClass, zoom) { //reduce code...
    var includeFeature = classColorStyles['default']['include'];

    if(classColorStyles.containsKey(layerString)) {
      includeFeature = classColorStyles[layerString]['include'];

      var classOptions = classColorStyles[layerString]['default'];

      if( classColorStyles[layerString].containsKey('types') && classColorStyles[layerString]['types'].containsKey(type)) { // types match in styling
        classOptions = classColorStyles[layerString]['types'][type];

      } else if( classColorStyles[layerString].containsKey(thisClass) ) { // normal class match in styling
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

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..strokeWidth = 2
    ///..strokeCap = StrokeCap.round
      ..isAntiAlias = false;
    var styleInfo = classColorStyles;


    if(type == 'LINESTRING' || type == 'line') paint.style = PaintingStyle.stroke; // are roads filled ?
    if(type == 'POLYGON'    || type == 'fill') paint.style = PaintingStyle.fill;

    var useHairline = false;

    if(styleInfo.containsKey(layerString)) {
      if(styleInfo[layerString].containsKey(className)) {
        if(styleInfo[layerString][className].containsKey('hairline')) { // tidy a bit
          if( tileZoom < styleInfo[layerString][className]['hairline']['<']) {
            useHairline = true;
          }
        }
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

    if( useHairline ) paint.strokeWidth = 0.0;

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
