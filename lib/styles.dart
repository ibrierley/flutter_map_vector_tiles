import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Styles {

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

  static Paint getStyle(layerString, type, featureInfo, styles) {

    /// See https://docs.mapbox.com/vector-tiles/reference/mapbox-streets-v7/#water

    Map<String, Map<String, Color>> colorClasses = styles['colorClasses'] ?? {
      "road": { 'default': Colors.black26, 'service': Colors.white30, 'street': Colors.white54, 'pedestrian': Colors.white54, 'service': Colors.white54, 'street_limited': Colors.white54,
        'motorway' : Colors.deepPurple, 'trunk': Colors.deepPurple, 'trunk_link': Colors.deepPurple, 'primary' : Colors.yellow, 'primary_link': Colors.yellow, 'secondary': Colors.orangeAccent,
        'secondary_link': Colors.orangeAccent,'tertiary': Colors.yellow, 'tertiary_link': Colors.yellow,
        "path": Colors.white54, 'track': Colors.white38, 'residential': Colors.white54, 'major_rail': Colors.black, 'minor_rail': Colors.black12, 'service_rail': Colors.black, 'construction': Colors.brown },
      "motorway_junction": {'default': Colors.deepPurple },
      "landuse": { 'default': Colors.lightGreen, 'sand': Colors.amber, 'playground': Colors.blueGrey, 'grass': Colors.lightGreen, 'park': Colors.lightGreen, 'pitch': Colors.green,
        'parking': Colors.blueGrey, 'wood': Colors.green, 'agriculture': Colors.brown, 'school': Colors.grey },
      "landuse_overlay" : { 'default': Colors.green, "national_park": Colors.green },
      "water": { 'default': Colors.blue },
      "waterway": { 'default': Colors.blue },
      "transit_stop": { "default": Colors.deepOrange},
      "building": { "default": Colors.blueGrey },
      "structure": { "default": Colors.blueGrey, 'fence': Colors.brown },
      "barrierline": { "default": Colors.purple },
      "aeroway": { "default": Colors.orange },
      "waterway_label": { 'default': Colors.black54 },
      "poi_label": { 'default': Colors.orangeAccent },
      'transit_stop_label' : { 'default': Colors.black54 },
      "road_point": { 'default': Colors.black54 },
      "road_label": { "default": Colors.black },
      "rail_station_label": { "default": Colors.black },
      "natural_label": { 'default': Colors.brown },
      "place_label": { 'default': Colors.grey },
      "airport_label": { 'default': Colors.grey },
      "housenum_label": { 'default': Colors.grey },
      "mountain_peak_label": { 'default': Colors.brown },
      "state_label": { 'default': Colors.grey },
      "marine_label": { 'default': Colors.blueGrey },
      "country_label": { 'default': Colors.blueGrey },
      "default": { 'default': Colors.grey },
    };

    Map<String, Map<String, double>> strokeWidthClasses = styles['strokeWidthClasses'] ?? {
      "default": { "default": 2 },
      "road": { "default": 2, "street_limited": 2, "pedestrian" : 1, "path" : 3, "service" : 1, 'motorway': 6,'street': 2, "primary" : 4, "secondary": 3, "tertiary": 2, "trunk": 4, "trunk_link": 4, "major_rail": 3, "minor_rail": 2, "service_rail" : 1, },
    };

    var defaultPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    var paint = defaultPaint;
    if (type == 'POLYGON' || type=='POINT') {
      paint.style = PaintingStyle.fill;
    } else {
      paint.style = PaintingStyle.stroke;
    }


    // bit ugly below, needs rejigging
    if(colorClasses.containsKey(layerString)) {
      if(colorClasses[layerString].containsKey(featureInfo['class'])) {
        paint.color = colorClasses[layerString][featureInfo['class']];
      } else {
        paint.color = colorClasses['default']['default'];
      }
    }

    if(strokeWidthClasses.containsKey(layerString)) {
      if(strokeWidthClasses[layerString].containsKey(featureInfo['class'])) {
        paint.strokeWidth = strokeWidthClasses[layerString][featureInfo['class']];
      } else {
        paint.strokeWidth = strokeWidthClasses[layerString]['default'];
      }
    }

    return paint;
  }

}