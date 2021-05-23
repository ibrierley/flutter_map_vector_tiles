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
      'default':  [ [0, 22, { 'color': Colors.yellow, 'strokeWidth': 0.0}],
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
      'default':      [ [0, 22, { 'color': Colors.yellow, 'strokeWidth' : 0.0  }     ],
                        [16,22, { 'color': Colors.yellow, 'strokeWidth' : 10.0 }     ],
      ],
      'service':      [ [0, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [16,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'street':       [ [0, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'pedestrian':   [ [0, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'street_limited':[[0, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'motorway':     [ [0, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [14,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'trunk':        [ [0, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'trunk_link':    [[0, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'primary':     [  [0, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'primary_link': [ [0, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'secondary':   [  [0, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'secondary_link':[[0, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'tertiary':     [ [0, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'tertiary_link': [[0, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'residential':  [ [0, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth' : 0.0  }     ],
                        [17,22, { 'color': Colors.blueGrey.shade300, 'strokeWidth' : 10.0 }     ],
      ],
      'path':         [ [0, 22, { 'color': Colors.brown.shade400,    'strokeWidth' : 0.0  }     ],
      ],
      'track':        [ [0, 22, { 'color': Colors.brown.shade300,    'strokeWidth' : 0.0  }     ],
      ],
      'major_rail':   [ [0, 22, { 'color': Colors.blueGrey.shade900, 'strokeWidth' : 0.0  }     ],
      ],
      'minor_rail':   [ [0, 22, { 'color': Colors.blueGrey.shade900, 'strokeWidth' : 0.0  }     ],
      ],
      'service_rail': [ [0, 22, { 'color': Colors.blueGrey.shade900, 'strokeWidth' : 0.0  }     ],
      ],
      'construction': [ [0, 22, { 'color': Colors.brown, 'strokeWidth' : 0.0  }     ],
      ],
      'ferry':        [ [0, 22, { 'color': Colors.brown, 'strokeWidth' : 0.0  }     ],
      ],
    },

    "motorway_junction": {
      'include': true,
      'default':  [ [0, 22, { 'color': Colors.deepPurple, 'strokeWidth': 0.0}],
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
      'wood':       [ [10, 22,  { 'color': Colors.green.shade900,   'strokeWidth': 0.0 } ],
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
      'ditch': [ [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
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
      'default': [ [15, 22, { 'color': Colors.orangeAccent, 'strokeWidth': 2}],
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

  static Map<String, Map<String, double>> classStrokeWidthClasses = { /// maybe move this into colorstyles above and rename
    "default": { "default": 2 },
    "admin" : { "default" : 0.8 },
    "road": { "default": 2, "street_limited": 2, "pedestrian" : 1, "path" : 2, "service" : 2, 'motorway': 2,'street': 2, "primary" : 2, "secondary": 2, "tertiary": 2, "trunk": 2, "trunk_link": 2, "major_rail": 2, "minor_rail": 1, "service_rail" : 1, },
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

      if( includeFeature && classOptions is Map && classOptions.containsKey('min') ) {
        if( zoom < classOptions['min'] ) {
          includeFeature = false;
        }
      }

      if( includeFeature && classOptions is Map && classOptions.containsKey('max') ) {
        if( zoom > classOptions['max'] ) {
          includeFeature = false;
        }
      }
    } else {
      print("[$layerString] is NOT in styling list");
    }

    return includeFeature;
  }

  static Paint getStyle(layerString, type, className, tileZoom, scale, diffRatio) {

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..strokeWidth = 2
    ///..strokeCap = StrokeCap.round
      ..isAntiAlias = false;
    var styleInfo = classColorStyles;

    if(type == 'LINESTRING' || type == 'line') paint.style = PaintingStyle.stroke; // are roads filled ?
    if(type == 'POLYGON'    || type == 'fill') paint.style = PaintingStyle.fill;

    if(classStrokeWidthClasses.containsKey(layerString)) {
      paint.strokeWidth = classStrokeWidthClasses[layerString]![className] ?? classStrokeWidthClasses[layerString]!['default']!;
    } else {
      paint.strokeWidth = classStrokeWidthClasses['default']!['default']!;
    }


    if(styleInfo.containsKey(layerString)) {
      Map<String, dynamic>? layerClass = styleInfo[layerString] ?? styleInfo['default'];
      List<List<dynamic>>? featureClass = styleInfo['default']?['default'];

      if (layerClass != null) {
        if (layerClass.containsKey('types') &&
            layerClass['types'].containsKey(className)) {
          featureClass = layerClass['types'][className];
        }
      }

      if (layerClass != null && layerClass.containsKey(className)) {
        featureClass = layerClass[className];
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
          }}

        //paint.color = styleInfo[layerString]![className]['color'];
      } else {
        //paint.color = styleInfo[layerString]!['default']['color'];
      }
    }





    paint.strokeWidth =  (paint.strokeWidth / scale); ///.ceilToDouble();


    //if( useHairline ) paint.strokeWidth = 0.0;
    //if( useThickline) paint.strokeWidth = 10.0;

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
