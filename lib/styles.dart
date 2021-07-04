import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'parse_expressions.dart';
//import 'package:hexcolor/hexcolor.dart';

class Styles {

  static Map<String, dynamic> colorRegex = {
    'isHexRgb' : new RegExp(r'^(#.*)'),
    'isRgba'   : new RegExp(r'^rgba\((\d{1,3}),\s*(\d{1,3}),\s*(\d{1,3}),\s*(\d*(?:\.\d+)?)\)$'),
    'isHsl'    : new RegExp(r"hsl\((\d+),\s*([\d.]+)%,\s*([\d.]+)%\)"),

  };

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

  static Map<String, Map<String, dynamic>> stadiaClassColorStyles = {
    'layers' : {

      "default": {
        'include': true,
        'default': [ [0, 22, { 'color': Colors.purple, 'strokeWidth': 0.0}],
        ],
      },

      "transportation": {
        'include': true,
        'default': [ [0, 22, { 'color': Colors.orange, 'strokeWidth': 0.0}],
          [16, 22, { 'color': Colors.orange, 'strokeWidth': 2.0}],
        ],
        'service': [
          [12, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'street': [
          [15, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'pedestrian': [
          [15, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'street_limited': [
          [15, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'motorway': [ [(optionsMap) {
          return 0;
        }, (optionsMap) {
          return 11;
        }, { 'color': Colors.orange, 'strokeWidth': 0.0}],
          [12, 5, { 'color': Colors.orange.shade200, 'strokeWidth': 3.0}],
          [14, 22, { 'color': Colors.orange.shade100, 'strokeWidth': 8.0}],
        ],
        'motorway_link': [
          [0, 11, { 'color': Colors.orange, 'strokeWidth': 0.0}],
          [12, 15, { 'color': Colors.orange.shade200, 'strokeWidth': 3.0}],
          [14, 22, { 'color': Colors.orange.shade100, 'strokeWidth': 8.0}],
        ],
        'trunk': [ [0, 11, { 'color': Colors.orangeAccent, 'strokeWidth': 0.0}],
          [12, 15, { 'color': Colors.orange.shade200, 'strokeWidth': 3.0}],
          [17, 22, { 'color': Colors.orange.shade100, 'strokeWidth': 8.0}],
        ],
        'trunk_link': [
          [0, 11, { 'color': Colors.orangeAccent, 'strokeWidth': 0.0}],
          [12, 16, { 'color': Colors.orange.shade100, 'strokeWidth': 3.0}],
          [17, 22, { 'color': Colors.orange.shade100, 'strokeWidth': 8.0}],
        ],
        'primary': [
          [11, 16, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'primary_link': [
          [11, 16, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'secondary': [
          [11, 16, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'secondary_link': [
          [11, 16, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'tertiary': [
          [14, 16, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'tertiary_link': [
          [14, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
        ],
        'residential': [
          [14, 15, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
          [16, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 5.0}],
          [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 7.0}],
        ],
        'path': [
          [0, 22, { 'color': Colors.brown.shade400, 'strokeWidth': 2.0}],
        ],
        'footway': [
          [0, 22, { 'color': Colors.brown.shade400, 'strokeWidth': 2.0}],
        ],
        'track': [
          [0, 22, { 'color': Colors.brown.shade300, 'strokeWidth': 2.0}],
        ],
        'major_rail': [
          [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'minor': [
          [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'rail': [
          [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'minor_rail': [
          [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'service_rail': [
          [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'bridge': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'motorway_construction': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'minor_construction': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'path_construction': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'primary_construction': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'trunk_construction': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'construction_construction': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'tertiary_construction': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'raceway': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
        ],
        'construction': [
          [14, 22, { 'color': Colors.brown, 'strokeWidth': 0.0}],
        ],
        'ferry': [
          [0, 22, { 'color': Colors.blue.shade800, 'strokeWidth': 0.0}],
        ],
        'golf': [
          [15, 22, { 'color': Colors.brown.shade400, 'strokeWidth': 2.0}],
        ],
        'aerialway': [
          [14, 22, { 'color': Colors.brown.shade400, 'strokeWidth': 2.0}],
        ],
        'pier': [ [0, 22, { 'color': Colors.blue.shade800, 'strokeWidth': 0.0}],
        ],
        'path_construction': [
          [14, 22, { 'color': Colors.brown.shade400, 'strokeWidth': 2.0}],
        ],
      },

      "landuse": {
        'include': true,
        'default': [
          [14, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
        ],
        'airport': [ [13, 21, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'hospital': [ [15, 21, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'sand': [ [12, 21, { 'color': Colors.amber, 'strokeWidth': 0.0}],
        ],
        'playground': [
          [14, 22, { 'color': Colors.green.shade400, 'strokeWidth': 0.0}],
        ],
        'grass': [ [13, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
        ],
        'park': [ [13, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
        ],
        'pitch': [ [13, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
        ],
        'parking': [
          [14, 22, { 'color': Colors.green.shade100, 'strokeWidth': 0.0}],
        ],
        'wood': [
          [10, 22, { 'color': Colors.green.shade800, 'strokeWidth': 0.0}],
        ],
        'agriculture': [
          [13, 22, { 'color': Colors.green.shade700, 'strokeWidth': 0.0}],
        ],
        'school': [ [14, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'scrub': [
          [10, 22, { 'color': Colors.green.shade600, 'strokeWidth': 0.0}],
        ],
        'cemetery': [
          [15, 22, { 'color': Colors.green.shade700, 'strokeWidth': 0.0}],
        ],
        'rock': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'glacier': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'residential': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'industrial': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'retail': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'commercial': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'library': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'track': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'stadium': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'university': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'college': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'bus_station': [
          [12, 22, { 'color': Colors.grey.shade700, 'strokeWidth': 0.0}],
        ],
        'railway': [
          [12, 22, { 'color': Colors.grey.shade700, 'strokeWidth': 0.0}],
        ],
      },

      "landcover": {
        'include': true,
        'default': [
          [14, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
        ],
        'airport': [ [13, 21, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'hospital': [ [15, 21, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'sand': [ [12, 21, { 'color': Colors.amber, 'strokeWidth': 0.0}],
        ],
        'playground': [
          [14, 22, { 'color': Colors.green.shade400, 'strokeWidth': 0.0}],
        ],
        'grass': [ [13, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
        ],
        'park': [ [13, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
        ],
        'pitch': [ [13, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
        ],
        'parking': [
          [14, 22, { 'color': Colors.green.shade100, 'strokeWidth': 0.0}],
        ],
        'wood': [
          [10, 22, { 'color': Colors.green.shade800, 'strokeWidth': 0.0}],
        ],
        'agriculture': [
          [13, 22, { 'color': Colors.green.shade700, 'strokeWidth': 0.0}],
        ],
        'school': [ [14, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'scrub': [
          [10, 22, { 'color': Colors.green.shade600, 'strokeWidth': 0.0}],
        ],
        'cemetery': [
          [15, 22, { 'color': Colors.green.shade700, 'strokeWidth': 0.0}],
        ],
        'rock': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'glacier': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'residential': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'industrial': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
        ],
        'farmland': [
          [13, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
        ],
      },

      "water": {
        'include': true,
        'default': [
          [0, 22, { 'color': Colors.blue.shade500, 'strokeWidth': 0.0}],
        ],
        'lake': [ [0, 22, { 'color': Colors.blue.shade500, 'strokeWidth': 0.0}],
        ],
        'river': [
          [0, 22, { 'color': Colors.blue.shade500, 'strokeWidth': 0.0}],
        ],
        'ocean': [
          [0, 22, { 'color': Colors.blue.shade500, 'strokeWidth': 0.0}],
        ],
        'dock': [ [0, 22, { 'color': Colors.blue.shade500, 'strokeWidth': 0.0}],
        ],
      },

      "building": {
        'include': true,
        'default': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 0.0}],
        ],
      },

      "boundary": {
        'include': true,
        'default': [
          [13, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 0.0}],
        ],
      },

      "park": {
        'include': true,
        'default': [ [13, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
        ],
        'protected_area': [
          [13, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
        ],
        'nature_reserve': [
          [13, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
        ],
      },

      "transportation_name": {
        'include': true,
        'default': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'trunk': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'motorway': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'service': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'path': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'footway': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'minor': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'tertiary': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'primary': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'secondary': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
        'track': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
        ],
      },

      "waterway": {
        'include': true,
        'default': [
          [13, 22, { 'color': Colors.blue.shade700, 'strokeWidth': 0.0}],
        ],
        'river': [
          [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
        ],
        'canal': [
          [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
        ],
        'stream': [
          [14, 22, { 'color': Colors.blue.shade900, 'strokeWidth': 0.0}],
        ],
        'stream_intermittent': [
          [13, 22, { 'color': Colors.blue.shade900, 'strokeWidth': 0.0}],
        ],
        'ditch': [
          [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
        ],
        'drain': [
          [13, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
        ],
      },

      "aeroway": {
        'include': true,
        'default': [ [12, 22, { 'color': Colors.orange, 'strokeWidth': 0.0}],
        ],
        'runway': [
          [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 0.0}],
        ],
        'taxiway': [
          [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 0.0}],
        ],
        'helipad': [
          [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 0.0}],
        ],
        'aerodrome': [
          [12, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
        ],
        'apron': [
          [12, 22, { 'color': Colors.blueGrey.shade700, 'strokeWidth': 0.0}],
        ],
      },
    },
  };



  static Map mapBoxClassColorStyles = {

    'layers' : [
      {
        "default": {
          'include': true,
          'default': [ [0, 22, { 'color': Colors.purple, 'strokeWidth': 0.0}],
          ],
        },
      },
      {
        "admin": {
          'include': true,
          'default': [
            [0, 22, { 'color': Colors.deepPurple, 'strokeWidth': 0.0}],
          ],
        },
      },
      ///mapbox streets
      ///hairline = switch to a hairline width of 0 for optimisation at low zoom levels where we dont care
      {
        "road": {
          'include': true,
          'default': [ [0, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
            [16, 22, { 'color': Colors.greenAccent, 'strokeWidth': 2.0}],
          ],
          'service': [
            [12, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'street': [
            [15, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'pedestrian': [
            [15, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'street_limited': [
            [15, 22, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'motorway': [ [0, 11, { 'color': Colors.orange, 'strokeWidth': 0.0}],
            [12, 5, { 'color': Colors.orange.shade200, 'strokeWidth': 3.0}],
            [14, 22, { 'color': Colors.orange.shade100, 'strokeWidth': 8.0}],
          ],
          'motorway_link': [
            [0, 11, { 'color': Colors.orange, 'strokeWidth': 0.0}],
            [12, 15, { 'color': Colors.orange.shade200, 'strokeWidth': 3.0}],
            [14, 22, { 'color': Colors.orange.shade100, 'strokeWidth': 8.0}],
          ],
          'trunk': [
            [0, 11, { 'color': Colors.orangeAccent, 'strokeWidth': 0.0}],
            [12, 15, { 'color': Colors.orange.shade200, 'strokeWidth': 3.0}],
            [17, 22, { 'color': Colors.orange.shade100, 'strokeWidth': 8.0}],
          ],
          'trunk_link': [
            [0, 11, { 'color': Colors.orangeAccent, 'strokeWidth': 0.0}],
            [12, 16, { 'color': Colors.orange.shade100, 'strokeWidth': 3.0}],
            [17, 22, { 'color': Colors.orange.shade100, 'strokeWidth': 8.0}],
          ],
          'primary': [
            [11, 16, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'primary_link': [
            [11, 16, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'secondary': [
            [11, 16, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'secondary_link': [
            [11, 16, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'tertiary': [
            [14, 16, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'tertiary_link': [
            [14, 22, { 'color': Colors.blueGrey.shade400, 'strokeWidth': 0.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 8.0}],
          ],
          'residential': [
            [14, 15, { 'color': Colors.blueGrey.shade600, 'strokeWidth': 0.0}],
            [16, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 5.0}],
            [17, 22, { 'color': Colors.blueGrey.shade300, 'strokeWidth': 7.0}],
          ],
          'path': [
            [0, 22, { 'color': Colors.brown.shade400, 'strokeWidth': 2.0}],
          ],
          'track': [
            [0, 22, { 'color': Colors.brown.shade300, 'strokeWidth': 2.0}],
          ],
          'major_rail': [
            [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
          ],
          'minor_rail': [
            [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
          ],
          'service_rail': [
            [12, 22, { 'color': Colors.blueGrey.shade800, 'strokeWidth': 1.0}],
          ],
          'construction': [
            [14, 22, { 'color': Colors.brown, 'strokeWidth': 0.0}],
          ],
          'ferry': [
            [0, 22, { 'color': Colors.blue.shade800, 'strokeWidth': 0.0}],
          ],
          'golf': [
            [15, 22, { 'color': Colors.brown.shade400, 'strokeWidth': 2.0}],
          ],
          'aerialway': [
            [14, 22, { 'color': Colors.brown.shade400, 'strokeWidth': 2.0}],
          ],
        },
      },
      {
        "motorway_junction": {
          'include': true,
          'default': [
            [0, 22, { 'color': Colors.deepPurple, 'strokeWidth': 5.0}],
          ],
        },
      },
      {
        "landuse": {
          'include': true,
          'default': [
            [14, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
          ],
          'airport': [ [13, 21, { 'color': Colors.grey, 'strokeWidth': 0.0}],
          ],
          'hospital': [ [15, 21, { 'color': Colors.grey, 'strokeWidth': 0.0}],
          ],
          'sand': [ [12, 21, { 'color': Colors.amber, 'strokeWidth': 0.0}],
          ],
          'playground': [
            [14, 22, { 'color': Colors.green.shade400, 'strokeWidth': 0.0}],
          ],
          'grass': [
            [13, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
          ],
          'park': [ [13, 22, { 'color': Colors.lightGreen, 'strokeWidth': 0.0}],
          ],
          'pitch': [ [13, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
          ],
          'parking': [
            [14, 22, { 'color': Colors.green.shade100, 'strokeWidth': 0.0}],
          ],
          'wood': [
            [10, 22, { 'color': Colors.green.shade800, 'strokeWidth': 0.0}],
          ],
          'agriculture': [
            [13, 22, { 'color': Colors.green.shade700, 'strokeWidth': 0.0}],
          ],
          'school': [ [14, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
          ],
          'scrub': [
            [10, 22, { 'color': Colors.green.shade600, 'strokeWidth': 0.0}],
          ],
          'cemetery': [
            [15, 22, { 'color': Colors.green.shade700, 'strokeWidth': 0.0}],
          ],
          'rock': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
          ],
          'glacier': [ [12, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
          ],
        },
      },
      {

        "landuse_overlay": {
          'include': true,
          'default': [ [12, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
          ],
          'national_park': [
            [12, 22, { 'color': Colors.green, 'strokeWidth': 0.0}],
          ],
          'wetland_noveg': [
            [11, 22, { 'color': Colors.blueGrey, 'strokeWidth': 0.0}],
          ],
          'wetland': [
            [12, 22, { 'color': Colors.blue.shade700, 'strokeWidth': 0.0}],
          ],
        },
      },
      {

        "water": {
          'include': true,
          'default': [
            [0, 22, { 'color': Colors.blue.shade500, 'strokeWidth': 0.0}],
          ],
        },
      },
      {

        "waterway": {
          'include': true,
          'default': [
            [13, 22, { 'color': Colors.blue.shade700, 'strokeWidth': 0.0}],
          ],
          'river': [
            [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
          ],
          'canal': [
            [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
          ],
          'stream': [
            [14, 22, { 'color': Colors.blue.shade900, 'strokeWidth': 0.0}],
          ],
          'stream_intermittent': [
            [13, 22, { 'color': Colors.blue.shade900, 'strokeWidth': 0.0}],
          ],
          'ditch': [
            [12, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
          ],
          'drain': [
            [13, 22, { 'color': Colors.blue.shade600, 'strokeWidth': 0.0}],
          ],
        },
      },
      {

        "transit_stop": {
          'include': true,
          'default': [
            [14, 22, { 'color': Colors.deepOrange, 'strokeWidth': 0.0}],
          ],
        },
      },
      {

        "building": {
          'include': true,
          'default': [
            [15, 22, { 'color': Colors.grey.shade600, 'strokeWidth': 0.0}],
          ],
        },
      },
      {
        "structure": {
          'include': true,
          'default': [
            [15, 22, { 'color': Colors.grey.shade600, 'strokeWidth': 0.0}],
          ],
          'fence': [
            [15, 22, { 'color': Colors.brown.shade300, 'strokeWidth': 0.0}],
          ],
          'hedge': [
            [15, 22, { 'color': Colors.brown.shade300, 'strokeWidth': 0.0}],
          ],
          'gate': [
            [16, 22, { 'color': Colors.brown.shade600, 'strokeWidth': 0.0}],
          ],
          'land': [
            [16, 22, { 'color': Colors.brown.shade300, 'strokeWidth': 0.0}],
            // eg pier
          ],
          'cliff': [
            [16, 22, { 'color': Colors.grey, 'strokeWidth': 0.0}],
            // eg pier
          ],
        },
      },
      {
        "barrierline": {
          'include': true,
          'default': [ [12, 22, { 'color': Colors.purple, 'strokeWidth': 0.0}],
          ],
        },
      },
      {
        "aeroway": {
          'include': true,
          'default': [ [12, 22, { 'color': Colors.orange, 'strokeWidth': 0.0}],
          ],
        },
      },
      {
        "waterway_label": {
          'include': true,
          'default': [ [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "poi_label": {
          'include': true,
          'default': [ [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
          'food_and_drink': [
            [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
          'religion': [ [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
          'sport_and_leisure': [
            [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
          'food_and_drink_stores': [
            [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
          'park_like': [ [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
          'education': [ [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
          'public_facilities': [
            [15, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
          'commercial_services ': [
            [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "transit_stop_label": {
          'include': true,
          'default': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "road_point": {
          'include': true,
          'default': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "road_label": {
          'include': true,
          'default': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "rail_station_label": {
          'include': true,
          'default': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "natural_label": {
          'include': true,
          'default': [ [14, 22, { 'color': Colors.brown, 'strokeWidth': 0.0}],
          ],
          'landform': [ [12, 22, { 'color': Colors.brown, 'strokeWidth': 0.0}],
          ],
          'sea': [ [12, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
          ],
          'stream': [ [12, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
          ],
          'water': [ [12, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
          ],
          'canal': [ [15, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
          ],
          'river': [ [15, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
          ],
          'dock': [ [15, 22, { 'color': Colors.blueGrey, 'strokeWidth': 0.0}],
          ],
        },
      },
      {
        "place_label": {
          'include': true,
          'default': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
          ],
          'settlement': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
          ],
          'settlement_subdivision': [
            [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
          ],
          'park_like': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}],
          ],
          'types': {
            'village': [
              [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}]
            ],
            //15
            'suburb': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}]],
            //15
            'hamlet': [ [14, 22, { 'color': Colors.black, 'strokeWidth': 0.0}]],
            //15
            'city': [ [6, 22, { 'color': Colors.black, 'strokeWidth': 0.0}]],
            //6
            'town': [ [10, 22, { 'color': Colors.black, 'strokeWidth': 0.0}]],
            //12
          }
        },
      },
      {
        "airport_label": {
          'include': true,
          'default': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "housenum_label": {
          'include': true,
          'default': [ [17, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "mountain_peak_label": {
          'include': true,
          'default': [ [16, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "state_label": {
          'include': true,
          'default': [ [13, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "marine_label": {
          'include': true,
          'default': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
      },
      {
        "country_label": {
          'include': true,
          'default': [ [0, 22, { 'color': Colors.black, 'strokeWidth': 2}],
          ],
        },
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
    ]

  };

  /// We want to give the option of any var being a func to call..
  static dynamic funcCheck( dynamic checkVar, Map paramMap ) {
    if(checkVar is Function) return checkVar( paramMap );
    return checkVar;
  }


  static bool xxxincludeFeature(vectorStyle, layerString, type, featureInfo, zoom) { //reduce code...

    print("includefeature check");

    var thisClass;
    if(featureInfo?.containsKey('properties')) {
      thisClass = featureInfo['properties']['class'] ?? 'default';
    } else {
      thisClass = featureInfo['class'] ?? 'default';
    }

    var paramsMap = { 'layer': layerString, 'type': type, 'class': thisClass, 'zoom': zoom, 'featureInfo': featureInfo };

    var style = funcCheck(vectorStyle, paramsMap);

    //print("Style $style ");

    var includeFeature = funcCheck( style['default'], paramsMap )['include'];

    if(!vectorStyle.containsKey(layerString)) layerString = 'default';

    if(vectorStyle.containsKey(layerString)) {
      var layerStyle = funcCheck( vectorStyle[layerString], paramsMap );

      includeFeature = funcCheck( layerStyle!['include'], paramsMap );
      var classOptions = funcCheck( layerStyle!['default'], paramsMap );

      if( layerStyle!.containsKey('types') && layerStyle!['types'].containsKey(type)) { // types match in styling
        classOptions = funcCheck( layerStyle!['types'][type], paramsMap );

      } else if( layerStyle!.containsKey(thisClass) ) { // normal class match in styling
        classOptions = funcCheck( layerStyle![thisClass], paramsMap );
      }

      if( includeFeature && classOptions is List ) {
        var listIncludes = false;

        for( var entry in classOptions ) {
          var minZoom = funcCheck( entry[0], paramsMap );
          var maxZoom = funcCheck( entry[1], paramsMap );

          if( zoom >= minZoom && zoom <= maxZoom ) {
            listIncludes = true; // we have at least one entry for this zoom
            break;
          }
        }
        if( listIncludes == false ) {
          includeFeature = false;
        }
      }
    }

    return funcCheck( includeFeature, paramsMap );
  }

  static Paint getStyle(style, featureInfo, layerString, type, tileZoom, scale, diffRatio) {
    var paramsMap = { 'layer': layerString, 'type': type, 'zoom': tileZoom, 'diffRatio': diffRatio, 'featureInfo': featureInfo };

    var parser = new Parser(layerString, featureInfo, type, tileZoom);

    var className;
    if(featureInfo?.containsKey('properties')) {
      className = featureInfo['properties']['class'] ?? 'default';
    } else {
      className = featureInfo['class'] ?? 'default';
    }

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = false;

    if(type == 'LINESTRING' || type == 'line') paint.style = PaintingStyle.stroke; // are roads filled ?
    if(type == 'POLYGON'    || type == 'fill') paint.style = PaintingStyle.fill;

    if(type == 'POLYGON') {
      final featureFillColor = featureInfo['fill-color'];
      if (featureFillColor != null) {
        paint.color =  getColorFromString(featureFillColor);
      }
    } else if(type == 'LINESTRING') {
      final lineColor = featureInfo['line-color'];
      if (lineColor != null) {
        paint.color =  getColorFromString(lineColor);
      }
      final lineWidth = featureInfo['line-width'];
      if (lineWidth != null) {
        if(lineWidth is String || lineWidth is Map || lineWidth is List) {
          paint.strokeWidth = double.parse(parser.parse(lineWidth));
        } else {
          paint.strokeWidth = lineWidth.toDouble();
        }
      }
      final strokeCap = featureInfo['stroke-cap'];
      if(strokeCap != null) {
        paint.strokeCap = strokeCap;
      }
      final strokeJoin = featureInfo['stroke-join'];
      if(strokeJoin != null) {
        paint.strokeJoin = strokeJoin;
      }
    } else if(type == 'POINT') {
      paint.color = featureInfo['text-color']; /// swap this for point vs text
    }

    /*

    bool matchedFeature = false;
    Map vectorStyle = funcCheck(style, paramsMap);

    if(!vectorStyle.containsKey(layerString)) layerString = 'default';

    if(vectorStyle.containsKey(layerString)) {

      Map<String, dynamic>? layerClass = funcCheck(vectorStyle[layerString],paramsMap) ?? funcCheck(vectorStyle['default'], paramsMap);
      List<List<dynamic>>? featureClass = funcCheck(vectorStyle['default'],paramsMap)?['default'];

      if (layerClass != null) {
        if (layerClass.containsKey('types') &&
            layerClass['types'].containsKey(className)) {
          featureClass = funcCheck(layerClass['types'][className], paramsMap);
          matchedFeature = true;
        }
      }

      if (layerClass != null && layerClass.containsKey(className)) {
        featureClass = funcCheck(layerClass[className], paramsMap);
        matchedFeature = true;
      }

      if (featureClass is List) {
        if( featureClass != null) {
          for (var entry in featureClass) {
            var minZoom = funcCheck(entry[0], paramsMap);
            var maxZoom = funcCheck(entry[1], paramsMap);
            var styleOptions = funcCheck(entry[2], paramsMap);

            if (tileZoom >= minZoom && tileZoom <= maxZoom && styleOptions is Map) {

              if (styleOptions.containsKey('color'))
                paint.color = funcCheck(styleOptions['color'], paramsMap);
              if (styleOptions.containsKey('strokeWidth'))
                paint.strokeWidth = funcCheck(styleOptions['strokeWidth'], paramsMap);
            }
          }
        }
      }
    }

     */

    return paint;
  }

  static Future<Map<dynamic,dynamic>> getJsonTestStyle(filename) async {
    return await rootBundle.loadString('assets/data/streets.jsonxxxxxx')
    .then((contents){
      Map<dynamic,dynamic> json = jsonDecode(contents);
      return json;
    });
  }

  static final normalFontSize = 12.0;
  static final outlineWidth = 2.0;
  static final lineWidth = 1.0;

}

bool filterCheck( check ) {
  return check;
}

bool parseFilterList(Map feature) {
  return false;
}

void checkMapboxFilters(Map<dynamic,dynamic> style, String layerString,String type, Map feature, double tileZoom) {

  try {
    layers: for (var layer in style['layers']) {

      //var matches = false;

      if (layer.containsKey('source-layer')) {
        if (layer['source-layer'] != layerString) continue layers;
        print("Matches source-layer");
        //matches = true;
      }
      if (layer.containsKey('class')) {
        if (layer['class'] != feature['properties']['class']) continue layers;
        print("matches class");
        //matches = true;
      }

      double? minZoom = layer['minZoom'];
      if(minZoom != null) {
        if(tileZoom < minZoom) {
          print("Fails on layers");
          continue layers;
        }
      }

      double? maxZoom = layer['maxZoom'];
      if(maxZoom != null) {
        if(tileZoom > maxZoom) {
          print("Fails on layers");
          continue layers;
        }
      }

      var filterList = layer['filter'];
      if(filterList != null) {
        print("Checking filter $filterList");
        continue;
      }

      /*
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
      */


      break;
    }
  } catch(e) {
    print("exception $e");
  }
}



Color getColorFromString(colorString) {
  //print("getting color $colorString");
  var colorMatches = Styles.colorRegex['isHexRgb'].allMatches(colorString).toList();
  if(colorMatches.length > 0) {
   // print("got hex color");
    return hexToColor(colorMatches[0][1]);
  }
  colorMatches = Styles.colorRegex['isRgba'].allMatches(colorString).toList();
  if(colorMatches.length > 0) {
    //print("got rgba $colorMatches");
    return Color.fromRGBO(int.parse(colorMatches[0][1]), int.parse(colorMatches[0][2]), int.parse(colorMatches[0][3]), double.parse(colorMatches[0][4]));
  }
  //print("got hsl");
  return hslStringToRgbColor(colorString);
}

List stringToHslColor(string) {
  RegExp exp = Styles.colorRegex['isHsl']; //new RegExp(r"hsl\((\d+),\s*([\d.]+)%,\s*([\d.]+)%\)");
  var matches = exp.allMatches(string).toList();

  return [double.parse(matches[0][1]!),double.parse(matches[0][2]!),double.parse(matches[0][3]!)];
  //var color = HSLColor.fromAHSL(1,double.parse(matches[0][1]!),double.parse(matches[0][2]!),double.parse(matches[0][3]!));
 // return color.toColor();
}

Color hslStringToRgbColor(hslString) {
  var list = stringToHslColor(hslString);
  var rgbList = hslToRgb(list);
  return Color.fromRGBO(rgbList[0].toInt(), rgbList[1].toInt(), rgbList[2].toInt(), 1.0);
}

/// https://pub.dev/packages/color_convert
Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}

/// https://github.com/crystalboxes/color_convert/blob/master/lib/src/hsl.dart that dep isn't nullsafe tho yet...
List<num> hslToRgb(hsl) {
  final h = hsl[0] / 360;
  final s = hsl[1] / 100;
  final l = hsl[2] / 100;
  double t2, t3, val;

  if (s == 0) {
    val = l * 255;
    return [val, val, val];
  }

  if (l < 0.5) {
    t2 = l * (1 + s);
  } else {
    t2 = l + s - l * s;
  }

  final t1 = 2 * l - t2;

  final rgb = <num>[0, 0, 0];
  for (var i = 0; i < 3; i++) {
    t3 = h + 1 / 3 * -(i - 1);
    if (t3 < 0) {
      t3++;
    }

    if (t3 > 1) {
      t3--;
    }

    if (6 * t3 < 1) {
      val = t1 + (t2 - t1) * 6 * t3;
    } else if (2 * t3 < 1) {
      val = t2;
    } else if (3 * t3 < 2) {
      val = t1 + (t2 - t1) * (2 / 3 - t3) * 6;
    } else {
      val = t1;
    }

    rgb[i] = val * 255;
  }

  return rgb;
}