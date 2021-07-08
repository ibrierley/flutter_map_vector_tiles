import 'package:test/test.dart';
import "package:flutter_map_vector_tile/parse_expressions.dart";

void main() {

  String layerString = 'water';
  double tileZoom = 8.3;
  //var feature = { 'geometry': { 'type': 'LineString'}, 'properties': {"type": "primary_link", "structure": "none", "oneway": false, "class": "primary_link", "len": 40, "iso_3166_2": "GB-ENG", "iso_3166_1": "GB"}} ;
  var feature1 = {"type": "Feature", "properties": {"admin_level": 1, "worldview": "all", "maritime": false, "disputed": false, "iso_3166_1": "FR"}, "geometry": {"type": "LINESTRING",
    "coordinates": [[[251.5, 191.4375], [252.375, 192.6875]], [[260.0, 190.1875], [259.1875, 190.125], [256.5625, 194.0], [254.4375, 193.75], [254.25, 192.0], [253.0, 192.875]]]}, "layerString": "admin"};

  var feature2 = {"type": "Feature", "properties": {"admin_level": 2, "disputed": 0, "maritime": 1}, "geometry": {"type": "LINESTRING", "coordinates": [[[242.0625, 256.25], [256.25, 247.1875]]], "layerString": "boundary"}};

  var feature3 = {"type": "Feature", "properties": {"worldview": "all", "name_zh-Hans": "怀特岛", "name_de": "Insel Wight", "maki": "marker", "iso_3166_1": "GB", "filterrank": 1,
  "sizerank": 13, "class": "landform", "disputed": false}, "geometry": {"type": "LINESTRING", "coordinates": [19.75, 273.6875]}, };



  var testStyle1 = { 'layers' :
    [{
      "id": "test",
      "type" : "line",
      "layer": "water",
      "filter" : ["all", ["==", ["get", "admin_level"], 1], ["==", ["get", "maritime"], false], ["match", ["get", "worldview"], ["all", "US"], true, false]],
    }]
  };

  var testStyle2 =  { 'layers' :
  [{
  "id": "test",
  "type" : "line",
  "layer": "water",
  "filter" : ["all", ["==", "admin_level", 2], ["!has", "claimed_by"]],
  }]
};

  var testStyle3 = { 'layers' :
  [{
    "id": "test",
    "type": "line",
    "layer": "water",
    "filter": ///["match", ["get", "worldview"], ["all", "US"], true, false]
    ["all", ["match", ["get", "class"], ["glacier", "landform"], ["match", ["get", "worldview"], ["all", "US"], true, false], ["disputed_glacier", "disputed_landform"], ["all", ["==", ["get", "disputed"], "true"], ["match", ["get", "worldview"], ["all", "US"], true, false]], false],
  ["==", ["geometry-type"], "LineString"], ["<=", ["get", "filterrank"], 2]]
  }]
  };

  var feature4 = {"type": "Feature", "properties": {"type": "ferry", "structure": "none", "oneway": false,
    "class": "ferry", "name": "Canary Wharf – Rotherhithe Ferry", "name_script": "Latin"}, "geometry": {"type": "LINESTRING", "coordinates": [[[250.75, 33.0625], [250.25, 33.25]]]}, "layerString": "road"};

  var testStyle4 =
  { 'layers' :
  [{
    "id": "test",
  "type": "line",
  "layer": "water",
  "filter":
  ["all", ["==", ["get", "class"], "path"], ["step", ["zoom"], ["!", ["match", ["get", "type"], ["steps", "sidewalk", "crossing"], true, false]], 16, ["!=", ["get", "type"], "steps"]],
  ["match", ["get", "structure"], ["none", "ford"], true, false], ["==", ["geometry-type"], "LineString"]]

  }]
  };

  var feature5 = {"type": "Feature", "properties": {"worldview": "all", "type": "town", "text_anchor": "bottom", "symbolrank": 11,
      "name_zh-Hans": "切尔滕纳姆", "filterrank": 1, "iso_3166_2": "GB-ENG", "name_fr": "Cheltenham", "name_ko": "첼트넘", "name_script": "Latin", "class": "settlement", "name_it": "Cheltenham",
  "iso_3166_1": "GB", "name": "Cheltenham", "name_ar": "شلتنهام, ",
       "disputed": false, }, "geometry": {"type": "POINT", "coordinates": [-121.0625, -82.8125]}};

  var testStyle5 =
  { 'layers' :
  [{
    "id": "test",
  "type": "line",
  "layer": "water",
  "filter":
  ["all", ["<=", ["get", "filterrank"], 3], ["match", ["get", "class"], "settlement",
  ["match", ["get", "worldview"], ["all", "US"], true, false], "disputed_settlement", ["all", ["==", ["get", "disputed"], true], ["match", ["get", "worldview"], ["all", "US"], true, false]], false],
  ["step", ["zoom"], true, 8, [">=", ["get", "symbolrank"], 11], 10, [">=", ["get", "symbolrank"], 12], 11, [">=", ["get", "symbolrank"], 13], 12,
    [">=", ["get", "symbolrank"], 15], 13, [">=", ["get", "symbolrank"], 11], 14, [">=", ["get", "symbolrank"], 13]]]
  }]
  };

  var feature6 = {"type": "Feature", "properties": {"worldview": "all",
    "disputed": false, }, "geometry": {"type": "POINT", "coordinates": [-121.0625, -82.8125]}};

  var testStyle6 =
  { 'layers' :
  [{
    "id": "test",
    "type": "line",
    "layer": "water",
    "filter":
    ["get", "worldview"]

  }]
  };

  var testStyle6_2 =
  { 'layers' :
  [{
    "id": "test",
    "type": "line",
    "layer": "water",
    "filter":
    ["get", "worldviewx"]

  }]
  };


  /*
  test('ALL !has check, Should be true', () {
    var result = checkFilter(
        testStyle1['layers']?[0]['filter'], layerString, feature, tileZoom);
    print("result $result");
    expect(result, true);
  });

  test('All check should be true', () {
    var result = checkFilter(
        testStyle2['layers']?[0]['filter'], layerString, feature2, tileZoom);
    print("result $result");
    expect(result, true);
  });

   */

  test('All check should be true', () {
    var result = checkFilter(
        testStyle1['layers']?[0]['filter'], layerString, feature1, tileZoom);
    //print("result $result");
    expect(result, true);
  });

  test('All check should be true', () {
    var result = checkFilter(
        testStyle2['layers']?[0]['filter'], layerString, feature2, tileZoom);
    //print("result $result");
    expect(result, true);
  });

  test('All check should be true', () {
    var result = checkFilter(
        testStyle3['layers']?[0]['filter'], layerString, feature3, tileZoom);
    //print("result $result");
    expect(result, true);
  });

  test('Filter should be false', () {
    var result = checkFilter(
        testStyle4['layers']?[0]['filter'], layerString, feature4, tileZoom);
    //print("result $result");
    expect(result, false);
  });
  test('All check should be true', () {
    var result = checkFilter(
        testStyle5['layers']?[0]['filter'], layerString, feature5, tileZoom);
    //print("result $result");
    expect(result, true);
  });

  test('get check should = all', () {
    var result = checkFilter(
        testStyle6['layers']?[0]['filter'], layerString, feature6, tileZoom);
    //print("result $result");
    expect(result, "all");
  });

  test('get check should = all', () {
    var result = checkFilter(
        testStyle6['layers']?[0]['filter'], layerString, feature6, tileZoom);
    //print("result $result");
    expect(result, "all");
  });

  test('get check should = null', () {
    var result = checkFilter(
        testStyle6_2['layers']?[0]['filter'], layerString, feature6, tileZoom);
    //print("result $result");
    expect(result, null);
  });
}
