import 'dart:collection';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'parse_expressions.dart';
import 'log.dart';
//import 'package:hexcolor/hexcolor.dart';

class Styles {

  static Map<String, dynamic> colorRegex = {
    'isHexRgb' : new RegExp(r'^(#.*)'),
    'isRgba'   : new RegExp(r'^rgba?\((\d{1,3}),\s*(\d{1,3}),\s*(\d{1,3}),?\s*(\d*(?:\.\d+)?)\)$'),
    'isHsl'    : new RegExp(r"hsl\((\d+),\s*([\d.]+)%,\s*([\d.]+)%\)"),
    'isHsla'   : new RegExp(r"hsla?\((\d+),\s*([\d.]+)%,\s*([\d.]+)%,?\s*([\d.]+)*\s*\)"),
  };

  /// https://github.com/mapbox/mapbox-gl-js/issues/4225

  static LinkedHashMap getMatchedStyleLayers (decodedGeom, vectorStyle, tileZoom) {
    var checkedLayers = [];

    if(vectorStyle == null) {
      print("No style, returning");
      return LinkedHashMap();
    }

    var keys = '';
    for(var key in decodedGeom.keys) {
      keys += key + ", ";
    }
    //print("KEYS ARE $keys");
    //print("decodegeom is $decodedGeom");

    var start = DateTime.now();
    var diff = DateTime.now().difference(start).inMilliseconds;

    var seenLayer = {};
    var sourceLayers = [];
    LinkedHashMap styleLinkedMap = new LinkedHashMap();

    if(vectorStyle['layers'] != null) {
      for (var styleLayer in vectorStyle['layers']) {
        var layerString = styleLayer['source-layer'];
        if (layerString == null) continue;
        if (styleLinkedMap.containsKey(layerString)) {
          styleLinkedMap[layerString].add(styleLayer);
        } else {
          styleLinkedMap[layerString] = [styleLayer];
        }
      }
    } else {
      print("vector style layers is Null, somethign went wrong ? $vectorStyle $decodedGeom");
    }

    //print("$sourceLayers");
    //print("linked map $styleLinkedMap");

    LinkedHashMap sortedFeatureLayers = new LinkedHashMap();

    //final checkOk = checkFilter(styleLayerFilter, sourceLayer, featureDetails, tileZoom);
    styleLinkedMap.forEach((layerString, value) {
      //print("key $layerString");
      var layerFeatures = decodedGeom[layerString] ?? [];
      for(var feature in layerFeatures) {
        STYLE_ENTRY: for(final Map layerStyle in styleLinkedMap[layerString]) {
          //print("key $layerStyle ");

          var willAdd = false;
          final minZoom = layerStyle['minZoom'];
          final maxZoom = layerStyle['maxZoom'];

          if(minZoom != null && tileZoom < minZoom) {
            //print("skipping due to min $tileZoom vs $minZoom");
            continue;
          }
          if(maxZoom != null && tileZoom > maxZoom) {
            //print("skipping due to max $tileZoom vs $maxZoom");
            continue;
          }

          final featureGeomType = feature['geometry']['type'];
          final styleLayerType = layerStyle['type'];

          if(styleLayerType == 'fill' && featureGeomType != 'POLYGON') {
            continue STYLE_ENTRY;
          }
          if(styleLayerType == 'line' && featureGeomType != 'LINESTRING') {
            continue STYLE_ENTRY;
          }
          if(styleLayerType == 'symbol' && featureGeomType != 'POINT') {
            continue STYLE_ENTRY;
          }

          var filter = layerStyle['filter'];

          if(filter == null) {
            //print("$layerString no filter so will pass");

            var sortedFeature = sortedFeatureLayers[layerString];
            if(sortedFeature == null) {
              willAdd = true;
            }

          } else {
            //checkFilter...

            final checkOk = checkFilter(filter, layerString, feature, tileZoom);
            if(!(checkOk is bool)) {
              print("CHECKOK: $checkOk $feature");
            }
            if(checkOk) {
              willAdd = true;
            }
          }

          if(willAdd) {
            final styleLayerPaint =  layerStyle['paint'];
            final styleLayerLayout = layerStyle['layout'];

            if(willAdd && styleLayerPaint != null) {

              final paintKeys = ['fill-outline-color','fill-color','fill-opacity', 'fill-outline-color'
                  'line-opacity','line-color','line-width','text-color',
                "text-halo-blur", "text-halo-width", "text-halo-color" ];

              for( var key in paintKeys) {
                if(styleLayerPaint != null && styleLayerPaint[key] != null) {
                  feature[key] = checkFilter(styleLayerPaint[key], layerString, feature, tileZoom);
                }
              }

              feature['paint'] = styleLayerPaint; /// maybe we want to recalc paint every frame, so pass the original

              final layoutKeys = ['line-cap','line-join','text-size', "text-font", "text-field", "text-anchor", "text-offset"];
              for( var key in layoutKeys ) {
                if(styleLayerLayout != null && styleLayerLayout[key] != null) {
                  feature[key] = checkFilter(styleLayerLayout[key], layerString, feature, tileZoom);
                }
              }
            }

            var sortedFeature = sortedFeatureLayers[layerString];
            if(sortedFeature == null) {
              sortedFeatureLayers[layerString] = [feature];
            } else {
              sortedFeatureLayers[layerString].add(feature);
            }
            break STYLE_ENTRY;
          }
        }
      }
    });

    ///print("sortedfeatures $sortedFeatureLayers");



    /*
    for( var styleLayer in vectorStyle['layers']) {
      var newLayer = [];
      diff = DateTime.now().difference(start).inMilliseconds;
      start = DateTime.now();
      Log.out(L.decode, "decodebytesgeom took $diff millisecs ${styleLayer['source-layer']}");

      final styleLayerType = styleLayer['type'];
      final styleLayerFilter = styleLayer['filter'];
      final styleLayerPaint = styleLayer['paint'];
      final styleLayerLayout =  styleLayer['layout'];
      final minZoom = styleLayer['minzoom'] ?? 0;
      final maxZoom = styleLayer['maxzoom'] ?? 50;

      if(tileZoom < minZoom) {
        continue;
      }
      if(tileZoom > maxZoom) {
        continue;
      }

      final sourceLayer = styleLayer['source-layer'] ?? styleLayer.keys.first; // may be a background layer we want to deal with as well

      if(sourceLayer != null) {
        final matchingLayer = decodedGeom[sourceLayer] ?? [];
        if(matchingLayer.length == 0) {
        }
        FEATURE: for (var featureDetails in matchingLayer) {
          final featureGeomType = featureDetails['geometry']['type'];
          var addedFeature = false;

          if(styleLayerType == 'fill' && featureGeomType != 'POLYGON') {
            continue FEATURE;
          }
          if(styleLayerType == 'line' && featureGeomType != 'LINESTRING') {
            continue FEATURE;
          }
          if(styleLayerType == 'symbol' && featureGeomType != 'POINT') {
            continue FEATURE;
          }

          if(styleLayerFilter != null) {// || styleLayer[sourceLayer].containsKey('include')) {
            final checkOk = checkFilter(styleLayerFilter, sourceLayer, featureDetails, tileZoom);

            if(checkOk == null) {
            } else if( checkOk is bool && checkOk ) {
              addedFeature = true;
            } else {
            }
          } else {
            addedFeature = true;
          }

          if(addedFeature && styleLayerPaint != null) {

            final paintKeys = ['fill-outline-color','fill-color','fill-opacity', 'fill-outline-color'
                'line-opacity','line-color','line-width','text-color',
              "text-halo-blur", "text-halo-width", "text-halo-color" ];

            for( var key in paintKeys) {
              if(styleLayerPaint != null && styleLayerPaint[key] != null) {
                featureDetails[key] = checkFilter(styleLayerPaint[key], sourceLayer, featureDetails, tileZoom);
              }
            }

            featureDetails['paint'] = styleLayerPaint; /// maybe we want to recalc paint every frame, so pass the original

            final layoutKeys = ['line-cap','line-join','text-size', "text-font", "text-field", "text-anchor", "text-offset"];
            for( var key in layoutKeys ) {
              if(styleLayerLayout != null && styleLayerLayout[key] != null) {
                featureDetails[key] = checkFilter(styleLayerLayout[key], sourceLayer, featureDetails, tileZoom);
              }
            }
          }
          if(addedFeature) {
            newLayer.add(featureDetails);
          }
        }
      }

      if(newLayer.length != 0) {
        checkedLayers.add(newLayer);
      }
    }

     */

    return sortedFeatureLayers;
    //return checkedLayers;
  }

