import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


class Styles {

  /// https://github.com/mapbox/mapbox-gl-js/issues/4225
  static Map<String, int> defaultLayerOrder() {
    return {
      'landuse': 5,
      'waterway' : 3,
      'water' : 2,
      'aeroway': 7,
      'data': 9,
      'barrierline': 11,
      'building' : 13,
      'landuse_overlay': 15,
      'tunnel': 17,
      'structure': 19,
      'road': 21,
      'bridge': 23,
      'motorway_junction': 25,
      'airport_label': 27,
      'natural_label' : 29,
      'water_label': 30,
      'poi_label' : 31,
      'transit_stop_label' : 33,
      'place_label' : 35,
      'house_num_label': 37,
    };
  }

  static Map<String, Map<String, dynamic>> classColorStyles = {

    "default": {
      'include': true,
      'default':  [ [0, 22, { 'color': Colors.purple, 'strokeWidth': 0.0}],
      ],
    },

    "admin": {
      'include': true,
      'default':  [ [0, 22, { 'color': Colors.deepPurple, 'strokeWidth': 0.0}],
      ],
    },

    ///mapbox streets
    ///hairline = switch to a hairline width of 0 for optimisation at low zoom levels where we dont care

    "road": {
      'include': true,
      'default':      [ [0, 22, { 'color': Colors.orange, 'strokeWidth' : 0.0  }     ],
                        [16,22, { 'color': Colors.orange, 'strokeWidth' : 2.0 }     ],
      ],
      'service':      [ [12, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'street':       [ [15, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'pedestrian':   [ [15, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'street_limited':[[15, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'motorway':     [ [9, 22, { 'color': Colors.orange,           'strokeWidth' : 0.0  }     ],
                        [15,22, { 'color': Colors.orange.shade200, 'strokeWidth' : 3.0 }     ],
                        [14,22, { 'color': Colors.orange.shade100, 'strokeWidth' : 10.0 }     ],
      ],
      'motorway_link':  [ [9, 22, { 'color': Colors.orange,        'strokeWidth' : 0.0  }     ],
                        [15,22, { 'color': Colors.orange.shade200, 'strokeWidth' : 3.0 }     ],
                        [14,22, { 'color': Colors.orange.shade100, 'strokeWidth' : 10.0 }     ],
      ],
      'trunk':        [ [9, 22, { 'color': Colors.orangeAccent,    'strokeWidth' : 0.0  }     ],
                        [15,22, { 'color': Colors.orange.shade200, 'strokeWidth' : 3.0 }     ],
                        [17,22, { 'color': Colors.orange.shade100, 'strokeWidth' : 10.0 }     ],
      ],
      'trunk_link':    [[9, 22, { 'color': Colors.orangeAccent,     'strokeWidth' : 0.0  }     ],
                        [15,22, { 'color': Colors.orange.shade100, 'strokeWidth' : 3.0 }     ],
                        [17,22, { 'color': Colors.orange.shade100, 'strokeWidth' : 10.0 }     ],
      ],
      'primary':     [  [12, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'primary_link': [ [12, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'secondary':   [  [14, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 9.0 }     ],
      ],
      'secondary_link':[[14, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 9.0 }     ],
      ],
      'tertiary':     [ [14, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 9.0 }     ],
      ],
      'tertiary_link': [[14, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }   ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 9.0 }     ],
      ],
      'residential':  [ [0, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [16,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 6.0 }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 8.0 }     ],
      ],
      'path':         [ [0, 22, { 'color': Colors.brown.shade400,    'strokeWidth' : 2.0  }     ],
      ],
      'track':        [ [0, 22, { 'color': Colors.brown.shade300,    'strokeWidth' : 2.0  }     ],
      ],
      'major_rail':   [ [0, 22, { 'color': Colors.blueGrey.shade900, 'strokeWidth' : 1.0  }     ],
      ],
      'minor_rail':   [ [0, 22, { 'color': Colors.blueGrey.shade900, 'strokeWidth' : 1.0  }     ],
      ],
      'service_rail': [ [0, 22, { 'color': Colors.blueGrey.shade900, 'strokeWidth' : 1.0  }     ],
      ],
      'construction': [ [0, 22, { 'color': Colors.brown,              'strokeWidth' : 0.0  }     ],
      ],
      'ferry':        [ [0, 22, { 'color': Colors.blue.shade900,      'strokeWidth' : 0.0  }     ],
      ],
      'golf':         [ [15, 22, { 'color': Colors.brown.shade400,    'strokeWidth' : 2.0  }     ],
      ],
      'aerialway':    [ [14, 22, { 'color': Colors.brown.shade400,    'strokeWidth' : 2.0  }     ],
      ],
    },

    "motorway_junction": {
      'include': true,
      'default':  [ [0, 22, { 'color': Colors.deepPurple, 'strokeWidth': 5.0}],
      ],
    },

    "landuse": {
      'include': true,
      'default':  [ [14, 22, { 'color': Colors.lightGreen,   'strokeWidth': 0.0 } ],
      ],
      'airport':  [ [13, 21, { 'color': Colors.grey,        'strokeWidth': 0.0 } ],
      ],
      'hospital':  [ [15, 21, { 'color': Colors.grey,        'strokeWidth': 0.0 } ],
      ],
      'sand':     [ [12, 21, { 'color': Colors.amber,       'strokeWidth': 0.0 } ],
      ],
      'playground':[[14, 22, { 'color': Colors.green.shade400, 'strokeWidth': 0.0 } ],
      ],
      'grass':    [ [13, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0 } ],
      ],
      'park':     [ [13, 22,  { 'color': Colors.lightGreen, 'strokeWidth': 0.0 } ],
      ],
      'pitch':     [ [13, 22,  { 'color': Colors.green,     'strokeWidth': 0.0 } ],
      ],
      'parking':     [ [14, 22,  { 'color': Colors.green.shade100, 'strokeWidth': 0.0 } ],
      ],
      'wood':       [ [10, 22,  { 'color': Colors.green.shade800,   'strokeWidth': 0.0 } ],
      ],
      'agriculture':  [ [13, 22,  { 'color': Colors.green.shade700,   'strokeWidth': 0.0 } ],
      ],
      'school':     [ [14, 22,  { 'color': Colors.grey,             'strokeWidth': 0.0 } ],
      ],
      'scrub':     [ [10, 22,  { 'color': Colors.green.shade600,   'strokeWidth': 0.0 } ],
      ],
      'cemetery':   [ [15, 22,  { 'color': Colors.green.shade700,   'strokeWidth': 0.0 } ],
      ],
      'rock':       [ [12, 22,  { 'color': Colors.grey,   'strokeWidth': 0.0 } ],
      ],
      'glacier':   [ [12, 22,  { 'color': Colors.grey,   'strokeWidth': 0.0 } ],
      ],
    },

    "landuse_overlay": {
      'include': true,
      'default': [ [12, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
      ],
      'national_park': [ [12, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
      ],
      'wetland_noveg': [ [11, 22, { 'color': Colors.blueGrey, 'strokeWidth': 0.0}],
      ],
      'wetland': [ [12, 22, { 'color': Colors.blue.shade700, 'strokeWidth': 0.0}],
      ],
    },

    "water": {
      'include': true,
      'default': [ [0, 22, { 'color': Colors.blue.shade500, 'strokeWidth': 0.0}],
      ],
    },

    "waterway": {
      'include': true,
      'default': [ [13, 22, { 'color': Colors.blue.shade700, 'strokeWidth': 0.0}],
      ],
      'river': [ [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
      ],
      'canal': [ [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
      ],
      'stream': [ [14, 22, { 'color': Colors.blue.shade900, 'strokeWidth': 0.0}],
      ],
      'stream_intermittent': [ [13, 22, { 'color': Colors.blue.shade900, 'strokeWidth': 0.0}],
      ],
      'ditch': [ [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
      ],
      'drain': [ [13, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
      ],
    },

    "transit_stop": {
      'include': true,
      'default': [ [14, 22, { 'color': Colors.deepOrange, 'strokeWidth': 0.0}],
      ],
    },

    "building": {
      'include': true,
      'default': [ [15, 22, { 'color': Colors.grey.shade600, 'strokeWidth': 0.0}],
      ],
    },

    "structure": {
      'include': true,
      'default': [ [15, 22, { 'color': Colors.grey.shade600, 'strokeWidth': 0.0}],
      ],
      'fence':  [ [15, 22, { 'color': Colors.brown.shade300, 'strokeWidth': 0.0}],
      ],
      'hedge':  [ [15, 22, { 'color': Colors.brown.shade300, 'strokeWidth': 0.0}],
      ],
      'gate':  [ [16, 22, { 'color': Colors.brown.shade600, 'strokeWidth': 0.0}],
      ],
      'land':  [ [16, 22, { 'color': Colors.brown.shade300, 'strokeWidth': 0.0}], // eg pier
      ],
      'cliff':  [ [16, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}], // eg pier
      ],
    },

    "barrierline": {
      'include': true,
      'default': [ [12, 22, { 'color': Colors.purple, 'strokeWidth': 0.0}],
      ],
    },

    "aeroway": {
      'include': true,
      'default': [ [12, 22, { 'color': Colors.orange, 'strokeWidth': 0.0}],
      ],
    },

    "waterway_label": {
      'include': true,
      'default': [ [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "poi_label": {
      'include': true,
      'default':        [ [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
      'food_and_drink': [ [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
      'religion':      [ [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
      'sport_and_leisure':[ [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
      'food_and_drink_stores': [ [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
      'park_like': [ [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
      'education': [ [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
      'public_facilities': [ [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
      'commercial_services ': [ [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "transit_stop_label": {
      'include': true,
      'default': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "road_point": {
      'include': true,
      'default': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "road_label": {
      'include': true,
      'default': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "rail_station_label": {
      'include': true,
      'default': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "natural_label": {
      'include': true,
      'default': [ [14, 22, { 'color': Colors.brown, 'strokeWidth': 0.0}],
      ],
      'landform':  [ [12, 22, { 'color': Colors.brown, 'strokeWidth': 0.0}],
      ],
      'sea':  [ [12, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
      ],
      'stream':  [ [12, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
      ],
      'water':  [ [12, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
      ],
      'canal':  [ [15, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
      ],
    },

    "place_label": {
      'include': true,
      'default': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
      ],
      'settlement':  [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
      ],
      'settlement_subdivision':  [ [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
      ],
      'park_like':  [ [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
      ],
      'types' : {
        'village':  [ [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}] ], //15
        'suburb':   [ [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}] ], //15
        'hamlet':   [ [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}] ], //15
        'city':     [ [6, 22, { 'color': Colors.black, 'strokeWidth': 0.0}] ], //6
        'town':     [ [10, 22, { 'color': Colors.black, 'strokeWidth': 0.0}] ], //12
      }
    },

    "airport_label": {
      'include': true,
      'default': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "housenum_label": {
      'include': true,
      'default': [ [17, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "mountain_peak_label": {
      'include': true,
      'default': [ [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "state_label": {
      'include': true,
      'default': [ [13, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "marine_label": {
      'include': true,
      'default': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    "country_label": {
      'include': true,
      'default': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 2}],
      ],
    },

    /*

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
      */


  };

  static bool includeFeature(layerString, type, thisClass, zoom) { //reduce code...
    var includeFeature = classColorStyles['default']!['include'];

    if(classColorStyles.containsKey(layerString)) {
      includeFeature = classColorStyles[layerString]!['include'];

      var classOptions = classColorStyles[layerString]!['default'];

      if( classColorStyles[layerString]!.containsKey('types') && classColorStyles[layerString]!['types'].containsKey(type)) { // types match in styling
        classOptions = classColorStyles[layerString]!['types'][type];

      } else if( classColorStyles[layerString]!.containsKey(thisClass) ) { // normal class match in styling
        classOptions = classColorStyles[layerString]![thisClass];
      }

      if( includeFeature && classOptions is List ) {
        var listIncludes = false;
        //print("Checking $layerString $type $thisClass ");
        for( var entry in classOptions ) {
          if( zoom >= entry[0] && zoom <= entry[1]) {
            listIncludes = true; // we have at least one entry for this zoom
            break;
          }
        }
        if( listIncludes == false ) {
          includeFeature = false;
        }
      }
    }

    return includeFeature;
  }

  static Paint getStyle(layerString, type, className, tileZoom, scale, diffRatio) {

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = false;
    var styleInfo = classColorStyles;

    if(type == 'LINESTRING' || type == 'line') paint.style = PaintingStyle.stroke; // are roads filled ?
    if(type == 'POLYGON'    || type == 'fill') paint.style = PaintingStyle.fill;

    bool matchedFeature = false;

    if(styleInfo.containsKey(layerString)) {
      Map<String, dynamic>? layerClass = styleInfo[layerString] ?? styleInfo['default'];
      List<List<dynamic>>? featureClass = styleInfo['default']?['default'];

      if (layerClass != null) {
        if (layerClass.containsKey('types') &&
            layerClass['types'].containsKey(className)) {
          featureClass = layerClass['types'][className];
          matchedFeature = true;
        }
      }

      if (layerClass != null && layerClass.containsKey(className)) {
        featureClass = layerClass[className];
        matchedFeature = true;
      }

      if (featureClass is List) {
        if( featureClass != null) {
          for (var list in featureClass) {
            if (tileZoom >= list[0] && tileZoom <= list[1] && list[2] is Map) {
              Map options = list[2];
              if (options.containsKey('color'))
                paint.color = options['color'];
              if (list[2].containsKey('strokeWidth'))
                paint.strokeWidth = options['strokeWidth'];
            }
          }
        }
      }
    }

    if(!matchedFeature) print ("$layerString $type $className $tileZoom not found");

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
