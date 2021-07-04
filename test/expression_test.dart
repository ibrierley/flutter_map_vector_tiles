import 'package:test/test.dart';
import "package:flutter_map_vector_tile/parse_expressions.dart";

void main() {

  String layerString = 'water';
  double tileZoom = 8.3;
  //var feature = { 'geometry': { 'type': 'LineString'}, 'properties': {"type": "primary_link", "structure": "none", "oneway": false, "class": "primary_link", "len": 40, "iso_3166_2": "GB-ENG", "iso_3166_1": "GB"}} ;
  var feature = {"type": "Feature", "properties": {"admin_level": 1, "worldview": "all", "maritime": false, "disputed": false, "iso_3166_1": "FR"}, "geometry": {"type": "LINESTRING",
    "coordinates": [[[251.5, 191.4375], [252.375, 192.6875]], [[260.0, 190.1875], [259.1875, 190.125], [256.5625, 194.0], [254.4375, 193.75], [254.25, 192.0], [253.0, 192.875]]]}, "layerString": "admin"};

  var testStyle = { 'layers' :
    [{
      "id": "test",
      "type" : "line",
      "layer": "water",
      "filter" : ["all", ["==", ["get", "admin_level"], 1], ["==", ["get", "maritime"], false], ["match", ["get", "worldview"], ["all", "US"], true, false]],
    }]
  };

  test('ALL check, Should be true', () {
    var result = checkFilter(
        testStyle['layers']?[0]['filter'], layerString, feature, tileZoom);
    print("result $result");
    expect(result, true);
  });
}