  static TextPainter getNewTextPainter(String text, featureInfo, fontSize, strokeWidth) {
    final textColor = featureInfo['text-color'];
    var textSize = featureInfo['text-size'];
    var font = featureInfo['text-font'];
    var textHaloColorString = featureInfo['text-halo-color'];
    var textHaloWidth = featureInfo['text-halo-width']?.toDouble() ?? 2.0;

    Color textHaloColor = Colors.grey;
    if(textHaloColorString != null) {
      textHaloColor = getColorFromString(textHaloColorString);
    }

    if( textSize == null) {
      textSize = 13.0;
    } else if( textSize is int) {
      textSize = textSize.toDouble();
    } else if(textSize is String) {
      textSize = double.parse(textSize);
    } else {
      textSize = 13.0;
    }

    Color color = Colors.black;
    if(textColor != null) {
      if( textColor is String) {
        color = getColorFromString(textColor);
      } else if(textColor is Color) {
        color = textColor;
      }
    }

    if(font == null) {
      font = 'Roboto';
    } else {
      font = font[0];
    }

    final TextStyle textStyle = TextStyle(
      shadows: [ Shadow(color: textHaloColor , blurRadius: textHaloWidth, offset: Offset(0,0) ),
        Shadow(color: textHaloColor , blurRadius: textHaloWidth, offset: Offset(-1,-1),),
        Shadow(color: textHaloColor , blurRadius: textHaloWidth, offset: Offset(0,-1)),
        Shadow(color: textHaloColor , blurRadius: textHaloWidth, offset: Offset(-1,0))
      ],
      color: color,
      fontSize: textSize,//style.fontSize, //scale == 1 ? scale : 16 / scale, // diffratio, ?
      fontFamily: font,
      fontFamilyFallback: [font[1] ?? font],
      fontWeight: FontWeight.bold,
    );

    final TextSpan textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    return TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(minWidth: 0, maxWidth: double.infinity)
      ..text = textSpan;
  }

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
  var colorMatches = Styles.colorRegex['isHexRgb'].allMatches(colorString).toList();
  if(colorMatches.length > 0) {
    return hexToColor(colorMatches[0][1]);
  }
  colorMatches = Styles.colorRegex['isRgba'].allMatches(colorString).toList();
  if(colorMatches.length > 0) {
    var opacity = colorMatches[0][4] == "" ? "1.0" : colorMatches[0][4];
    return Color.fromRGBO(int.parse(colorMatches[0][1]), int.parse(colorMatches[0][2]), int.parse(colorMatches[0][3]), double.parse(opacity));
  }
  return hslStringToRgbColor(colorString);
}

List stringToHslColor(string) {
  RegExp exp = Styles.colorRegex['isHsla']; //new RegExp(r"hsl\((\d+),\s*([\d.]+)%,\s*([\d.]+)%\)");
  var matches = exp.allMatches(string).toList();
  var valueList = [double.parse(matches[0][1]!),double.parse(matches[0][2]!),double.parse(matches[0][3]!)];
  if(matches[0][4] != null) {
    valueList.add(double.parse(matches[0][4]!));
  }
  return valueList;
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