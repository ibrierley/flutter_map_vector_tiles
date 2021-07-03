import 'dart:math';

main() {

  Map style = { };
  //Map feature = { 'class': 'residential', 'filterrank': 2.0, 'sizerank': 14.0, "name": "Somename", 'rank': 5 };
  //Map feature = {'type': 'mini_roundabout', 'structure': 'none', 'oneway': 'false', 'class': 'pedestrian', 'iso_3166_2': 'GB-ENG', 'iso_3166_1': 'GB'};
  Map feature = {'admin_level': 1, 'sizerank': false, 'class': 'park', 'name': 'Great Britain', 'disputed': 'false',};
  feature ={ 'geometry': { 'type': 'LineString'}, 'properties': {"type": "primary_link", "structure": "none", "oneway": false, "class": "primary_link", "len": 40, "iso_3166_2": "GB-ENG", "iso_3166_1": "GB"}} ;
	String layerString = 'water';
  String type = 'Point';
  

//  print("here1");
  //print("${interp(1.2, 16.0)}");
  //var res = parse(['>=', 4, ["+", 1, 3]]);
  //var res = parse(["any", ["==", true, false], ["==", true, ["==", false, true]]]);
  ///var res = parse(["all", ["==", true, true], ["==", true, ["==", false, false]]]);
  //var res = parse(["none", ["==", false, true], ["==", false, false]]);
  //var res = parse(["!in", "one", ["one","three"]]);

  var testStyle2 = { 'layers' : [{
    "id": "test",
    "type" : "line",
    "layer": "water",
    //"maxZoom" : 6.0,


    //"filter" : ['in', ['get','class'], 'xx', 'residential', 'wibble'],
    "filter" :// ['in', ['get','class'], ['xx', 'residential', 'wibble']],
/*
  [
  "all",
  [
  "step",
  ["zoom"],
  [
  "match",
  ["get", "class"],
  ["motorway", "trunk"],
  true,
  false
  ],
  6,
  [
  "match",
  ["get", "class"],
  ["motorway", "trunk", "primary"],
  true,
  false
  ],
  8,
  [
  "match",
  ["get", "class"],
  ["motorway", "trunk", "primary", "secondary"],
  true,
  false
  ],
  10,
  [
  "match",
  ["get", "class"],
  [
  "motorway",
  "trunk",
  "primary",
  "secondary",
  "tertiary",
  "motorway_link",
  "trunk_link"
  ],
  true,
  false
  ],
  11,
  [
  "match",
  ["get", "class"],
  [
  "motorway",
  "motorway_link",
  "trunk",
  "trunk_link",
  "primary",
  "secondary",
  "tertiary",
  "street"
  ],
  true,
  false
  ],
  12,
  [
  "match",
  ["get", "class"],
  [
  "motorway",
  "motorway_link",
  "trunk",
  "trunk_link",
  "primary",
  "secondary",
  "tertiary",
  "street",
  "street_limited",
  "primary_link"
  ],
  true,
  false
  ],
  13,
  [
  "match",
  ["get", "class"],
  [
  "motorway",
  "motorway_link",
  "trunk",
  "trunk_link",
  "primary",
  "secondary",
  "tertiary",
  "street",
  "street_limited",
  "primary_link",
  "track"
  ],
  true,
  false
  ],
  14,
  [
  "match",
  ["get", "class"],
  [
  "motorway",
  "motorway_link",
  "trunk",
  "trunk_link",
  "primary",
  "primary_link",
  "secondary",
  "secondary_link",
  "tertiary",
  "tertiary_link",
  "street",
  "street_limited",
  "service",
  "track"
  ],
  true,
  false
  ]
  ],
*/
//  ["match", ["get", "structure"], ["none", "ford"], true, false],
  ["==", ["geometry-type"], "LineString"]
//  ],
 //["interpolate", ["linear"], ["zoom"], 15, ["match", ["get", "class"], "park", "hsl(78, 50%, 73%)", "airport", "hsl(225, 42%, 82%)", "cemetery", "hsl(60, 44%, 79%)", "glacier", "hsl(205, 66%, 90%)", "hospital", "hsl(3, 42%, 78%)", "pitch", "hsl(78, 51%, 68%)", "sand", "hsl(43, 48%, 76%)", "school", "hsl(40, 43%, 72%)", "hsl(40, 42%, 76%)"], 16, ["match", ["get", "class"], "park", "hsl(78, 50%, 73%)", "airport", "hsl(225, 56%, 80%)", "cemetery", "hsl(60, 44%, 79%)", "glacier", "hsl(205, 66%, 90%)", "hospital", "hsl(3, 44%, 80%)", "pitch", "hsl(78, 51%, 68%)", "sand", "hsl(43, 48%, 76%)", "school", "hsl(40, 43%, 72%)", "hsl(40, 42%, 76%)"]]

// ["interpolate", ["linear"], ["zoom"], 15, ["match", ["get", "class"], "park", "hsl(78, 50%, 73%)", "airport","hsl(40, 43%, 72%)", "hsl(40, 42%, 76%)"]]

//["interpolate", ["linear"], ["zoom"], 15, ["match", "park", "park", "hsl(78, 50%, 73%)", "airport","hsl(40, 43%, 72%)", "hsl(40, 42%, 76%)"]]

//["interpolate", ["linear"], ["zoom"], 15, ["match", ["get", "class"], "park", "hsl(78, 50%, 73%)", "airport", "hsl(40, 43%, 72%)", "hsl(40, 42%, 76%)"]]

//["match", "park", "park", "hsl(78, 50%, 73%)", "airport","hsl(40, 43%, 72%)", "hsl(40, 42%, 76%)"]

//['all', ['match', ['get', 'class'], ['glacier', 'landform'], ['match', ['get', 'worldview'], ['all', 'US'], true, false], ['disputed_glacier', 'disputed_landform'], ['all', ['==', ['get', 'disputed'], true], ['match', ['get', 'worldview'], ['all', 'US'], true, false]], false], ['==', ['geometry-type'], 'LineString'], ['<=', ['get', 'filterrank'], 2]]
//['all','landform']
  ///['all', ['==', ['get', 'admin_level'], 1]]
//  ["match", ["get", "class"], "park", "hsl(78, 50%, 73%)", "hsl(40, 42%, 76%)"]
//["match", ["get", "class"], "park", "hsl(78, 50%, 73%)", "airport", "hsl(225, 42%, 82%)", "cemetery", "hsl(60, 44%, 79%)", "glacier", "hsl(205, 66%, 90%)", "hospital", "hsl(3, 42%, 78%)", "pitch", "hsl(78, 51%, 68%)", "sand", "hsl(43, 48%, 76%)", "school", "hsl(40, 43%, 72%)", "hsl(40, 42%, 76%)"]
//['all', ['match', ['landform'], ['glacier', 'landform'], ['disputed_glacier', 'disputed_landform'], false]]
//[
//              "match",
//              ["get", "class"],
//              ["all", "landform"],
//              true,
//              false
//            ]

/*
[
        "all",
[
          "match",
          ["get", "class"],
          ["glacier", "landform"],
          ["match", ["get", "worldview"], ["all", "US"], true, false],
          ["disputed_glacier", "disputed_landform"],
          [
            "all",
            ["==", ["get", "disputed"], "true"],
            [
              "match",
              ["get", "worldview"],
              ["all", "US"],
              true,
              false
            ]
          ],
          false
        ],
        ["==", ["geometry-type"], "LineString"],
        ["<=", ["get", "filterrank"], 2]
]
*/
/*
    {
      "base": 1.2,
      "stops": [
        [11, 0.5],
        [20, 6]
      ]
    }
*/
///  ['step', ['zoom'], ['match', ['get', 'class'], ['pedestrian'], true, false], 15, ['match', ['get', 'class'], ['path', 'pedestrian'], true, false]]

//['step', ['zoom'], ['match', ['get', 'class'], ['pedestrian'], true, false], 15, false]
//['step', ['zoom'], ['match', 'mini_roundabout', ['pedestrian'], true, false], 15, false]

//['match', ['get', 'class'], ['path', 'pedestrian'], true, false]


    //],
       // ["case", ["has", ], 1, 0],
  //]

      //["coalesce", ["get", "name"], ["get", "class"]],
    //["concat", ["get", "class"], "b", "c"]
    //"step",
    //["zoom"],
    //["concat", ["get", "maki"], "-11"],
    //15,
    //["concat", ["get", "maki"], "-15"],
    //]
    //["upcase", "wibble"],
     // ]
    /*
[
    "match",
    ["get", "class"],
      [
        "motorway",
        "xxresidential",
      ],
      3,
      ["blah", "residential"],
      9,
      4
      */

    //  true,
    //  [false],
    //  1,
    //  [false],
    //  2,
    //  [false],
    //  3,
    //  4
    //],

      ///"all",
      ///["==", ["get", "class"], "residential"],
      //["!in", "brunnel", "bridge", "tunnel"],
      //["in", "class", "residential", "trunk"]
    ///],
    }
    ]
  };



  //print("$res");
  //var args = ["in", true, [false, false]];
  //var test = ["any", args[1], ...args.sublist(2)];
  //print("$test");
 var test = checkFilter( testStyle2['layers']?[0]['filter'], layerString,  feature, 14);
  print("FINAL IS $test");
}


var xxkeys = [
  [0,0],
    [12.5, 0],
    [13, 1.5],
    [14, 2.5],
    [20, 11.5],
  [20,11.5]
];

dynamic interp (base, val, tempkeys) {
//print("III $base >> $val >> $tempkeys");
  ///print("INTERP $base, $val, $tempkeys");
  var keys = [];

  if(!(tempkeys[0] is List)) {
    for(var c=0; c<tempkeys.length; c=c+2) {
      //keys.add([tempkeys[c],tempkeys[c+1]]);
	keys.add([tempkeys[c],tempkeys[c+1]]);
    }
  } else {
    keys = tempkeys;
  }

  ///print("keys is $keys");
  ///print("Val is $val");


  if(val >= keys[keys.length-1][0].toDouble()) return keys[keys.length-1][1];
  if(val <= keys[0][0].toDouble()) return keys[0][1];

  ///print("here.....");

  var i;
  for (i = 0; i < keys.length; i++) {
    if (keys[i][0].toDouble() > val) break;
  }

  ///print("herex.....$i... ${keys[i][1]}");

  var ii = i-1;
  if(keys[ii][1] is String || keys[ii][1] is bool) // not a num, so dont interp
    return keys[ii][1];

  ///print("here.....3");


  double before0 =  keys[ii][0].toDouble();
  double after0 = keys[ii+1][0].toDouble();

  double before1 = keys[ii][1].toDouble();
  double after1 = keys[ii+1][1].toDouble();
  ///print("here3.5");


  ///print ("Here4");

  var a = (val - before0) / (after0 - before0);

  ///print("here5");

  var intKey = before1 * (1-a) + after1 * a;

  ///print("here6");
  //var lower = keys[ii];
  //var higher = keys[ii+1];

  ///print("Dump base: $base val: $val lower: ${before0} higher:${after0}");
  ///print(pow(base, after0 - before0) - 1);

  var ratio = (pow(base, val - before0) - 1) / (pow(base, after0 - before0) - 1);

  ///print("Dumper ${before1} $ratio ${after1}");


  if(base > 1) // exponential
    intKey = (before1 * (1 - ratio)) + (after1 * ratio);

  ///print("test ");

  return intKey;

}

class Parser {

  final Map feature;
  final String layerString;
  final double tileZoom;
  final type;
  Map store = {};

  Parser(this.layerString, this.feature, this.type, this.tileZoom);

  dynamic parse(dynamic args, [bool useList = true]) {
    ///print("FEATURESTART featre is $feature");

    ///if (eval && !(args is List)) return args;

    ///print("part2");



    ///if(args is double || args is int) return args;


    //print("still here $args");

    var command = args is List ? args[0] : args;
    var result;

   ///print("here2 [$command]");

    if( args is Map) { // oslayer style ?
      if(args.containsKey("base")) {
        //(base, val, tempkeys)
        result = interp(args['base'], tileZoom, args['stops']);
      } else if (args.containsKey("stops")) {
        ///print("map found ... stops ${args['stops']}");

        result = parse([...["stops" ],...args['stops']]);
        ///print("result was $result with zoom $tileZoom");
      }  else {
        result = args;
      }
      return result;
    }

    ///print("Before switch [$command]");

    if(command is String) {
      switch (command) {
        case "*":
          result = parse(args[1]) * parse(args[2]);
          break;
        case "/":
          result = parse(args[1]) / parse(args[2]);
          break;
        case "+":
          result = parse(args[1]) + parse(args[2]);
          break;
        case "-":
          result = parse(args[1]) - parse(args[2]);
          break;
        case "==":
          var s1 = parse(args[1]);
          var s2 = parse(args[2]);
	  if(s1 is String) { // messy LineString vs LINESTRING etc
	    s2 = s2.toString(); // sometimes we seem to get a string false, rather than a bool type
	    ///print("$s1 and $s2 $feature");
	    result = s1.toLowerCase() == s2.toLowerCase();
	  } else {
            result = s1 == s2;
          }
          break;
        case "!=":
          result = parse(args[1]) != parse(args[2]);
          break;
        case ">=":
          result = parse(args[1]) >= parse(args[2]);
          break;
        case "<=":
          ///print("uioiu $args $feature");
          result = parse(args[1]) <= parse(args[2]);
          break;
        case "<":
          result = parse(args[1]) < parse(args[2]);
          break;
        case ">":
          result = parse(args[1]) > parse(args[2]);
          break;
        case "any":
        //print("anytest $args");
          result = args.sublist(1).any((val) {
            return parse(val) as bool;
          }); // return parse(val);
          break;
        case '\$type':
        //print("TYPE!!!!!!!!!!!!!! will return $type");
          result = type;
          break;
        case "all":
          var sublist = args.sublist(1);
          var all = true;
	  var notAllBool = false;
	  for( var c=0; c<sublist.length; c++ ) {
		var test = parse(sublist[c]);

		if( (test is bool) && test == false ) {
			all = false;
			break;
		} else if( (test is bool) && test == true ) {

		} else {
			notAllBool = true;
		}
		
          }
	if(notAllBool) {
		result = args;
	} else {
		result = all;
	}
	/*
	if( 
          result = args.sublist(1).every((val) {
		if( parse(val) is bool ) {
			return bool;
		}
            //return parse(val) as bool;
          }); // return parse(val);
          break;
        ///case "none":
         // print("Doing [none] and args is $args");
        ///  result = "none";

        if(args is List) {
          //print("is list...");
          //print("${args.sublist(1)}");
          if(args.length > 1) {
            //print("herekkk");
            //print("ii ${args.sublist(1)}");
            result = !parse(["any", ...args.sublist(1)]); // return parse(val);
          } else {
            //print("herelll");
            result = args;
          }
          //print("passed none list");
        } else {
          //print("String so none...");
          result = "none";
        }
	*/

          break;
        case "in":

        /// http://kuanbutts.com/2019/02/18/mapbox-expressions/
        //print("xx got here IN $args");
          if (args.length >= 2) {
            //print("enough args");
            //print("zznext bit in ${args[1]}   .. ${args[2]}   ${args.sublist(2)}  ");
            var featureVal = parse(args[1]);
            //print("featureval $featureVal");
            if (featureVal != null) {
             // print("herepppp  ${args.sublist(2)} any of $featureVal");
              var checkList;
              if (args[2] is List) {
//print("opt1 ${args[2]}");
                checkList = parse(args[2]);
              } else {
//print("opt2");
                checkList = parse(args.sublist(2));
              }

              //print("IN ANY TEST $checkList");
              result = checkList.any((val) {
                //print("Checking $featureVal vs parsing $val");
                return featureVal == parse(val);
              });
              ///print("res kkk = $result");
            } else {
              result = false;
            }
          }
          //print("args small");
          break;
        case "!in":
        //print("yy got here !in");
          result = !parse(["in", ...args.sublist(1)]);
          //print("next bit res is $result");
          break;
        case "get":
        //print("Getting....");
          if (args[1] != null) {
            result = feature[args[1]];
            ///print("got $result and type is ${result.runtimeType}");
            //print("Get is ${args[1]} $feature");
            // hack as sometimes we get a filterrank of false...
            /*
            if (args[1] == 'filterrank' && feature.containsKey('filterrank')) {
              if (feature['filterrank'] is bool || feature['filterrank'] == "false") {
                //print("ppp");
                result = 3;
              } else {
                //print("dlksa");
                result = feature['filterrank'];
              }
            } else {
             // print("remainder");
              result = feature[args[1]];
            }
            */

            //print("Get is ${args[1]} result is $result");
          } else {
            //print("GET not found");
          }
          return result;

          /// just let it pass through ?
          break;
        case "has":
        //print("DOING HAS!!");
          if (feature.containsKey(parse(args[1]))) {
            result = true;
          } else {
            result = false;
          }
          //print("RESULT $result");
          break;
        case "match":
          ///print("wwwChecking match $args");
        //print(args.sublist(1, args.length-1));
        //print( args[args.length-1]);
        ///result = parse(["in", ...args.sublist(1, args.length-1)]) ? true : args[args.length-1];

          var checkArg = parse(args[1]);
          //print("Checkarg is $checkArg");
          for (var c = 2; c < args.length - 2; c = c + 2) {
            //print("loop doing $checkArg c=$c   ${args[c]}");
            ///if(parse(["in", checkArg, args[c]], false)) {
            if (args[c] is String) {
              //print("HEREXX parsing ${args[c]}");
              if (checkArg == parse(args[c])) {
                return args[c + 1];
              }
            } else if (args[c] is List) {
              //print("DOING MATCH CHECKING $checkArg in ${args[c]}");
              if (parse(["in", checkArg, args[c]])) {
                //print("MATCH CHECKING $checkArg in ${args[c]} matches");
                return args[c + 1];
              } else {
                //print("MATCH CHECKING $checkArg in ${args[c]} fails");
              }
            } else {
              //print("NOT SURE $args");
            }
            //if(checkArg == parse(args[c])) {
            //  return args[c+1];
            //}
          }
          return args.last;

          /// just let it pass through ?
          break;
        case "coalesce":
        //print("Doing coalesce $args");
          for (var c = 1; c < args.length; c++) {
            //print("will parse ${args[c]}");
            var test = parse(args[c]);
            //print("TET PARSE IS $test");
            if (test != null) {
              return test;
            }
          }
          return;
          break;
        case "concat":
          result = "";
          for (var c = 1; c < args.length; c++) {
            result += parse(args[c]).toString();
          }
          break;
        case "downcase":
          result = args[1].toString().toLowerCase();
          break;
        case "upcase":
          result = args[1].toString().toUpperCase();
          break;
        case "literal":
          result = args[1];
          break;
        case "zoom":
          result = tileZoom;
          //print("got zoom, result is $result");
          break;
        case "step":
        //["step", ["zoom"], "butt", 11, "round"],
        //print("Doing STEP!!! args[2] is ${args[2]} trying to parse ");
          result = parse(args[2]);
          STEP: for (var c = 3; c < args.length; c = c + 2) {
            //print("Checking parse ${args[1]}");
            //print("vs parse ${args[c]}");
            if (parse(args[1]) >= parse(args[c])) {
              result = parse(args[c + 1]);
            } else {
              break STEP;
            }
          }
          break;
        case "stops":
          ///print("doing later case stops.......$args");
          result = parse(args[1][1]);
          STOP: for (var c = 1; c < args.length; c = c + 1) {
            ///print("Checking tilezoom vs parse ${args[c]}");
            if (tileZoom >= parse(args[c][0])) {
              result = parse(args[c][1]);
            } else {
              break STOP;
            }
          }
          break;
        case "case":
        //print("Doing CASE $args");
          result = parse(args[args.length - 1]);
          //print("FALLBACK RESULT SO FAR IS $result");
          xcase:
          for (var c = 1; c < args.length - 1; c = c + 2) {
            //print("CHECKING!!!! ${args[c]}");
            if (parse(args[c])) {
              //print("OK! Setting result");
              result = parse(args[c + 1]);
              break xcase;
            }
          }
          break;
        case "let":
        //print("Doing let");
          let:
          for (var c = 1; c < args.length - 1; c = c + 2) {
            store[args[c]] = parse(args[c + 1]);
          }
          result = parse(args[args.length - 1]);
          //print("STORE $store");
          break;
        case "false":
          result = false;
          break;
        case "true":
          result = true;
          break;
        case "var":
          result = store[args[1]];
          break;
        case "geometry-type":
          result = type.toUpperCase();
          ///print("Geomtype = $result");
          break;
        case "interpolate": // base, val, keys
          var type = args[1][0];
          //print("TYPE IS $type");
          if (type == "linear") {
            //print("linear");
 //print("interplinear, ${args[2]}     >>   ${args.sublist(3)}}");
 //print("${parse(args[2])}");
//var testres = args.sublist(3).map((val){return parse(val); }).toList();
//print("TEST $testres");
//           result = interp(1.0, parse(args[2]), parse(args.sublist(3)));
  result = interp(1.0, parse(args[2]), args.sublist(3).map((val){return parse(val); }).toList() );

          } else if (type == "exponential") {
            //print("expo");
//            result = interp(
//                parse(args[1][1]), parse(args[2]), parse(args.sublist(3)));
		result = interp( parse(args[1][1]), parse(args[2]), args.sublist(3).map((val){return parse(val); }).toList() );
          } else if (type == "identity") {
            result = args[1]; // untested
            //print("no interp type found");
          }
          break;
        case "xxxxfilterrank":

          //print("got zoom, result is $result");
          result = args;
          break;
      }
    }

    if(args is String) {
      if(feature.containsKey(args))
	      result = feature[args];
      if(args == "false")
        result = false;
    }

    if(result is String) {
      //print("String res is $result");
    }
    //print("near end...");
    //if(result == null) {
   //   if(args is String) {
   //     print("String check $args $feature");
   //     if(feature.containsKey(args))
   //       result = feature[args]; /// not sure this is right for mapbox, but ok for others..maybe a flag needed

   //   } //else if(args is List && (args.length == 1)) {
        //print("LEN1 ${args}");
        //result = parse(args[0]);

   // } else {
        //print("not an expression, returning $args");
   //     result = args;
     // }
   // }


    //print("This res = $result ?? $args");
    var xres = result != null ? result : args;

    return xres;
  }
}


dynamic checkFilter(dynamic style, String layerString, Map featureInfo, double tileZoom) {

  ///print("Checking filter $layerString $style $feature");

  ///List layers = style['layers'] ?? [];

  var feature = featureInfo['properties'];
  var geom = featureInfo['geometry'];
  var type = geom['type'];
  var parser = new Parser(layerString, feature, type, tileZoom);
  var result;

  ///print("checkfilter type check   $type ${style} $layerString $feature");

  try {
    //print("here21");
    result = parser.parse(style);
    //print("here22 $result");

  } catch(e) { print("FilterParseError: $e"); }


  return result;
}

var ostestStyle = {
  "version": 8,
  "sprite": "https://api.os.uk/maps/vector/v1/vts/resources/sprites/sprite",
  "glyphs": "https://api.os.uk/maps/vector/v1/vts/resources/fonts/{fontstack}/{range}.pbf",
  "sources": {
    "esri": {
      "type": "vector",
      "url": "https://api.os.uk/maps/vector/v1/vts"
    }
  },
  "layers": [
    {
      "id": "background",
      "type": "background",
      "paint": {
        "background-color": "#C5CDD0"
      }
    },
    {
      "id": "European_land/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "European_land",
      "maxzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#F1EFEC"
      }
    },
    {
      "id": "OS/GB_land/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "GB_land",
      "layout": {},
      "paint": {
        "fill-color": "#F1EFEC"
      }
    },
    {
      "id": "OS/National_parks/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "National_parks",
      "minzoom": 1,
      "maxzoom": 7,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Urban_areas/National/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Urban_areas",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 1,
      "maxzoom": 5,
      "layout": {},
      "paint": {
        "fill-color": "rgba(230,229,225,0.3)"
      }
    },
    {
      "id": "OS/Urban_areas/Regional/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Urban_areas",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 5,
      "maxzoom": 6,
      "layout": {},
      "paint": {
        "fill-color": "rgba(230,229,225,0.7)"
      }
    },
    {
      "id": "OS/Functional_sites/Air Transport/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Functional_sites/Education/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Functional_sites/Medical Care/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Functional_sites/Road Transport/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Functional_sites/Water Transport/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Functional_sites",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EEE7DD",
        "fill-opacity": 0.5
      }
    },
    {
      "id": "OS/Greenspace:2/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Greenspace:2",
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#EAEEE7"
      }
    },
    {
      "id": "OS/Greenspace:2/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Greenspace:2",
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#EAEEE7",
        "line-width": {
          "stops": [
            [
              6,
              0
            ],
            [
              7,
              0
            ],
            [
              8,
              0
            ],
            [
              9,
              0
            ],
            [
              10,
              0.1
            ],
            [
              11,
              0.15
            ],
            [
              12,
              0.25
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicArea_1/Unclassified",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        48
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#efeee8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Landform Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        47
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#eae9e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Tidal Water",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        46
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Landform Natural",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        45
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#efece8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Glasshouse",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        44
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e1e5e1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rail Natural",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        42
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e7e6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Structure",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        43
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rail Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        41
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e7e6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Path",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        40
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Inland Water",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        39
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Roadside Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        38
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#eae9e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Roadside Natural",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        37
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#efece8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Road Or Track",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        36
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Natural",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        34
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#efece8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        35
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#eae9e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Foreshore",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        30
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#E9E7E2"
      }
    },
    {
      "id": "OS/TopographicArea_1/Reeds/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        29
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Reeds/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        29
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Reeds/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#E4E5E4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/3",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Marsh/3"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/2",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Marsh/2"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Marsh/1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Shingle",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        27
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e8e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Marsh/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        28
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Marsh/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Mud",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        26
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9e7e2"
      }
    },
    {
      "id": "OS/TopographicArea_1/Sand",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        25
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9e7e2"
      }
    },
    {
      "id": "OS/TopographicArea_1/Saltmarsh/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        24
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#e4e5e4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Heath/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        23
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9ede6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Saltmarsh/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        24
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Saltmarsh/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Heath/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        23
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Heath/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rough Grassland/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        22
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9ede6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rough Grassland/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        22
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Rough Grassland/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Scree/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        21
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e8e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Scree/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        21
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Scree/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rock/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        20
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e8e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rock/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        20
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Rock/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Boulders/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        19
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e8e8e8"
      }
    },
    {
      "id": "OS/TopographicArea_1/Boulders/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        19
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Boulders/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Scrub/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        18
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e9ede6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Scrub/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        18
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Scrub/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Coppice Or Osiers/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        17
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Coppice Or Osiers/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        17
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Coppice Or Osiers/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Orchard/2",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        16
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Agricultural Land",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        15
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dde3da"
      }
    },
    {
      "id": "OS/TopographicArea_1/Orchard/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        16
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Orchard/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Coniferous Tree/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        14
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Coniferous Tree/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        14
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Coniferous Tree/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Nonconiferous Tree/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        13
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Nonconiferous Tree/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        13
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Nonconiferous Tree/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Mixed Woodland/4",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Footbridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        11
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Mixed Woodland/0",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 11,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Mixed Woodland/0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Canal",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        10
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Step",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        9
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Track",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        8
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Pylon",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddcd0"
      }
    },
    {
      "id": "OS/TopographicArea_1/Traffic Calming",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Level Crossing",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_1/Rail Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dedddd"
      }
    },
    {
      "id": "OS/TopographicArea_1/Road Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_1/Archway",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddbd6"
      }
    },
    {
      "id": "OS/TopographicArea_1/Multi Surface",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#f2eee4"
      }
    },
    {
      "id": "OS/TopographicArea_1/Cliff",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        32
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Cliff",
        "fill-opacity": 0.4
      }
    },
    {
      "id": "OS/TopographicArea_1/Slope",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        31
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-pattern": "OS/TopographicArea_1/Slope",
        "fill-opacity": 0.4
      }
    },
    {
      "id": "OS/Woodland:3/Local/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Woodland:3",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 8,
      "maxzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/Woodland:3/National/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Woodland:3",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 1,
      "maxzoom": 6,
      "layout": {},
      "paint": {
        "fill-color": "rgba(216,221,212,0.6)"
      }
    },
    {
      "id": "OS/Woodland:3/Regional/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Woodland:3",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 6,
      "maxzoom": 8,
      "layout": {},
      "paint": {
        "fill-color": "#D8DDD4"
      }
    },
    {
      "id": "OS/District_buildings/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "District_buildings",
      "minzoom": 6,
      "maxzoom": 8,
      "layout": {},
      "paint": {
        "fill-color": "#E1E0DB"
      }
    },
    {
      "id": "OS/Local_buildings/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Local_buildings",
      "minzoom": 8,
      "maxzoom": 11,
      "layout": {},
      "paint": {
        "fill-color": "#E1E0DB"
      }
    },
    {
      "id": "OS/Contours/Index",
      "type": "line",
      "source": "esri",
      "source-layer": "Contours",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 3,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#857A6A",
        "line-width": {
          "stops": [
            [
              3,
              0.1
            ],
            [
              4,
              0.15
            ],
            [
              5,
              0.4
            ],
            [
              6,
              0.4
            ],
            [
              7,
              0.5
            ],
            [
              8,
              0.6
            ],
            [
              9,
              0.8
            ],
            [
              10,
              1
            ],
            [
              11,
              1
            ],
            [
              12,
              1.2
            ]
          ]
        },
        "line-opacity": 0.3
      }
    },
    {
      "id": "OS/Contours/Normal",
      "type": "line",
      "source": "esri",
      "source-layer": "Contours",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#857A6A",
        "line-width": {
          "stops": [
            [
              8,
              0.4
            ],
            [
              9,
              0.4
            ],
            [
              10,
              0.5
            ],
            [
              11,
              0.6
            ],
            [
              12,
              0.7
            ]
          ]
        },
        "line-opacity": 0.3
      }
    },
    {
      "id": "OS/Surfacewater/Local",
      "type": "fill",
      "source": "esri",
      "source-layer": "Surfacewater",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0",
        "fill-outline-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/Surfacewater/National/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Surfacewater",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 2,
      "maxzoom": 3,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/Surfacewater/Regional/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Surfacewater",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 3,
      "maxzoom": 7,
      "layout": {},
      "paint": {
        "fill-color": "#C5CDD0"
      }
    },
    {
      "id": "OS/Foreshore/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "Foreshore",
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#E9E7E2"
      }
    },
    {
      "id": "OS/TopographicArea_2/Structure",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_2/Manmade",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#eae9e8"
      }
    },
    {
      "id": "OS/TopographicArea_2/Building/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddbd6"
      }
    },
    {
      "id": "OS/TopographicArea_2/Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#e0d2d1"
      }
    },
    {
      "id": "OS/TopographicArea_2/Rail Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dedddd"
      }
    },
    {
      "id": "OS/TopographicArea_2/Road Bridge",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#ffffff"
      }
    },
    {
      "id": "OS/TopographicArea_2/Archway",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_2",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 11,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddbd6"
      }
    },
    {
      "id": "OS/TopographicLine/Property Closing Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          6,
          6
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Step",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              2,
              0.4
            ],
            [
              13,
              0.4
            ],
            [
              14,
              0.8
            ],
            [
              15,
              1.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Mean High Water",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              2,
              0.8
            ],
            [
              13,
              0.9
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2.1
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Traffic Calming",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#ffffff",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Standard Gauge Track",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39b",
        "line-width": {
          "stops": [
            [
              13,
              0.8
            ],
            [
              14,
              1.2
            ],
            [
              15,
              2.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Mean Low Water",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              1.6
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Path",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 11,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          6,
          4
        ],
        "line-width": {
          "stops": [
            [
              12,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Overhead Construction",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c4c3bf",
        "line-dasharray": [
          2,
          2
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Culvert",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        8
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              1.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Pylon",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        9
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#cfcfc9",
        "line-width": {
          "stops": [
            [
              13,
              1
            ],
            [
              14,
              1.8
            ],
            [
              15,
              2.6
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Ridge Or Rock Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        10
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              13,
              1.3
            ],
            [
              14,
              2
            ],
            [
              15,
              2.6
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Narrow Gauge Track",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        11
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39b",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              1.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Railway Buffer",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39c",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              1.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Tunnel Edge",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        13
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#b0b6b7",
        "line-dasharray": [
          2.5,
          2.5
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              2.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Line Of Posts",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        14
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#bababa",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Drain",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        15
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Default Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        16
      ],
      "minzoom": 11,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              12,
              0.4
            ],
            [
              14,
              0.7
            ],
            [
              15,
              1.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicArea_1/Building/1",
      "type": "fill",
      "source": "esri",
      "source-layer": "TopographicArea_1",
      "filter": [
        "==",
        "_symbol",
        33
      ],
      "minzoom": 12,
      "layout": {},
      "paint": {
        "fill-color": "#dddbd6"
      }
    },
    {
      "id": "OS/TopographicLine/Building Outline",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        17
      ],
      "minzoom": 11,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#d5d4cd",
        "line-width": {
          "stops": [
            [
              12,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Edge Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        18
      ],
      "minzoom": 11,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          2,
          2
        ],
        "line-width": {
          "stops": [
            [
              12,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Road Or Track",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        19
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#d5d4cd",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Building Division",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        20
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Inland water Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        21
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c5cdd0",
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/General Surface Natural Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        22
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          2,
          2
        ],
        "line-width": 0.7
      }
    },
    {
      "id": "OS/TopographicLine/Building Overhead Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        23
      ],
      "minzoom": 11,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          6,
          4
        ],
        "line-width": {
          "stops": [
            [
              12,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Landform Natural Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        24
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Historic Interest Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        25
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Landform Manmade Line",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        26
      ],
      "minzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-dasharray": [
          4,
          4
        ],
        "line-width": {
          "stops": [
            [
              13,
              0.7
            ],
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/TopographicLine/Unclassified",
      "type": "line",
      "source": "esri",
      "source-layer": "TopographicLine",
      "filter": [
        "==",
        "_symbol",
        27
      ],
      "minzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#c6c5c4",
        "line-width": {
          "stops": [
            [
              13,
              0.5
            ],
            [
              14,
              1
            ],
            [
              15,
              2.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Waterlines/District",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1
      }
    },
    {
      "id": "OS/Waterlines/Local",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1
      }
    },
    {
      "id": "OS/Waterlines/Local_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1
      }
    },
    {
      "id": "OS/Waterlines/MHW",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1.6
      }
    },
    {
      "id": "OS/Waterlines/MHW_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 4,
      "maxzoom": 8,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1.3
      }
    },
    {
      "id": "OS/Waterlines/MLW",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 6,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 0.8
      }
    },
    {
      "id": "OS/Waterlines/MLW_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 4,
      "maxzoom": 6,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 0.5
      }
    },
    {
      "id": "OS/Waterlines/National",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 1,
      "maxzoom": 2,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 0.4
      }
    },
    {
      "id": "OS/Waterlines/Regional",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 3,
      "maxzoom": 5,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 1
      }
    },
    {
      "id": "OS/Waterlines/Regional_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Waterlines",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 2,
      "maxzoom": 3,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#C5CDD0",
        "line-width": 0.5
      }
    },
    {
      "id": "OS/Roads/Tunnels,<Null>",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        19
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "line-color": "#4B4444",
        "line-dasharray": [
          4,
          2.5
        ],
        "line-width": {
          "stops": [
            [
              5,
              0.7
            ],
            [
              8,
              0.8
            ],
            [
              10,
              1.6
            ],
            [
              12,
              1.6
            ]
          ]
        },
        "line-opacity": 0.4
      }
    },
    {
      "id": "OS/Roads/A Road,0_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 3,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 1.3
      }
    },
    {
      "id": "OS/Roads/Motorway,0_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 1,
      "maxzoom": 3,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 2
      }
    },
    {
      "id": "OS/Roads/Primary,0_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 1,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.3
            ],
            [
              3,
              2
            ],
            [
              4,
              1.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/A Road,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.8
            ],
            [
              4,
              1.8
            ],
            [
              5,
              2.3
            ],
            [
              6,
              2.8
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.4
            ],
            [
              11,
              5.6
            ],
            [
              12,
              9.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/B Road,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        8
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              4,
              2.8
            ],
            [
              5,
              1.9
            ],
            [
              6,
              2.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.2
            ],
            [
              11,
              5.6
            ],
            [
              12,
              9.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Minor,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        10
      ],
      "minzoom": 6,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              5,
              1.875
            ],
            [
              6,
              1.875
            ],
            [
              8,
              2.5
            ],
            [
              9,
              3.3
            ],
            [
              10,
              4.2
            ],
            [
              11,
              4.6
            ],
            [
              12,
              6.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Local,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        13
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              9,
              2.3
            ],
            [
              10,
              2.9
            ],
            [
              11,
              3.75
            ],
            [
              12,
              5.4
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Restricted,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        15
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              9,
              2
            ],
            [
              10,
              2.7
            ],
            [
              11,
              3
            ],
            [
              12,
              4.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Guided Busway,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        17
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              8,
              2
            ],
            [
              9,
              2
            ],
            [
              10,
              2.7
            ],
            [
              11,
              3.3
            ],
            [
              12,
              3.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 3,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              2,
              3
            ],
            [
              3,
              3
            ],
            [
              4,
              3.5
            ],
            [
              5,
              4
            ],
            [
              6,
              4.25
            ],
            [
              8,
              4.5
            ],
            [
              9,
              5
            ],
            [
              10,
              5.5
            ],
            [
              11,
              8
            ],
            [
              12,
              12
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Primary,0/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              2.5
            ],
            [
              4,
              2
            ],
            [
              5,
              2.5
            ],
            [
              6,
              3.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.6
            ],
            [
              11,
              6.7
            ],
            [
              12,
              10
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,1_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 1,
      "maxzoom": 3,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 2
      }
    },
    {
      "id": "OS/Roads/Primary,1_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 1,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.3
            ],
            [
              3,
              2
            ],
            [
              4,
              1.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/A Road,1_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 3,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 1.3
      }
    },
    {
      "id": "OS/Roads/A Road,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.9
            ],
            [
              4,
              1.9
            ],
            [
              5,
              2.3
            ],
            [
              6,
              2.8
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.4
            ],
            [
              11,
              5.6
            ],
            [
              12,
              9.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/B Road,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        9
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              4,
              2.8
            ],
            [
              5,
              1.9
            ],
            [
              6,
              2.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.2
            ],
            [
              11,
              5.6
            ],
            [
              12,
              9.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Minor,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        11
      ],
      "minzoom": 6,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              5,
              1.875
            ],
            [
              6,
              1.875
            ],
            [
              8,
              2.5
            ],
            [
              9,
              3.3
            ],
            [
              10,
              4.2
            ],
            [
              11,
              4.6
            ],
            [
              12,
              6.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Local,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        14
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              9,
              2.3
            ],
            [
              10,
              2.9
            ],
            [
              11,
              3.75
            ],
            [
              12,
              5.4
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Restricted,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        16
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              9,
              2
            ],
            [
              10,
              2.7
            ],
            [
              11,
              3
            ],
            [
              12,
              4.2
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Guided Busway,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        18
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              8,
              2
            ],
            [
              9,
              2
            ],
            [
              10,
              2.7
            ],
            [
              11,
              3.3
            ],
            [
              12,
              3.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 3,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              2,
              3
            ],
            [
              3,
              3
            ],
            [
              4,
              3.5
            ],
            [
              5,
              4
            ],
            [
              6,
              4.25
            ],
            [
              8,
              4.5
            ],
            [
              9,
              5
            ],
            [
              10,
              5.5
            ],
            [
              11,
              8
            ],
            [
              12,
              12
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Primary,1/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              2.5
            ],
            [
              4,
              2
            ],
            [
              5,
              2.5
            ],
            [
              6,
              3.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.6
            ],
            [
              11,
              6.7
            ],
            [
              12,
              10
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,2_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 1,
      "maxzoom": 3,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": 2
      }
    },
    {
      "id": "OS/Roads/Primary,2_1",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 1,
      "maxzoom": 4,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              1.3
            ],
            [
              3,
              2
            ],
            [
              4,
              1.3
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Motorway,2/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 3,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              2,
              3
            ],
            [
              3,
              3
            ],
            [
              4,
              3.5
            ],
            [
              5,
              4
            ],
            [
              6,
              4.25
            ],
            [
              8,
              4.5
            ],
            [
              9,
              5
            ],
            [
              10,
              5.5
            ],
            [
              11,
              8
            ],
            [
              12,
              12
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Primary,2/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              1,
              2.5
            ],
            [
              4,
              2
            ],
            [
              5,
              2.5
            ],
            [
              6,
              3.3
            ],
            [
              8,
              3.3
            ],
            [
              9,
              3.9
            ],
            [
              10,
              4.5
            ],
            [
              11,
              6.7
            ],
            [
              12,
              10
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Roads/Minor,2/0",
      "type": "line",
      "source": "esri",
      "source-layer": "Roads",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 6,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#FFFFFF",
        "line-width": {
          "stops": [
            [
              5,
              1.875
            ],
            [
              6,
              1.875
            ],
            [
              8,
              2.5
            ],
            [
              9,
              3.3
            ],
            [
              10,
              4.2
            ],
            [
              11,
              4.6
            ],
            [
              12,
              6.7
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Railways/Multi Track",
      "type": "line",
      "source": "esri",
      "source-layer": "Railways",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39c",
        "line-width": {
          "stops": [
            [
              6,
              0.75
            ],
            [
              7,
              0.75
            ],
            [
              8,
              0.75
            ],
            [
              9,
              0.75
            ],
            [
              10,
              0.75
            ],
            [
              11,
              1
            ],
            [
              12,
              0.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Railways/Narrow Gauge",
      "type": "line",
      "source": "esri",
      "source-layer": "Railways",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39c",
        "line-width": {
          "stops": [
            [
              8,
              0.2
            ],
            [
              9,
              0.2
            ],
            [
              10,
              0.2
            ],
            [
              11,
              0.25
            ],
            [
              12,
              0.25
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Railways/Single Track",
      "type": "line",
      "source": "esri",
      "source-layer": "Railways",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {
        "line-cap": "round",
        "line-join": "round"
      },
      "paint": {
        "line-color": "#a7a39c",
        "line-width": {
          "stops": [
            [
              6,
              0.6
            ],
            [
              7,
              0.6
            ],
            [
              8,
              0.6
            ],
            [
              9,
              0.6
            ],
            [
              10,
              0.6
            ],
            [
              11,
              0.8
            ],
            [
              12,
              0.8
            ]
          ]
        }
      }
    },
    {
      "id": "OS/Railways/Tunnel",
      "type": "line",
      "source": "esri",
      "source-layer": "Railways",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 5,
      "maxzoom": 12,
      "layout": {},
      "paint": {
        "line-color": "#a7a39c",
        "line-dasharray": [
          4,
          2
        ],
        "line-width": {
          "stops": [
            [
              6,
              1
            ],
            [
              7,
              1
            ],
            [
              8,
              1
            ],
            [
              9,
              1
            ],
            [
              10,
              1
            ],
            [
              11,
              1.6
            ],
            [
              12,
              1.6
            ]
          ]
        }
      }
    },
    {
      "id": "OS/ETL",
      "type": "line",
      "source": "esri",
      "source-layer": "ETL",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "line-join": "round"
      },
      "paint": {
        "line-color": "#5B2F2F",
        "line-dasharray": [
          6,
          3
        ],
        "line-width": {
          "stops": [
            [
              9,
              1.3
            ],
            [
              10,
              1.3
            ],
            [
              11,
              2.2
            ],
            [
              12,
              1.8
            ]
          ]
        },
        "line-opacity": 0.3
      }
    },
    {
      "id": "OS/Railway_stations/Light Rapid Transit Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Light Rapid Transit Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.5
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Light Rapid Transit Station And London Underground Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Light Rapid Transit Station And London Underground Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.5
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Light Rapid Transit Station And London Underground Station_1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Railway_stations/Light Rapid Transit Station And London Underground Station_1",
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Light Rapid Transit Station And Railway Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Light Rapid Transit Station And Railway Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.7
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/London Underground Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/London Underground Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.6
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Railway Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 7,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Railway Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.6
            ],
            [
              9,
              0.7
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              0.9
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Railway Station And London Underground Station",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Railway_stations/Railway Station And London Underground Station",
        "icon-size": {
          "stops": [
            [
              8,
              0.6
            ],
            [
              9,
              0.8
            ],
            [
              10,
              0.8
            ],
            [
              11,
              0.9
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Railway_stations/Railway Station And London Underground Station_1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Railway_stations/Railway Station And London Underground Station_1",
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/Airports",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Airports",
      "minzoom": 4,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Airports",
        "icon-size": {
          "stops": [
            [
              5,
              0.85
            ],
            [
              6,
              0.85
            ],
            [
              7,
              0.85
            ],
            [
              8,
              0.85
            ],
            [
              9,
              1
            ],
            [
              10,
              1
            ],
            [
              11,
              1
            ],
            [
              12,
              1
            ]
          ]
        },
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-color": "#6A6F73",
        "icon-opacity": 0.5
      }
    },
    {
      "id": "OS/TopographicPoint/Spot Height",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 12,
      "layout": {
        "icon-image": "OS/TopographicPoint/Spot Height",
        "icon-size": {
          "stops": [
            [
              13,
              0.6
            ],
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Site Of Heritage",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        1
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Site Of Heritage",
        "icon-size": {
          "stops": [
            [
              14,
              1.2
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Positioned Nonconiferous Tree",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Positioned Nonconiferous Tree",
        "icon-size": {
          "stops": [
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#89A489"
      }
    },
    {
      "id": "OS/TopographicPoint/Inland Water",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Inland Water",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6C8499"
      }
    },
    {
      "id": "OS/TopographicPoint/Roadside",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        4
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Roadside",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Overhead Construction",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        5
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Overhead Construction",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Rail",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        6
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Rail",
        "icon-size": {
          "stops": [
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Positioned Coniferous Tree",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        7
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Positioned Coniferous Tree",
        "icon-size": {
          "stops": [
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#89A489"
      }
    },
    {
      "id": "OS/TopographicPoint/Triangulation Point Or Pillar",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        8
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Triangulation Point Or Pillar",
        "icon-size": {
          "stops": [
            [
              14,
              1.25
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Historic Interest",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        9
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Historic Interest",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Landform",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        10
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Landform",
        "icon-size": {
          "stops": [
            [
              14,
              1
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/TopographicPoint/Tidal Water",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        11
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Tidal Water",
        "icon-size": {
          "stops": [
            [
              14,
              1.4
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6C8499"
      }
    },
    {
      "id": "OS/TopographicPoint/Structure",
      "type": "symbol",
      "source": "esri",
      "source-layer": "TopographicPoint",
      "filter": [
        "==",
        "_symbol",
        12
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/TopographicPoint/Structure",
        "icon-size": {
          "stops": [
            [
              14,
              1.4
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicSymbol/Culvert Symbol",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicSymbol",
      "filter": [
        "==",
        "_symbol",
        0
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/CartographicSymbol/Culvert Symbol",
        "icon-size": {
          "stops": [
            [
              14,
              1.6
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-rotate": [
          "get",
          "angle"
        ],
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicSymbol/Bench Mark Symbol",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicSymbol",
      "filter": [
        "==",
        "_symbol",
        2
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/CartographicSymbol/Bench Mark Symbol",
        "icon-size": {
          "stops": [
            [
              14,
              1.3
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-rotate": [
          "get",
          "angle"
        ],
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicSymbol/Road Related Flow Symbol",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicSymbol",
      "filter": [
        "==",
        "_symbol",
        3
      ],
      "minzoom": 13,
      "layout": {
        "icon-image": "OS/CartographicSymbol/Road Related Flow Symbol",
        "icon-size": {
          "stops": [
            [
              14,
              1.2
            ],
            [
              15,
              2
            ]
          ]
        },
        "icon-rotate": [
          "get",
          "angle"
        ],
        "icon-allow-overlap": true,
        "icon-rotation-alignment": "map"
      },
      "paint": {
        "icon-color": "#6A6F73"
      }
    },
    {
      "id": "OS/Names/National/Capital:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:1",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/Capital:1",
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-color": "rgba(85,89,92,0)"
      }
    },
    {
      "id": "OS/Names/National/Country",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Country",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/Country",
        "icon-allow-overlap": true
      },
      "paint": {
        "icon-color": "rgba(85,89,92,0)"
      }
    },
    {
      "id": "OS/CartographicText/label/Small Buildings - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class79",
        79
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Light"
        ],
        "text-size": 12.4,
        "text-anchor": "center",
        "text-offset": [
          0.107527,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle79"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name79}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class64",
        64
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-letter-spacing": 0.05,
        "text-field": "{_name64}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - NE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class74",
        74
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle74"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name74}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class97",
        97
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle97"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name97}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - NE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class87",
        87
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle87"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name87}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class72",
        72
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-rotate": [
          "get",
          "_label_angle72"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name72}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - North (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class73",
        73
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle73"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name73}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class61",
        61
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-letter-spacing": 0.05,
        "text-field": "{_name61}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class99",
        99
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle99"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name99}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class96",
        96
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle96"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name96}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class95",
        95
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "center",
        "text-rotate": [
          "get",
          "_label_angle95"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name95}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - South (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class89",
        89
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle89"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name89}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - North (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class86",
        86
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle86"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name86}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class85",
        85
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-rotate": [
          "get",
          "_label_angle85"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name85}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - South (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class76",
        76
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle76"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name76}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class66",
        66
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-letter-spacing": 0.05,
        "text-field": "{_name66}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class53",
        53
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "center",
        "text-offset": [
          0.0952381,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle53"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name53}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class54",
        54
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle54"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name54}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class100",
        100
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle100"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name100}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - SW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class90",
        90
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle90"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name90}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - SW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class77",
        77
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle77"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name77}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class67",
        67
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-letter-spacing": 0.05,
        "text-field": "{_name67}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class55",
        55
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle55"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name55}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - NW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class78",
        78
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle78"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name78}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class68",
        68
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-letter-spacing": 0.05,
        "text-field": "{_name68}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class56",
        56
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle56"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name56}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class101",
        101
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle101"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name101}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - NW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class91",
        91
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle91"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name91}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class69",
        69
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle69"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name69}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class57",
        57
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle57"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name57}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class92",
        92
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "center",
        "text-offset": [
          0.117647,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle92"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name92}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class82",
        82
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle82"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name82}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class60",
        60
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-letter-spacing": 0.05,
        "text-field": "{_name60}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class58",
        58
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle58"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name58}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - SE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class75",
        75
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle75"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name75}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class98",
        98
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle98"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name98}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - SE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class88",
        88
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle88"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name88}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class59",
        59
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle59"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name59}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class65",
        65
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-letter-spacing": 0.05,
        "text-field": "{_name65}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class52",
        52
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle52"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name52}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class50",
        50
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle50"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name50}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class40",
        40
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle40"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name40}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class43",
        43
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle43"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name43}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - North (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class44",
        44
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle44"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name44}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - NE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class45",
        45
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle45"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name45}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - SE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class46",
        46
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle46"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name46}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - South (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class47",
        47
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle47"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name47}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - SW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class48",
        48
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle48"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name48}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - NW(1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class49",
        49
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle49"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name49}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class51",
        51
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle51"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name51}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class42",
        42
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle42"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name42}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Small Buildings - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class80",
        80
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Light"
        ],
        "text-size": 12.4,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle80"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name80}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class94",
        94
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle94"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name94}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class84",
        84
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle84"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name84}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class93",
        93
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle93"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name93}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Roads - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class83",
        83
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle83"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name83}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class71",
        71
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle71"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name71}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class63",
        63
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-letter-spacing": 0.05,
        "text-field": "{_name63}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Height - East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class62",
        62
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-letter-spacing": 0.05,
        "text-field": "{_name62}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Water - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class41",
        41
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle41"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name41}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6C8499"
      }
    },
    {
      "id": "OS/CartographicText/label/Buildings - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class70",
        70
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle70"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name70}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Small Buildings - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class81",
        81
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Light"
        ],
        "text-size": 12.4,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle81"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name81}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class32",
        32
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle32"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name32}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class39",
        39
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle39"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name39}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class38",
        38
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle38"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name38}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class37",
        37
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle37"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name37}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class36",
        36
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle36"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name36}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class35",
        35
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle35"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name35}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class34",
        34
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle34"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name34}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class33",
        33
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "center",
        "text-offset": [
          0.0930233,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle33"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name33}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class30",
        30
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "center",
        "text-offset": [
          0.0930233,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle30"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name30}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Historic - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class31",
        31
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Times New Roman Italic"
        ],
        "text-size": 14,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle31"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name31}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class20",
        20
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle20"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name20}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class21",
        21
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle21"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name21}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class22",
        22
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle22"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name22}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class23",
        23
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle23"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name23}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class24",
        24
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle24"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name24}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class25",
        25
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle25"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name25}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class26",
        26
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle26"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name26}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class27",
        27
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle27"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name27}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class28",
        28
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle28"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name28}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/Natural - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class29",
        29
      ],
      "minzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle29"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name29}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate West (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class12",
        12
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle12"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name12}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate West (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class2",
        2
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "right",
        "text-rotate": [
          "get",
          "_label_angle2"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name2}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate East (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class11",
        11
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle11"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name11}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate East (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "left",
        "text-rotate": [
          "get",
          "_label_angle1"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name1}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class10",
        10
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "center",
        "text-offset": [
          0.117647,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle10"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name10}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Rotate Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - South (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class17",
        17
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle17"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name17}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - South (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class7",
        7
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-rotate": [
          "get",
          "_label_angle7"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name7}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - NW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class19",
        19
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle19"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name19}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - NW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class9",
        9
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-right",
        "text-rotate": [
          "get",
          "_label_angle9"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name9}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - SW (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class18",
        18
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle18"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name18}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - SW (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class8",
        8
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-right",
        "text-rotate": [
          "get",
          "_label_angle8"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name8}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - SE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class16",
        16
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle16"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name16}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - SE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class6",
        6
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top-left",
        "text-rotate": [
          "get",
          "_label_angle6"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name6}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - NE (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class15",
        15
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 10.5,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle15"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name15}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - NE (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class5",
        5
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-rotate": [
          "get",
          "_label_angle5"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name5}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - North (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class14",
        14
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle14"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name14}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - North (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class4",
        4
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "bottom",
        "text-rotate": [
          "get",
          "_label_angle4"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name4}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Central (1:1400)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class13",
        13
      ],
      "minzoom": 12,
      "maxzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-anchor": "center",
        "text-offset": [
          0.117647,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle13"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name13}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/CartographicText/label/General - Central (1:700)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "CartographicText",
      "filter": [
        "==",
        "_label_class3",
        3
      ],
      "minzoom": 13,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-offset": [
          0.103093,
          0
        ],
        "text-rotate": [
          "get",
          "_label_angle3"
        ],
        "text-letter-spacing": 0.05,
        "text-field": "{_name3}",
        "text-allow-overlap": true,
        "text-optional": true,
        "text-rotation-alignment": "map"
      },
      "paint": {
        "text-color": "#6A6F73"
      }
    },
    {
      "id": "OS/Roads/label/Local Road 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        14
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Local Road 22400-44800",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        15
      ],
      "minzoom": 8,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Minor Road 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        12
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Minor Road 22400-89600",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        13
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Greenspace:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Greenspace:1",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Greenspace:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(0,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Sites",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Sites",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Sites",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Landform:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landform:1",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Landform:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Landform:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landform:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Landform:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Landcover:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landcover:3",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Landcover:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Landcover:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landcover:2",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Landcover:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Water:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Water:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Water:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6C8499",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Water:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Water:1",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Water:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6C8499",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Woodland:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Woodland:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Woodland:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Woodland:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Woodland:1",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Woodland:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/A & B Road 2800-11200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        7
      ],
      "minzoom": 10,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 2
      }
    },
    {
      "id": "OS/Roads/label/A & B Road 11200-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        8
      ],
      "minzoom": 9,
      "maxzoom": 10,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Regular"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 2
      }
    },
    {
      "id": "OS/Roads/label/A & B Road 22400-358400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        9
      ],
      "minzoom": 5,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Regular"
        ],
        "text-size": 11,
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.6
      }
    },
    {
      "id": "OS/Roads/label/A & B Road Name 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        10
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/A & B Road Name 22400-89600",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        11
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 11,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "rgba(255,255,255,0.99)",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Railway_stations/label/Station names 22400-89600",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "top",
        "text-offset": {
          "property": "_symbol",
          "type": "categorical",
          "default": [
            0,
            0.0333333
          ],
          "stops": [
            [
              0,
              [
                0,
                0.631292
              ]
            ],
            [
              1,
              [
                0,
                0.359493
              ]
            ],
            [
              2,
              [
                0,
                0.609832
              ]
            ],
            [
              3,
              [
                0,
                0.629975
              ]
            ],
            [
              4,
              [
                0,
                0.625794
              ]
            ],
            [
              5,
              [
                0,
                0.410354
              ]
            ]
          ]
        },
        "text-letter-spacing": 0.05,
        "text-field": "{_name1}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FAFAF3",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Railway_stations/label/Station names 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Railway_stations",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "top",
        "text-offset": {
          "property": "_symbol",
          "type": "categorical",
          "default": [
            0,
            0.1
          ],
          "stops": [
            [
              0,
              [
                0,
                0.638163
              ]
            ],
            [
              1,
              [
                0,
                0.393543
              ]
            ],
            [
              2,
              [
                0,
                0.618849
              ]
            ],
            [
              3,
              [
                0,
                0.636977
              ]
            ],
            [
              4,
              [
                0,
                0.633215
              ]
            ],
            [
              5,
              [
                0,
                0.439319
              ]
            ]
          ]
        },
        "text-letter-spacing": 0.05,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FAFAF3",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Small Settlement",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Small Settlement",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Small Settlement",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Regional/Landcover:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Landcover:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Landcover:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 0.75
      }
    },
    {
      "id": "OS/Names/Local/Hamlet (Local)",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Hamlet (Local)",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Hamlet (Local)",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 17,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Hamlet:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Hamlet:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Hamlet:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Regional/Hamlet:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Hamlet:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Hamlet:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Suburban Area:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Suburban Area:3",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Suburban Area:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 15,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Regional/Suburban Area:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Suburban Area:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Suburban Area:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/Suburban Area:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Suburban Area:2",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Suburban Area:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Primary 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        3
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Primary 22400-179200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        4
      ],
      "minzoom": 6,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 12,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Primary 179200-716800",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        5
      ],
      "minzoom": 4,
      "maxzoom": 6,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 11,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Primary Name 2800-44800",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        6
      ],
      "minzoom": 8,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Village:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Village:2",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Village:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 16.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.8
      }
    },
    {
      "id": "OS/Names/District/Village:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Village:3",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Village:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.8
      }
    },
    {
      "id": "OS/Names/Regional/Village:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Village:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Village:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.1
      }
    },
    {
      "id": "OS/Roads/label/Motorway 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 13,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Motorway 22400-179200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        1
      ],
      "minzoom": 6,
      "maxzoom": 9,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 12,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Roads/label/Motorway 179200-2867200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Roads/label",
      "filter": [
        "==",
        "_label_class",
        2
      ],
      "minzoom": 2,
      "maxzoom": 6,
      "layout": {
        "symbol-placement": "line",
        "symbol-spacing": 1000,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 11,
        "text-letter-spacing": 0.1,
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#FFFFFF",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Airports/label/Airport names 22400-179200",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Airports",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "minzoom": 6,
      "maxzoom": 9,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12.5,
        "text-anchor": "top",
        "text-offset": [
          0,
          0.582306
        ],
        "text-field": "{_name1}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#F4F4EE",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Airports/label/Airport names 2800-22400",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Airports",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14,
        "text-anchor": "top",
        "text-offset": [
          0,
          0.688753
        ],
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/District/National Park:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "National Park:3",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/National Park:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 2
      }
    },
    {
      "id": "OS/Names/Local/Motorway Junctions",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Motorway Junctions",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Motorway Junctions",
        "icon-allow-overlap": true,
        "text-font": [
          "Arial Bold"
        ],
        "text-size": 14,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(168,0,0,0)",
        "text-color": "#FFFFFF",
        "text-halo-color": "#9C9C9C",
        "text-halo-width": 3
      }
    },
    {
      "id": "OS/Names/Local/Town:4",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Town:4",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Town:4",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 19,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 2.2
      }
    },
    {
      "id": "OS/Names/District/Town:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Town:1",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Town:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 16.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.7
      }
    },
    {
      "id": "OS/Names/Regional/Town:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Town:2",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Town:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 13,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/Town:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Town:3",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/Town:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#6A6F73",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Regional/National Park:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "National Park:2",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/National Park:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 14.5,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-allow-overlap": true,
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/National Park:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "National Park:1",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/National Park:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 12,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#89A489",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/City:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "City:3",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/City:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 21,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 3
      }
    },
    {
      "id": "OS/Names/District/City:4",
      "type": "symbol",
      "source": "esri",
      "source-layer": "City:4",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/City:4",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 17,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 2.2
      }
    },
    {
      "id": "OS/Names/Regional/City:1",
      "type": "symbol",
      "source": "esri",
      "source-layer": "City:1",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/City:1",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 17,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-allow-overlap": true,
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/City:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "City:2",
      "maxzoom": 5,
      "layout": {
        "icon-image": "OS/Names/National/City:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 16,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/Local/Capital:3",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:3",
      "minzoom": 9,
      "maxzoom": 12,
      "layout": {
        "icon-image": "OS/Names/Local/Capital:3",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 24,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 3
      }
    },
    {
      "id": "OS/Names/District/Capital:4",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:4",
      "minzoom": 7,
      "maxzoom": 9,
      "layout": {
        "icon-image": "OS/Names/District/Capital:4",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Regular"
        ],
        "text-size": 20,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 3
      }
    },
    {
      "id": "OS/Names/Regional/Capital:2",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:2",
      "minzoom": 5,
      "maxzoom": 7,
      "layout": {
        "icon-image": "OS/Names/Regional/Capital:2",
        "icon-allow-overlap": true,
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 18,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "icon-color": "rgba(255,0,0,0)",
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/Capital:1/label/Capital National",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:1",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 1,
      "maxzoom": 5,
      "layout": {
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 16,
        "text-anchor": "center",
        "text-field": "{_name}",
        "text-optional": true
      },
      "paint": {
        "text-color": "#55595C",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/Country/label/Country National",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Country",
      "filter": [
        "==",
        "_label_class",
        0
      ],
      "minzoom": 1,
      "maxzoom": 5,
      "layout": {
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 21,
        "text-anchor": "center",
        "text-letter-spacing": 0.75,
        "text-field": "{_name}",
        "text-allow-overlap": true,
        "text-optional": true
      },
      "paint": {
        "text-color": "rgba(85,89,92,0.5)",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    },
    {
      "id": "OS/Names/National/Capital:1/label/Capital National 1:5.7m+",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Capital:1",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "maxzoom": 1,
      "layout": {
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 13,
        "text-anchor": "bottom-left",
        "text-offset": [
          0.270711,
          0.0292893
        ],
        "text-field": "{_name1}",
        "text-optional": true
      },
      "paint": {
        "text-color": "rgba(85,89,92,0.75)"
      }
    },
    {
      "id": "OS/Names/National/Country/label/Country National 1:5.7m+",
      "type": "symbol",
      "source": "esri",
      "source-layer": "Country",
      "filter": [
        "==",
        "_label_class1",
        1
      ],
      "maxzoom": 1,
      "layout": {
        "text-font": [
          "Source Sans Pro Semibold"
        ],
        "text-size": 16,
        "text-anchor": "center",
        "text-letter-spacing": 0.5,
        "text-field": "{_name1}",
        "text-optional": true
      },
      "paint": {
        "text-color": "rgba(85,89,92,0.5)",
        "text-halo-color": "#F1EFEC",
        "text-halo-width": 1.5
      }
    }
  ]
};


var testStyle = {

    "version": 8,
    "name": "Basic",
    "metadata": {
      "mapbox:type": "default",
      "mapbox:origin": "basic-v1",
      "mapbox:sdk-support": {
        "android": "9.3.0",
        "ios": "5.10.0",
        "js": "1.10.0"
      },
      "mapbox:autocomposite": true,
      "mapbox:groups": {
        "Transit, transit-labels": {
          "name": "Transit, transit-labels",
          "collapsed": false
        },
        "Administrative boundaries, admin": {
          "name": "Administrative boundaries, admin",
          "collapsed": false
        },
        "Land & water, built": {
          "name": "Land & water, built",
          "collapsed": false
        },
        "Land & water, land": {
          "name": "Land & water, land",
          "collapsed": false
        },
        "Road network, bridges": {
          "name": "Road network, bridges",
          "collapsed": false
        },
        "Road network, tunnels": {
          "name": "Road network, tunnels",
          "collapsed": false
        },
        "Road network, road-labels": {
          "name": "Road network, road-labels",
          "collapsed": false
        },
        "Buildings, built": {
          "name": "Buildings, built",
          "collapsed": false
        },
        "Natural features, natural-labels": {
          "name": "Natural features, natural-labels",
          "collapsed": false
        },
        "Road network, surface": {
          "name": "Road network, surface",
          "collapsed": false
        },
        "Walking, cycling, etc., barriers-bridges": {
          "name": "Walking, cycling, etc., barriers-bridges",
          "collapsed": false
        },
        "Place labels, place-labels": {
          "name": "Place labels, place-labels",
          "collapsed": false
        },
        "Point of interest labels, poi-labels": {
          "name": "Point of interest labels, poi-labels",
          "collapsed": false
        },
        "Walking, cycling, etc., tunnels": {
          "name": "Walking, cycling, etc., tunnels",
          "collapsed": false
        },
        "Walking, cycling, etc., walking-cycling-labels": {
          "name": "Walking, cycling, etc., walking-cycling-labels",
          "collapsed": false
        },
        "Walking, cycling, etc., surface": {
          "name": "Walking, cycling, etc., surface",
          "collapsed": false
        },
        "Transit, built": {"name": "Transit, built", "collapsed": false},
        "Land & water, water": {
          "name": "Land & water, water",
          "collapsed": false
        }
      },
      "mapbox:decompiler": {
        "id": "ckeei6cyk0xj619lzz5tsvx03",
        "componentVersion": "5.0.1",
        "strata": [
          {
            "id": "basic-v1",
            "order": [
              ["land-and-water", "land"],
              ["land-and-water", "water"],
              ["land-and-water", "built"],
              ["transit", "built"],
              ["buildings", "built"],
              ["road-network", "tunnels-case"],
              ["walking-cycling", "tunnels"],
              ["road-network", "tunnels"],
              ["transit", "ferries"],
              ["walking-cycling", "surface"],
              ["road-network", "surface"],
              ["transit", "surface"],
              ["road-network", "surface-icons"],
              ["walking-cycling", "barriers-bridges"],
              ["road-network", "bridges"],
              ["transit", "bridges"],
              ["road-network", "traffic-and-closures"],
              ["buildings", "extruded"],
              ["transit", "elevated"],
              ["admin-boundaries", "admin"],
              ["buildings", "building-labels"],
              ["road-network", "road-labels"],
              ["walking-cycling", "walking-cycling-labels"],
              ["transit", "ferry-aerialway-labels"],
              ["natural-features", "natural-labels"],
              ["point-of-interest-labels", "poi-labels"],
              ["transit", "transit-labels"],
              ["place-labels", "place-labels"]
            ]
          }
        ],
        "components": {
          "road-network": "5.0.1",
          "natural-features": "5.0.1",
          "place-labels": "5.0.1",
          "admin-boundaries": "5.0.1",
          "point-of-interest-labels": "5.0.1",
          "walking-cycling": "5.0.1",
          "transit": "5.0.1",
          "land-and-water": "5.0.1",
          "buildings": "5.0.1"
        },
        "propConfig": {
          "road-network": {
            "color-base": "hsl(40, 41%, 88%)",
            "color-road": "hsl(38, 55%, 100%)",
            "roadNetwork": "Simple"
          },
          "natural-features": {
            "color-base": "hsl(40, 41%, 88%)",
            "color-water": "hsl(205, 76%, 70%)",
            "color-poi": "hsl(26, 20%, 38%)"
          },
          "place-labels": {
            "color-base": "hsl(40, 41%, 88%)",
            "color-place-label": "hsl(0, 0%, 15%)",
            "settlementSubdivisionsDensity": 3,
            "settlementLabelStyle": "Text only"
          },
          "admin-boundaries": {
            "color-base": "hsl(40, 41%, 88%)",
            "color-place-label": "hsl(0, 0%, 15%)"
          },
          "point-of-interest-labels": {
            "color-poi": "hsl(26, 20%, 38%)",
            "color-hospital": "hsl(3, 45%, 55%)",
            "artsAndEntertainmentDensity": 4,
            "density": 2,
            "foodAndDrinkDensity": 1,
            "historicDensity": 1,
            "color-greenspace": "hsl(78, 50%, 73%)",
            "color-greenspace-label": "hsl(76, 50%, 16%)",
            "buildingDensity": 0,
            "controlDensityByClass": true,
            "color-base": "hsl(40, 41%, 88%)",
            "color-school": "hsl(40, 45%, 45%)"
          },
          "walking-cycling": {
            "color-base": "hsl(40, 41%, 88%)",
            "color-road": "hsl(38, 55%, 100%)",
            "color-greenspace": "hsl(78, 50%, 73%)",
            "color-greenspace-label": "hsl(76, 50%, 16%)",
            "walkingCyclingPisteBackground": false,
            "golfHoleLabelLine": false,
            "pedestrianPolygonFeatures": false
          },
          "transit": {
            "color-airport": "hsl(225, 4%, 40%)",
            "color-transit": "hsl(345, 6%, 40%)",
            "aerialways": false,
            "color-road": "hsl(38, 55%, 100%)",
            "color-water": "hsl(205, 76%, 70%)",
            "transitLabels": false,
            "railways": false,
            "ferries": false,
            "color-base": "hsl(40, 41%, 88%)"
          },
          "land-and-water": {
            "color-airport": "hsl(225, 4%, 40%)",
            "color-hospital": "hsl(3, 45%, 55%)",
            "landcover": false,
            "color-greenspace": "hsl(78, 50%, 73%)",
            "color-water": "hsl(205, 76%, 70%)",
            "transitionLandOnZoom": false,
            "waterStyle": "Simple",
            "color-base": "hsl(40, 41%, 88%)",
            "color-school": "hsl(40, 45%, 45%)"
          },
          "buildings": {
            "color-base": "hsl(40, 41%, 88%)",
            "houseNumbers": false,
            "underground": false
          }
        }
      },
      "mapbox:uiParadigm": "components"
    },
    "center": [2.2265697486850513, 48.86986024231666],
    "zoom": 18.508309867039173,
    "bearing": 0,
    "pitch": 0,
    "sources": {
      "composite": {
        "url": "mapbox://mapbox.mapbox-streets-v8",
        "type": "vector"
      }
    },
    "sprite": "mapbox://sprites/gibble/ckeei6cyk0xj619lzz5tsvx03/eut4m6dn8gxxcpb051pwvqwe1",
    "glyphs": "mapbox://fonts/gibble/{fontstack}/{range}.pbf",
    "layers": [
      {
        "id": "land",
        "type": "background",
        "metadata": {
          "mapbox:featureComponent": "land-and-water",
          "mapbox:group": "Land & water, land"
        },
        "layout": {},
        "paint": {"background-color": "hsl(40, 39%, 80%)"}
      },
      {
        "id": "national-park",
        "type": "fill",
        "metadata": {
          "mapbox:featureComponent": "land-and-water",
          "mapbox:group": "Land & water, land"
        },
        "source": "composite",
        "source-layer": "landuse_overlay",
        "minzoom": 5,
        "filter": ["==", ["get", "class"], "national_park"],
        "layout": {},
        "paint": {
          "fill-color": "hsl(78, 50%, 73%)",
          "fill-opacity": [
            "interpolate",
            ["linear"],
            ["zoom"],
            5,
            0,
            6,
            0.5,
            10,
            0.5
          ]
        }
      },
      {
        "id": "landuse",
        "type": "fill",
        "metadata": {
          "mapbox:featureComponent": "land-and-water",
          "mapbox:group": "Land & water, land"
        },
        "source": "composite",
        "source-layer": "landuse",
        "minzoom": 5,
        "filter": [
          "match",
          ["get", "class"],
          ["park", "airport", "glacier", "pitch", "sand", "facility"],
          true,
          "cemetery",
          true,
          "school",
          true,
          "hospital",
          true,
          false
        ],
        "layout": {},
        "paint": {
          "fill-color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            15,
            [
              "match",
              ["get", "class"],
              "park",
              "hsl(78, 50%, 73%)",
              "airport",
              "hsl(225, 42%, 82%)",
              "cemetery",
              "hsl(60, 44%, 79%)",
              "glacier",
              "hsl(205, 66%, 90%)",
              "hospital",
              "hsl(3, 42%, 78%)",
              "pitch",
              "hsl(78, 51%, 68%)",
              "sand",
              "hsl(43, 48%, 76%)",
              "school",
              "hsl(40, 43%, 72%)",
              "hsl(40, 42%, 76%)"
            ],
            16,
            [
              "match",
              ["get", "class"],
              "park",
              "hsl(78, 50%, 73%)",
              "airport",
              "hsl(225, 56%, 80%)",
              "cemetery",
              "hsl(60, 44%, 79%)",
              "glacier",
              "hsl(205, 66%, 90%)",
              "hospital",
              "hsl(3, 44%, 80%)",
              "pitch",
              "hsl(78, 51%, 68%)",
              "sand",
              "hsl(43, 48%, 76%)",
              "school",
              "hsl(40, 43%, 72%)",
              "hsl(40, 42%, 76%)"
            ]
          ],
          "fill-opacity": [
            "interpolate",
            ["linear"],
            ["zoom"],
            5,
            0,
            6,
            ["match", ["get", "class"], "glacier", 0.5, 1]
          ]
        }
      },
      {
        "id": "pitch-outline",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "land-and-water",
          "mapbox:group": "Land & water, land"
        },
        "source": "composite",
        "source-layer": "landuse",
        "minzoom": 15,
        "filter": ["==", ["get", "class"], "pitch"],
        "layout": {},
        "paint": {"line-color": "hsl(60, 29%, 74%)"}
      },
      {
        "id": "waterway",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "land-and-water",
          "mapbox:group": "Land & water, water"
        },
        "source": "composite",
        "source-layer": "waterway",
        "minzoom": 8,
        "layout": {
          "line-cap": ["step", ["zoom"], "butt", 11, "round"],
          "line-join": "round"
        },
        "paint": {
          "line-color": "hsl(205, 76%, 70%)",
          "line-width": [
            "interpolate",
            ["exponential", 1.3],
            ["zoom"],
            9,
            ["match", ["get", "class"], ["canal", "river"], 0.1, 0],
            20,
            ["match", ["get", "class"], ["canal", "river"], 8, 3]
          ],
          "line-opacity": [
            "interpolate",
            ["linear"],
            ["zoom"],
            8,
            0,
            8.5,
            1
          ]
        }
      },
      {
        "id": "water",
        "type": "fill",
        "metadata": {
          "mapbox:featureComponent": "land-and-water",
          "mapbox:group": "Land & water, water"
        },
        "source": "composite",
        "source-layer": "water",
        "layout": {},
        "paint": {"fill-color": "hsl(205, 76%, 70%)"}
      },
      {
        "id": "land-structure-polygon",
        "type": "fill",
        "metadata": {
          "mapbox:featureComponent": "land-and-water",
          "mapbox:group": "Land & water, built"
        },
        "source": "composite",
        "source-layer": "structure",
        "minzoom": 13,
        "filter": [
          "all",
          ["==", ["geometry-type"], "Polygon"],
          ["==", ["get", "class"], "land"]
        ],
        "layout": {},
        "paint": {"fill-color": "hsl(40, 39%, 80%)"}
      },
      {
        "id": "land-structure-line",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "land-and-water",
          "mapbox:group": "Land & water, built"
        },
        "source": "composite",
        "source-layer": "structure",
        "minzoom": 13,
        "filter": [
          "all",
          ["==", ["geometry-type"], "LineString"],
          ["==", ["get", "class"], "land"]
        ],
        "layout": {"line-cap": "round"},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.99],
            ["zoom"],
            14,
            0.75,
            20,
            40
          ],
          "line-color": "hsl(40, 39%, 80%)"
        }
      },
      {
        "id": "aeroway-polygon",
        "type": "fill",
        "metadata": {
          "mapbox:featureComponent": "transit",
          "mapbox:group": "Transit, built"
        },
        "source": "composite",
        "source-layer": "aeroway",
        "minzoom": 11,
        "filter": [
          "all",
          ["==", ["geometry-type"], "Polygon"],
          [
            "match",
            ["get", "type"],
            ["runway", "taxiway", "helipad"],
            true,
            false
          ]
        ],
        "layout": {},
        "paint": {
          "fill-color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            15,
            "hsl(225, 32%, 73%)",
            16,
            "hsl(225, 16%, 75%)"
          ],
          "fill-opacity": [
            "interpolate",
            ["linear"],
            ["zoom"],
            11,
            0,
            11.5,
            1
          ]
        }
      },
      {
        "id": "aeroway-line",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "transit",
          "mapbox:group": "Transit, built"
        },
        "source": "composite",
        "source-layer": "aeroway",
        "minzoom": 9,
        "filter": ["==", ["geometry-type"], "LineString"],
        "layout": {},
        "paint": {
          "line-color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            15,
            "hsl(225, 32%, 73%)",
            16,
            "hsl(225, 16%, 75%)"
          ],
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            9,
            ["match", ["get", "type"], "runway", 1, 0.5],
            18,
            ["match", ["get", "type"], "runway", 80, 20]
          ]
        }
      },
      {
        "id": "building-outline",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "buildings",
          "mapbox:group": "Buildings, built"
        },
        "source": "composite",
        "source-layer": "building",
        "minzoom": 15,
        "filter": [
          "all",
          ["!=", ["get", "type"], "building:part"],
          ["==", ["get", "underground"], "false"]
        ],
        "layout": {},
        "paint": {
          "line-color": "hsl(40, 35%, 71%)",
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            15,
            0.75,
            20,
            3
          ],
          "line-opacity": [
            "interpolate",
            ["linear"],
            ["zoom"],
            15,
            0,
            16,
            1
          ]
        }
      },
      {
        "id": "building",
        "type": "fill",
        "metadata": {
          "mapbox:featureComponent": "buildings",
          "mapbox:group": "Buildings, built"
        },
        "source": "composite",
        "source-layer": "building",
        "minzoom": 15,
        "filter": [
          "all",
          ["!=", ["get", "type"], "building:part"],
          ["==", ["get", "underground"], "false"]
        ],
        "layout": {},
        "paint": {
          "fill-color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            15,
            "hsl(40, 38%, 77%)",
            16,
            "hsl(40, 34%, 76%)"
          ],
          "fill-opacity": [
            "interpolate",
            ["linear"],
            ["zoom"],
            15,
            0,
            16,
            1
          ],
          "fill-outline-color": "hsl(40, 35%, 71%)"
        }
      },
      {
        "id": "tunnel-path",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., tunnels"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 14,
        "filter": [
          "all",
          ["==", ["get", "structure"], "tunnel"],
          ["==", ["get", "class"], "path"],
          ["!=", ["get", "type"], "steps"],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            15,
            1,
            18,
            4
          ],
          "line-color": "hsl(40, 35%, 71%)",
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [1, 0]],
            15,
            ["literal", [1.75, 1]],
            16,
            ["literal", [1, 0.75]],
            17,
            ["literal", [1, 0.5]]
          ]
        }
      },
      {
        "id": "tunnel-steps",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., tunnels"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 14,
        "filter": [
          "all",
          ["==", ["get", "structure"], "tunnel"],
          ["==", ["get", "type"], "steps"],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            15,
            1,
            16,
            1.6,
            18,
            6
          ],
          "line-color": "hsl(40, 35%, 71%)",
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [1, 0]],
            15,
            ["literal", [1.75, 1]],
            16,
            ["literal", [1, 0.75]],
            17,
            ["literal", [0.3, 0.3]]
          ]
        }
      },
      {
        "id": "tunnel-pedestrian",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., tunnels"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 13,
        "filter": [
          "all",
          ["==", ["get", "structure"], "tunnel"],
          ["==", ["get", "class"], "pedestrian"],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            14,
            0.5,
            18,
            12
          ],
          "line-color": "hsl(40, 35%, 71%)",
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [1, 0]],
            15,
            ["literal", [1.5, 0.4]],
            16,
            ["literal", [1, 0.2]]
          ]
        }
      },
      {
        "id": "tunnel-simple",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "road-network",
          "mapbox:group": "Road network, tunnels"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 13,
        "filter": [
          "all",
          ["==", ["get", "structure"], "tunnel"],
          [
            "step",
            ["zoom"],
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "secondary",
                "tertiary",
                "street",
                "street_limited",
                "primary_link",
                "track"
              ],
              true,
              false
            ],
            14,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "primary_link",
                "secondary",
                "secondary_link",
                "tertiary",
                "tertiary_link",
                "street",
                "street_limited",
                "service",
                "track"
              ],
              true,
              false
            ]
          ],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            13,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              4,
              ["secondary", "tertiary"],
              2.5,
              [
                "motorway_link",
                "trunk_link",
                "street",
                "street_limited",
                "primary_link"
              ],
              1,
              0.5
            ],
            18,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              32,
              ["secondary", "tertiary"],
              26,
              [
                "motorway_link",
                "trunk_link",
                "street",
                "street_limited",
                "primary_link"
              ],
              18,
              12
            ]
          ],
          "line-color": "hsl(38, 55%, 93%)"
        }
      },
      {
        "id": "road-path",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., surface"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 12,
        "filter": [
          "all",
          ["==", ["get", "class"], "path"],
          [
            "step",
            ["zoom"],
            [
              "!",
              [
                "match",
                ["get", "type"],
                ["steps", "sidewalk", "crossing"],
                true,
                false
              ]
            ],
            16,
            ["!=", ["get", "type"], "steps"]
          ],
          ["match", ["get", "structure"], ["none", "ford"], true, false],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {"line-join": ["step", ["zoom"], "miter", 14, "round"]},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            13,
            0.5,
            14,
            1,
            15,
            1,
            18,
            4
          ],
          "line-color": "hsl(40, 40%, 89%)",
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [4, 0.3]],
            15,
            ["literal", [1.75, 0.3]],
            16,
            ["literal", [1, 0.3]],
            17,
            ["literal", [1, 0.25]]
          ]
        }
      },
      {
        "id": "road-steps",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., surface"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 14,
        "filter": [
          "all",
          ["==", ["get", "type"], "steps"],
          ["match", ["get", "structure"], ["none", "ford"], true, false],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {"line-join": "round"},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            15,
            1,
            16,
            1.6,
            18,
            6
          ],
          "line-color": "hsl(40, 40%, 89%)",
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [1, 0]],
            15,
            ["literal", [1.75, 1]],
            16,
            ["literal", [1, 0.75]],
            17,
            ["literal", [0.3, 0.3]]
          ]
        }
      },
      {
        "id": "road-pedestrian",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., surface"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 12,
        "filter": [
          "all",
          ["==", ["get", "class"], "pedestrian"],
          ["match", ["get", "structure"], ["none", "ford"], true, false],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {"line-join": ["step", ["zoom"], "miter", 14, "round"]},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            14,
            0.5,
            18,
            12
          ],
          "line-color": "hsl(40, 40%, 89%)",
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [1, 0]],
            15,
            ["literal", [1.5, 0.4]],
            16,
            ["literal", [1, 0.2]]
          ]
        }
      },
      {
        "id": "road-simple",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "road-network",
          "mapbox:group": "Road network, surface"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 5,
        "filter": [
          "all",
          [
            "step",
            ["zoom"],
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk"],
              true,
              false
            ],
            6,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              true,
              false
            ],
            8,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary", "secondary"],
              true,
              false
            ],
            10,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "trunk",
                "primary",
                "secondary",
                "tertiary",
                "motorway_link",
                "trunk_link"
              ],
              true,
              false
            ],
            11,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "secondary",
                "tertiary",
                "street"
              ],
              true,
              false
            ],
            12,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "secondary",
                "tertiary",
                "street",
                "street_limited",
                "primary_link"
              ],
              true,
              false
            ],
            13,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "secondary",
                "tertiary",
                "street",
                "street_limited",
                "primary_link",
                "track"
              ],
              true,
              false
            ],
            14,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "primary_link",
                "secondary",
                "secondary_link",
                "tertiary",
                "tertiary_link",
                "street",
                "street_limited",
                "service",
                "track"
              ],
              true,
              false
            ]
          ],
          ["match", ["get", "structure"], ["none", "ford"], true, false],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {
          "line-cap": ["step", ["zoom"], "butt", 14, "round"],
          "line-join": ["step", ["zoom"], "miter", 14, "round"]
        },
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            5,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              0.75,
              ["secondary", "tertiary"],
              0.1,
              0
            ],
            13,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              4,
              ["secondary", "tertiary"],
              2.5,
              [
                "motorway_link",
                "trunk_link",
                "primary_link",
                "street",
                "street_limited"
              ],
              1,
              0.5
            ],
            18,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              32,
              ["secondary", "tertiary"],
              26,
              [
                "motorway_link",
                "trunk_link",
                "primary_link",
                "street",
                "street_limited"
              ],
              18,
              10
            ]
          ],
          "line-color": [
            "match",
            ["get", "class"],
            [
              "primary_link",
              "secondary_link",
              "tertiary_link",
              "street",
              "street_limited",
              "service",
              "track"
            ],
            "hsl(38, 55%, 95%)",
            "hsl(38, 55%, 100%)"
          ]
        }
      },
      {
        "id": "bridge-path",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., barriers-bridges"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 14,
        "filter": [
          "all",
          ["==", ["get", "structure"], "bridge"],
          ["==", ["get", "class"], "path"],
          ["==", ["geometry-type"], "LineString"],
          ["!=", ["get", "type"], "steps"]
        ],
        "layout": {"line-join": "round"},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            15,
            1,
            18,
            4
          ],
          "line-color": "hsl(40, 40%, 89%)",
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [4, 0.3]],
            15,
            ["literal", [1.75, 0.3]],
            16,
            ["literal", [1, 0.3]],
            17,
            ["literal", [1, 0.25]]
          ]
        }
      },
      {
        "id": "bridge-steps",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., barriers-bridges"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 14,
        "filter": [
          "all",
          ["==", ["get", "type"], "steps"],
          ["==", ["get", "structure"], "bridge"],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {"line-join": "round"},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            15,
            1,
            16,
            1.6,
            18,
            6
          ],
          "line-color": "hsl(40, 40%, 89%)",
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [1, 0]],
            15,
            ["literal", [1.75, 1]],
            16,
            ["literal", [1, 0.75]],
            17,
            ["literal", [0.3, 0.3]]
          ]
        }
      },
      {
        "id": "bridge-pedestrian",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., barriers-bridges"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 13,
        "filter": [
          "all",
          ["==", ["get", "structure"], "bridge"],
          ["==", ["get", "class"], "pedestrian"],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {"line-join": "round"},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            14,
            0.5,
            18,
            12
          ],
          "line-color": "hsl(40, 40%, 89%)",
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [1, 0]],
            15,
            ["literal", [1.5, 0.4]],
            16,
            ["literal", [1, 0.2]]
          ]
        }
      },
      {
        "id": "bridge-case-simple",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "road-network",
          "mapbox:group": "Road network, bridges"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 13,
        "filter": [
          "all",
          ["==", ["get", "structure"], "bridge"],
          [
            "step",
            ["zoom"],
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "secondary",
                "tertiary",
                "street",
                "street_limited",
                "primary_link",
                "track"
              ],
              true,
              false
            ],
            14,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "primary_link",
                "secondary",
                "secondary_link",
                "tertiary",
                "tertiary_link",
                "street",
                "street_limited",
                "service",
                "track"
              ],
              true,
              false
            ]
          ],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {"line-join": ["step", ["zoom"], "miter", 14, "round"]},
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            13,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              6,
              ["secondary", "tertiary"],
              4,
              [
                "motorway_link",
                "trunk_link",
                "street",
                "street_limited",
                "primary_link"
              ],
              2.5,
              1.25
            ],
            18,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              36,
              ["secondary", "tertiary"],
              30,
              [
                "motorway_link",
                "trunk_link",
                "street",
                "street_limited",
                "primary_link"
              ],
              22,
              16
            ]
          ],
          "line-color": "hsl(40, 39%, 80%)"
        }
      },
      {
        "id": "bridge-simple",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "road-network",
          "mapbox:group": "Road network, bridges"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 13,
        "filter": [
          "all",
          ["==", ["get", "structure"], "bridge"],
          [
            "step",
            ["zoom"],
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk"],
              true,
              false
            ],
            13,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "secondary",
                "tertiary",
                "street",
                "street_limited",
                "primary_link",
                "track"
              ],
              true,
              false
            ],
            14,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "motorway_link",
                "trunk",
                "trunk_link",
                "primary",
                "primary_link",
                "secondary",
                "secondary_link",
                "tertiary",
                "tertiary_link",
                "street",
                "street_limited",
                "service",
                "track"
              ],
              true,
              false
            ]
          ],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {
          "line-cap": ["step", ["zoom"], "butt", 14, "round"],
          "line-join": ["step", ["zoom"], "miter", 14, "round"]
        },
        "paint": {
          "line-width": [
            "interpolate",
            ["exponential", 1.5],
            ["zoom"],
            13,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              4,
              ["secondary", "tertiary"],
              2.5,
              [
                "motorway_link",
                "trunk_link",
                "street",
                "street_limited",
                "primary_link"
              ],
              1,
              0.5
            ],
            18,
            [
              "match",
              ["get", "class"],
              ["motorway", "trunk", "primary"],
              32,
              ["secondary", "tertiary"],
              26,
              [
                "motorway_link",
                "trunk_link",
                "street",
                "street_limited",
                "primary_link"
              ],
              18,
              12
            ]
          ],
          "line-color": [
            "match",
            ["get", "class"],
            [
              "primary_link",
              "secondary_link",
              "tertiary_link",
              "street",
              "street_limited",
              "service",
              "track"
            ],
            "hsl(38, 55%, 95%)",
            "hsl(38, 55%, 100%)"
          ]
        }
      },
      {
        "id": "admin-1-boundary-bg",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "admin-boundaries",
          "mapbox:group": "Administrative boundaries, admin"
        },
        "source": "composite",
        "source-layer": "admin",
        "filter": [
          "all",
          ["==", ["get", "admin_level"], 1],
          ["==", ["get", "maritime"], "false"],
          ["match", ["get", "worldview"], ["all", "US"], true, false]
        ],
        "layout": {"line-join": "bevel"},
        "paint": {
          "line-color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            8,
            "hsl(40, 39%, 80%)",
            16,
            "hsl(0, 0%, 81%)"
          ],
          "line-width": [
            "interpolate",
            ["linear"],
            ["zoom"],
            7,
            3.75,
            12,
            5.5
          ],
          "line-opacity": [
            "interpolate",
            ["linear"],
            ["zoom"],
            7,
            0,
            8,
            0.75
          ],
          "line-dasharray": [1, 0],
          "line-translate": [0, 0],
          "line-blur": ["interpolate", ["linear"], ["zoom"], 3, 0, 8, 3]
        }
      },
      {
        "id": "admin-0-boundary-bg",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "admin-boundaries",
          "mapbox:group": "Administrative boundaries, admin"
        },
        "source": "composite",
        "source-layer": "admin",
        "minzoom": 1,
        "filter": [
          "all",
          ["==", ["get", "admin_level"], 0],
          ["==", ["get", "maritime"], "false"],
          ["match", ["get", "worldview"], ["all", "US"], true, false]
        ],
        "layout": {},
        "paint": {
          "line-width": [
            "interpolate",
            ["linear"],
            ["zoom"],
            3,
            3.5,
            10,
            8
          ],
          "line-color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            6,
            "hsl(40, 39%, 80%)",
            8,
            "hsl(0, 0%, 81%)"
          ],
          "line-opacity": [
            "interpolate",
            ["linear"],
            ["zoom"],
            3,
            0,
            4,
            0.5
          ],
          "line-translate": [0, 0],
          "line-blur": ["interpolate", ["linear"], ["zoom"], 3, 0, 10, 2]
        }
      },
      {
        "id": "admin-1-boundary",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "admin-boundaries",
          "mapbox:group": "Administrative boundaries, admin"
        },
        "source": "composite",
        "source-layer": "admin",
        "filter": [
          "all",
          ["==", ["get", "admin_level"], 1],
          ["==", ["get", "maritime"], "false"],
          ["match", ["get", "worldview"], ["all", "US"], true, false]
        ],
        "layout": {"line-join": "round", "line-cap": "round"},
        "paint": {
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [2, 0]],
            7,
            ["literal", [2, 2, 6, 2]]
          ],
          "line-width": [
            "interpolate",
            ["linear"],
            ["zoom"],
            7,
            0.75,
            12,
            1.5
          ],
          "line-opacity": [
            "interpolate",
            ["linear"],
            ["zoom"],
            2,
            0,
            3,
            1
          ],
          "line-color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            3,
            "hsl(0, 0%, 77%)",
            7,
            "hsl(0, 0%, 62%)"
          ]
        }
      },
      {
        "id": "admin-0-boundary",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "admin-boundaries",
          "mapbox:group": "Administrative boundaries, admin"
        },
        "source": "composite",
        "source-layer": "admin",
        "minzoom": 1,
        "filter": [
          "all",
          ["==", ["get", "admin_level"], 0],
          ["==", ["get", "disputed"], "false"],
          ["==", ["get", "maritime"], "false"],
          ["match", ["get", "worldview"], ["all", "US"], true, false]
        ],
        "layout": {"line-join": "round", "line-cap": "round"},
        "paint": {
          "line-color": "hsl(0, 0%, 51%)",
          "line-width": [
            "interpolate",
            ["linear"],
            ["zoom"],
            3,
            0.5,
            10,
            2
          ],
          "line-dasharray": [10, 0]
        }
      },
      {
        "id": "admin-0-boundary-disputed",
        "type": "line",
        "metadata": {
          "mapbox:featureComponent": "admin-boundaries",
          "mapbox:group": "Administrative boundaries, admin"
        },
        "source": "composite",
        "source-layer": "admin",
        "minzoom": 1,
        "filter": [
          "all",
          ["==", ["get", "disputed"], "true"],
          ["==", ["get", "admin_level"], 0],
          ["==", ["get", "maritime"], "false"],
          ["match", ["get", "worldview"], ["all", "US"], true, false]
        ],
        "layout": {"line-join": "round"},
        "paint": {
          "line-color": "hsl(0, 0%, 51%)",
          "line-width": [
            "interpolate",
            ["linear"],
            ["zoom"],
            3,
            0.5,
            10,
            2
          ],
          "line-dasharray": [
            "step",
            ["zoom"],
            ["literal", [3.25, 3.25]],
            6,
            ["literal", [2.5, 2.5]],
            7,
            ["literal", [2, 2.25]],
            8,
            ["literal", [1.75, 2]]
          ]
        }
      },
      {
        "id": "road-label-simple",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "road-network",
          "mapbox:group": "Road network, road-labels"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 12,
        "filter": [
          "match",
          ["get", "class"],
          [
            "motorway",
            "trunk",
            "primary",
            "secondary",
            "tertiary",
            "street",
            "street_limited"
          ],
          true,
          false
        ],
        "layout": {
          "text-size": [
            "interpolate",
            ["linear"],
            ["zoom"],
            10,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "trunk",
                "primary",
                "secondary",
                "tertiary"
              ],
              10,
              9
            ],
            18,
            [
              "match",
              ["get", "class"],
              [
                "motorway",
                "trunk",
                "primary",
                "secondary",
                "tertiary"
              ],
              16,
              14
            ]
          ],
          "text-max-angle": 30,
          "text-font": ["DIN Pro Regular", "Arial Unicode MS Regular"],
          "symbol-placement": "line",
          "text-padding": 1,
          "text-rotation-alignment": "map",
          "text-pitch-alignment": "viewport",
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
          "text-letter-spacing": 0.01
        },
        "paint": {
          "text-color": "hsl(40, 40%, 36%)",
          "text-halo-color": "hsl(38, 55%, 100%)",
          "text-halo-width": 1
        }
      },
      {
        "id": "path-pedestrian-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "walking-cycling",
          "mapbox:group": "Walking, cycling, etc., walking-cycling-labels"
        },
        "source": "composite",
        "source-layer": "road",
        "minzoom": 12,
        "filter": [
          "step",
          ["zoom"],
          ["match", ["get", "class"], ["pedestrian"], true, false],
          15,
          ["match", ["get", "class"], ["path", "pedestrian"], true, false]
        ],
        "layout": {
          "text-size": [
            "interpolate",
            ["linear"],
            ["zoom"],
            10,
            ["match", ["get", "class"], "pedestrian", 9, 6.5],
            18,
            ["match", ["get", "class"], "pedestrian", 14, 13]
          ],
          "text-max-angle": 30,
          "text-font": ["DIN Pro Regular", "Arial Unicode MS Regular"],
          "symbol-placement": "line",
          "text-padding": 1,
          "text-rotation-alignment": "map",
          "text-pitch-alignment": "viewport",
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
          "text-letter-spacing": 0.01
        },
        "paint": {
          "text-color": "hsl(40, 40%, 36%)",
          "text-halo-color": "hsl(40, 39%, 89%)",
          "text-halo-width": 1,
          "text-halo-blur": 1
        }
      },
      {
        "id": "waterway-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "natural-features",
          "mapbox:group": "Natural features, natural-labels"
        },
        "source": "composite",
        "source-layer": "natural_label",
        "minzoom": 13,
        "filter": [
          "all",
          [
            "match",
            ["get", "class"],
            ["canal", "river", "stream"],
            ["match", ["get", "worldview"], ["all", "US"], true, false],
            ["disputed_canal", "disputed_river", "disputed_stream"],
            [
              "all",
              ["==", ["get", "disputed"], "true"],
              [
                "match",
                ["get", "worldview"],
                ["all", "US"],
                true,
                false
              ]
            ],
            false
          ],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {
          "text-font": ["DIN Pro Italic", "Arial Unicode MS Regular"],
          "text-max-angle": 30,
          "symbol-spacing": [
            "interpolate",
            ["linear", 1],
            ["zoom"],
            15,
            250,
            17,
            400
          ],
          "text-size": [
            "interpolate",
            ["linear"],
            ["zoom"],
            13,
            12,
            18,
            16
          ],
          "symbol-placement": "line",
          "text-pitch-alignment": "viewport",
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
        },
        "paint": {"text-color": "hsl(205, 44%, 90%)"}
      },
      {
        "id": "natural-line-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "natural-features",
          "mapbox:group": "Natural features, natural-labels"
        },
        "source": "composite",
        "source-layer": "natural_label",
        "minzoom": 4,
        "filter": [
          "all",
          [
            "match",
            ["get", "class"],
            ["glacier", "landform"],
            ["match", ["get", "worldview"], ["all", "US"], true, false],
            ["disputed_glacier", "disputed_landform"],
            [
              "all",
              ["==", ["get", "disputed"], "true"],
              [
                "match",
                ["get", "worldview"],
                ["all", "US"],
                true,
                false
              ]
            ],
            false
          ],
          ["==", ["geometry-type"], "LineString"],
          ["<=", ["get", "filterrank"], 2]
        ],
        "layout": {
          "text-size": [
            "step",
            ["zoom"],
            ["step", ["get", "sizerank"], 18, 5, 12],
            17,
            ["step", ["get", "sizerank"], 18, 13, 12]
          ],
          "text-max-angle": 30,
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
          "text-font": ["DIN Pro Medium", "Arial Unicode MS Regular"],
          "symbol-placement": "line-center",
          "text-pitch-alignment": "viewport"
        },
        "paint": {
          "text-halo-width": 0.5,
          "text-halo-color": "hsl(40, 46%, 100%)",
          "text-halo-blur": 0.5,
          "text-color": [
            "step",
            ["zoom"],
            [
              "step",
              ["get", "sizerank"],
              "hsl(26, 15%, 48%)",
              5,
              "hsl(26, 20%, 38%)"
            ],
            17,
            [
              "step",
              ["get", "sizerank"],
              "hsl(26, 15%, 48%)",
              13,
              "hsl(26, 20%, 38%)"
            ]
          ]
        }
      },
      {
        "id": "natural-point-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "natural-features",
          "mapbox:group": "Natural features, natural-labels"
        },
        "source": "composite",
        "source-layer": "natural_label",
        "minzoom": 4,
        "filter": [
          "all",
          [
            "match",
            ["get", "class"],
            ["dock", "glacier", "landform", "water_feature", "wetland"],
            ["match", ["get", "worldview"], ["all", "US"], true, false],
            [
              "disputed_dock",
              "disputed_glacier",
              "disputed_landform",
              "disputed_water_feature",
              "disputed_wetland"
            ],
            [
              "all",
              ["==", ["get", "disputed"], "true"],
              [
                "match",
                ["get", "worldview"],
                ["all", "US"],
                true,
                false
              ]
            ],
            false
          ],
          ["==", ["geometry-type"], "Point"],
          ["<=", ["get", "filterrank"], 2]
        ],
        "layout": {
          "text-size": [
            "step",
            ["zoom"],
            ["step", ["get", "sizerank"], 18, 5, 12],
            17,
            ["step", ["get", "sizerank"], 18, 13, 12]
          ],
          "icon-image": [
            "step",
            ["zoom"],
            ["concat", ["get", "maki"], "-11"],
            15,
            ["concat", ["get", "maki"], "-15"]
          ],
          "text-font": ["DIN Pro Medium", "Arial Unicode MS Regular"],
          "text-offset": [
            "step",
            ["zoom"],
            [
              "step",
              ["get", "sizerank"],
              ["literal", [0, 0]],
              5,
              ["literal", [0, 0.75]]
            ],
            17,
            [
              "step",
              ["get", "sizerank"],
              ["literal", [0, 0]],
              13,
              ["literal", [0, 0.75]]
            ]
          ],
          "text-anchor": [
            "step",
            ["zoom"],
            ["step", ["get", "sizerank"], "center", 5, "top"],
            17,
            ["step", ["get", "sizerank"], "center", 13, "top"]
          ],
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
        },
        "paint": {
          "icon-opacity": [
            "step",
            ["zoom"],
            ["step", ["get", "sizerank"], 0, 5, 1],
            17,
            ["step", ["get", "sizerank"], 0, 13, 1]
          ],
          "text-halo-color": "hsl(40, 46%, 100%)",
          "text-halo-width": 0.5,
          "text-halo-blur": 0.5,
          "text-color": [
            "step",
            ["zoom"],
            [
              "step",
              ["get", "sizerank"],
              "hsl(26, 15%, 48%)",
              5,
              "hsl(26, 20%, 38%)"
            ],
            17,
            [
              "step",
              ["get", "sizerank"],
              "hsl(26, 15%, 48%)",
              13,
              "hsl(26, 20%, 38%)"
            ]
          ]
        }
      },
      {
        "id": "water-line-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "natural-features",
          "mapbox:group": "Natural features, natural-labels"
        },
        "source": "composite",
        "source-layer": "natural_label",
        "filter": [
          "all",
          [
            "match",
            ["get", "class"],
            ["bay", "ocean", "reservoir", "sea", "water"],
            ["match", ["get", "worldview"], ["all", "US"], true, false],
            [
              "disputed_bay",
              "disputed_ocean",
              "disputed_reservoir",
              "disputed_sea",
              "disputed_water"
            ],
            [
              "all",
              ["==", ["get", "disputed"], "true"],
              [
                "match",
                ["get", "worldview"],
                ["all", "US"],
                true,
                false
              ]
            ],
            false
          ],
          ["==", ["geometry-type"], "LineString"]
        ],
        "layout": {
          "text-size": [
            "interpolate",
            ["linear"],
            ["zoom"],
            7,
            ["step", ["get", "sizerank"], 24, 6, 18, 12, 12],
            10,
            ["step", ["get", "sizerank"], 18, 9, 12],
            18,
            ["step", ["get", "sizerank"], 18, 9, 16]
          ],
          "text-max-angle": 30,
          "text-letter-spacing": [
            "match",
            ["get", "class"],
            "ocean",
            0.25,
            ["sea", "bay"],
            0.15,
            0
          ],
          "text-font": ["DIN Pro Italic", "Arial Unicode MS Regular"],
          "symbol-placement": "line-center",
          "text-pitch-alignment": "viewport",
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
        },
        "paint": {
          "text-color": [
            "match",
            ["get", "class"],
            ["bay", "ocean", "sea"],
            "hsl(205, 72%, 90%)",
            "hsl(205, 44%, 90%)"
          ]
        }
      },
      {
        "id": "water-point-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "natural-features",
          "mapbox:group": "Natural features, natural-labels"
        },
        "source": "composite",
        "source-layer": "natural_label",
        "filter": [
          "all",
          [
            "match",
            ["get", "class"],
            ["bay", "ocean", "reservoir", "sea", "water"],
            ["match", ["get", "worldview"], ["all", "US"], true, false],
            [
              "disputed_bay",
              "disputed_ocean",
              "disputed_reservoir",
              "disputed_sea",
              "disputed_water"
            ],
            [
              "all",
              ["==", ["get", "disputed"], "true"],
              [
                "match",
                ["get", "worldview"],
                ["all", "US"],
                true,
                false
              ]
            ],
            false
          ],
          ["==", ["geometry-type"], "Point"]
        ],
        "layout": {
          "text-line-height": 1.3,
          "text-size": [
            "interpolate",
            ["linear"],
            ["zoom"],
            7,
            ["step", ["get", "sizerank"], 24, 6, 18, 12, 12],
            10,
            ["step", ["get", "sizerank"], 18, 9, 12]
          ],
          "text-font": ["DIN Pro Italic", "Arial Unicode MS Regular"],
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
          "text-letter-spacing": [
            "match",
            ["get", "class"],
            "ocean",
            0.25,
            ["bay", "sea"],
            0.15,
            0.01
          ],
          "text-max-width": [
            "match",
            ["get", "class"],
            "ocean",
            4,
            "sea",
            5,
            ["bay", "water"],
            7,
            10
          ]
        },
        "paint": {
          "text-color": [
            "match",
            ["get", "class"],
            ["bay", "ocean", "sea"],
            "hsl(205, 72%, 90%)",
            "hsl(205, 44%, 90%)"
          ]
        }
      },
      {
        "id": "poi-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "point-of-interest-labels",
          "mapbox:group": "Point of interest labels, poi-labels"
        },
        "source": "composite",
        "source-layer": "poi_label",
        "minzoom": 6,
        "filter": [
          "let",
          "densityByClass",
          [
            "match",
            ["get", "class"],
            "arts_and_entertainment",
            4,
            "building",
            0,
            "food_and_drink",
            1,
            "historic",
            1,
            3
          ],
          [
            "<=",
            ["get", "filterrank"],
            [
              "case",
              ["<", 0, ["var", "densityByClass"]],
              [
                "+",
                ["step", ["zoom"], 0, 16, 1, 17, 2],
                ["var", "densityByClass"]
              ],
              ["var", "densityByClass"]
            ]
          ]
        ],
        "layout": {
          "text-size": [
            "step",
            ["zoom"],
            ["step", ["get", "sizerank"], 18, 5, 12],
            17,
            ["step", ["get", "sizerank"], 18, 13, 12]
          ],
          "icon-image": [
            "step",
            ["zoom"],
            ["concat", ["get", "maki"], "-11"],
            15,
            ["concat", ["get", "maki"], "-15"]
          ],
          "text-font": ["DIN Pro Medium", "Arial Unicode MS Regular"],
          "text-offset": [
            "step",
            ["zoom"],
            [
              "step",
              ["get", "sizerank"],
              ["literal", [0, 0]],
              5,
              ["literal", [0, 0.75]]
            ],
            17,
            [
              "step",
              ["get", "sizerank"],
              ["literal", [0, 0]],
              13,
              ["literal", [0, 0.75]]
            ]
          ],
          "text-anchor": [
            "step",
            ["zoom"],
            ["step", ["get", "sizerank"], "center", 5, "top"],
            17,
            ["step", ["get", "sizerank"], "center", 13, "top"]
          ],
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]]
        },
        "paint": {
          "icon-opacity": [
            "step",
            ["zoom"],
            ["step", ["get", "sizerank"], 0, 5, 1],
            17,
            ["step", ["get", "sizerank"], 0, 13, 1]
          ],
          "text-halo-color": [
            "match",
            ["get", "class"],
            "park_like",
            "hsl(78, 55%, 100%)",
            "education",
            "hsl(40, 48%, 100%)",
            "medical",
            "hsl(3, 49%, 100%)",
            "hsl(40, 46%, 100%)"
          ],
          "text-halo-width": 0.5,
          "text-halo-blur": 0.5,
          "text-color": [
            "step",
            ["zoom"],
            [
              "step",
              ["get", "sizerank"],
              [
                "match",
                ["get", "class"],
                "food_and_drink",
                "hsl(22, 44%, 61%)",
                "park_like",
                "hsl(76, 51%, 26%)",
                "education",
                "hsl(40, 18%, 45%)",
                "medical",
                "hsl(3, 18%, 55%)",
                "hsl(26, 15%, 48%)"
              ],
              5,
              [
                "match",
                ["get", "class"],
                "food_and_drink",
                "hsl(22, 68%, 44%)",
                "park_like",
                "hsl(76, 50%, 15%)",
                "education",
                "hsl(40, 45%, 25%)",
                "medical",
                "hsl(3, 24%, 45%)",
                "hsl(26, 20%, 38%)"
              ]
            ],
            17,
            [
              "step",
              ["get", "sizerank"],
              [
                "match",
                ["get", "class"],
                "food_and_drink",
                "hsl(22, 44%, 61%)",
                "park_like",
                "hsl(76, 51%, 26%)",
                "education",
                "hsl(40, 18%, 45%)",
                "medical",
                "hsl(3, 18%, 55%)",
                "hsl(26, 15%, 48%)"
              ],
              13,
              [
                "match",
                ["get", "class"],
                "food_and_drink",
                "hsl(22, 68%, 44%)",
                "park_like",
                "hsl(76, 50%, 15%)",
                "education",
                "hsl(40, 45%, 25%)",
                "medical",
                "hsl(3, 24%, 45%)",
                "hsl(26, 20%, 38%)"
              ]
            ]
          ]
        }
      },
      {
        "id": "airport-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "transit",
          "mapbox:group": "Transit, transit-labels"
        },
        "source": "composite",
        "source-layer": "airport_label",
        "minzoom": 8,
        "filter": [
          "match",
          ["get", "class"],
          ["military", "civil"],
          ["match", ["get", "worldview"], ["all", "US"], true, false],
          ["disputed_military", "disputed_civil"],
          [
            "all",
            ["==", ["get", "disputed"], "true"],
            ["match", ["get", "worldview"], ["all", "US"], true, false]
          ],
          false
        ],
        "layout": {
          "text-line-height": 1.1,
          "text-size": ["step", ["get", "sizerank"], 18, 9, 12],
          "icon-image": [
            "step",
            ["get", "sizerank"],
            ["concat", ["get", "maki"], "-15"],
            9,
            ["concat", ["get", "maki"], "-11"]
          ],
          "text-font": ["DIN Pro Medium", "Arial Unicode MS Regular"],
          "text-offset": [0, 0.75],
          "text-rotation-alignment": "viewport",
          "text-anchor": "top",
          "text-field": [
            "step",
            ["get", "sizerank"],
            ["coalesce", ["get", "name_en"], ["get", "name"]],
            15,
            ["get", "ref"]
          ],
          "text-letter-spacing": 0.01,
          "text-max-width": 9
        },
        "paint": {
          "text-color": "hsl(225, 4%, 40%)",
          "text-halo-color": "hsl(225, 61%, 100%)",
          "text-halo-width": 1
        }
      },
      {
        "id": "settlement-subdivision-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "place-labels",
          "mapbox:group": "Place labels, place-labels"
        },
        "source": "composite",
        "source-layer": "place_label",
        "minzoom": 10,
        "maxzoom": 15,
        "filter": [
          "all",
          [
            "match",
            ["get", "class"],
            "settlement_subdivision",
            ["match", ["get", "worldview"], ["all", "US"], true, false],
            "disputed_settlement_subdivision",
            [
              "all",
              ["==", ["get", "disputed"], "true"],
              [
                "match",
                ["get", "worldview"],
                ["all", "US"],
                true,
                false
              ]
            ],
            false
          ],
          ["<=", ["get", "filterrank"], 3]
        ],
        "layout": {
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
          "text-transform": "uppercase",
          "text-font": ["DIN Pro Regular", "Arial Unicode MS Regular"],
          "text-letter-spacing": [
            "match",
            ["get", "type"],
            "suburb",
            0.15,
            0.1
          ],
          "text-max-width": 7,
          "text-padding": 3,
          "text-size": [
            "interpolate",
            ["cubic-bezier", 0.5, 0, 1, 1],
            ["zoom"],
            11,
            ["match", ["get", "type"], "suburb", 11, 10.5],
            15,
            ["match", ["get", "type"], "suburb", 17, 16]
          ]
        },
        "paint": {
          "text-halo-color": "hsla(40, 46%, 100%, 0.75)",
          "text-halo-width": 1,
          "text-color": "hsl(0, 0%, 27%)",
          "text-halo-blur": 0.5
        }
      },
      {
        "id": "settlement-minor-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "place-labels",
          "mapbox:group": "Place labels, place-labels"
        },
        "source": "composite",
        "source-layer": "place_label",
        "maxzoom": 15,
        "filter": [
          "all",
          ["<=", ["get", "filterrank"], 3],
          [
            "match",
            ["get", "class"],
            "settlement",
            ["match", ["get", "worldview"], ["all", "US"], true, false],
            "disputed_settlement",
            [
              "all",
              ["==", ["get", "disputed"], "true"],
              [
                "match",
                ["get", "worldview"],
                ["all", "US"],
                true,
                false
              ]
            ],
            false
          ],
          [
            "step",
            ["zoom"],
            true,
            8,
            [">=", ["get", "symbolrank"], 11],
            10,
            [">=", ["get", "symbolrank"], 12],
            11,
            [">=", ["get", "symbolrank"], 13],
            12,
            [">=", ["get", "symbolrank"], 15],
            13,
            [">=", ["get", "symbolrank"], 11],
            14,
            [">=", ["get", "symbolrank"], 13]
          ]
        ],
        "layout": {
          "icon-image": "",
          "text-font": ["DIN Pro Regular", "Arial Unicode MS Regular"],
          "text-offset": [
            "step",
            ["zoom"],
            ["literal", [0, 0]],
            8,
            ["literal", [0, 0]]
          ],
          "text-anchor": ["step", ["zoom"], "center", 8, "center"],
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
          "text-max-width": 7,
          "text-line-height": 1.1,
          "text-size": [
            "interpolate",
            ["cubic-bezier", 0.2, 0, 0.9, 1],
            ["zoom"],
            3,
            [
              "step",
              ["get", "symbolrank"],
              12,
              9,
              11,
              10,
              10.5,
              12,
              9.5,
              14,
              8.5,
              16,
              6.5,
              17,
              4
            ],
            13,
            [
              "step",
              ["get", "symbolrank"],
              25,
              9,
              23,
              10,
              21,
              11,
              19,
              12,
              18,
              13,
              17,
              15,
              15
            ]
          ]
        },
        "paint": {
          "text-color": "hsl(0, 0%, 0%)",
          "text-halo-color": "hsl(40, 46%, 100%)",
          "text-halo-width": 1,
          "icon-opacity": ["step", ["zoom"], 1, 8, 0],
          "text-halo-blur": 1
        }
      },
      {
        "id": "settlement-major-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "place-labels",
          "mapbox:group": "Place labels, place-labels"
        },
        "source": "composite",
        "source-layer": "place_label",
        "maxzoom": 15,
        "filter": [
          "all",
          ["<=", ["get", "filterrank"], 3],
          [
            "match",
            ["get", "class"],
            "settlement",
            ["match", ["get", "worldview"], ["all", "US"], true, false],
            "disputed_settlement",
            [
              "all",
              ["==", ["get", "disputed"], "true"],
              [
                "match",
                ["get", "worldview"],
                ["all", "US"],
                true,
                false
              ]
            ],
            false
          ],
          [
            "step",
            ["zoom"],
            false,
            8,
            ["<", ["get", "symbolrank"], 11],
            10,
            ["<", ["get", "symbolrank"], 12],
            11,
            ["<", ["get", "symbolrank"], 13],
            12,
            ["<", ["get", "symbolrank"], 15],
            13,
            [">=", ["get", "symbolrank"], 11],
            14,
            [">=", ["get", "symbolrank"], 13]
          ]
        ],
        "layout": {
          "icon-image": "",
          "text-font": ["DIN Pro Medium", "Arial Unicode MS Regular"],
          "text-offset": [
            "step",
            ["zoom"],
            ["literal", [0, 0]],
            8,
            ["literal", [0, 0]]
          ],
          "text-anchor": ["step", ["zoom"], "center", 8, "center"],
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
          "text-max-width": 7,
          "text-line-height": 1.1,
          "text-size": [
            "interpolate",
            ["cubic-bezier", 0.2, 0, 0.9, 1],
            ["zoom"],
            8,
            ["step", ["get", "symbolrank"], 18, 9, 17, 10, 15],
            15,
            [
              "step",
              ["get", "symbolrank"],
              28,
              9,
              26,
              10,
              23,
              11,
              21,
              12,
              20,
              13,
              19,
              15,
              16
            ]
          ]
        },
        "paint": {
          "text-color": "hsl(0, 0%, 0%)",
          "text-halo-color": "hsl(40, 46%, 100%)",
          "text-halo-width": 1,
          "icon-opacity": ["step", ["zoom"], 1, 8, 0],
          "text-halo-blur": 1
        }
      },
      {
        "id": "state-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "place-labels",
          "mapbox:group": "Place labels, place-labels"
        },
        "source": "composite",
        "source-layer": "place_label",
        "minzoom": 3,
        "maxzoom": 9,
        "filter": [
          "match",
          ["get", "class"],
          "state",
          ["match", ["get", "worldview"], ["all", "US"], true, false],
          "disputed_state",
          [
            "all",
            ["==", ["get", "disputed"], "true"],
            ["match", ["get", "worldview"], ["all", "US"], true, false]
          ],
          false
        ],
        "layout": {
          "text-size": [
            "interpolate",
            ["cubic-bezier", 0.85, 0.7, 0.65, 1],
            ["zoom"],
            4,
            ["step", ["get", "symbolrank"], 10, 6, 9.5, 7, 9],
            9,
            ["step", ["get", "symbolrank"], 24, 6, 18, 7, 14]
          ],
          "text-transform": "uppercase",
          "text-font": ["DIN Pro Bold", "Arial Unicode MS Bold"],
          "text-field": [
            "step",
            ["zoom"],
            [
              "step",
              ["get", "symbolrank"],
              ["coalesce", ["get", "name_en"], ["get", "name"]],
              5,
              [
                "coalesce",
                ["get", "abbr"],
                ["get", "name_en"],
                ["get", "name"]
              ]
            ],
            5,
            ["coalesce", ["get", "name_en"], ["get", "name"]]
          ],
          "text-letter-spacing": 0.15,
          "text-max-width": 6
        },
        "paint": {
          "text-color": "hsl(0, 0%, 0%)",
          "text-halo-color": "hsl(40, 46%, 100%)",
          "text-halo-width": 1
        }
      },
      {
        "id": "country-label",
        "type": "symbol",
        "metadata": {
          "mapbox:featureComponent": "place-labels",
          "mapbox:group": "Place labels, place-labels"
        },
        "source": "composite",
        "source-layer": "place_label",
        "minzoom": 1,
        "maxzoom": 10,
        "filter": [
          "match",
          ["get", "class"],
          "country",
          ["match", ["get", "worldview"], ["all", "US"], true, false],
          "disputed_country",
          [
            "all",
            ["==", ["get", "disputed"], "true"],
            ["match", ["get", "worldview"], ["all", "US"], true, false]
          ],
          false
        ],
        "layout": {
          "icon-image": "",
          "text-field": ["coalesce", ["get", "name_en"], ["get", "name"]],
          "text-line-height": 1.1,
          "text-max-width": 6,
          "text-font": ["DIN Pro Medium", "Arial Unicode MS Regular"],
          "text-offset": ["literal", [0, 0]],
          "text-size": [
            "interpolate",
            ["cubic-bezier", 0.2, 0, 0.7, 1],
            ["zoom"],
            1,
            ["step", ["get", "symbolrank"], 11, 4, 9, 5, 8],
            9,
            ["step", ["get", "symbolrank"], 28, 4, 22, 5, 21]
          ]
        },
        "paint": {
          "icon-opacity": [
            "step",
            ["zoom"],
            ["case", ["has", "text_anchor"], 1, 0],
            7,
            0
          ],
          "text-color": "hsl(0, 0%, 0%)",
          "text-halo-color": [
            "interpolate",
            ["linear"],
            ["zoom"],
            2,
            "hsla(40, 46%, 100%, 0.75)",
            3,
            "hsl(40, 46%, 100%)"
          ],
          "text-halo-width": 1.25
        }
      }
    ],
    "created": "2020-08-28T17:21:30.926Z",
    "id": "ckeei6cyk0xj619lzz5tsvx03",
    "modified": "2020-08-28T17:23:22.271Z",
    "owner": "gibble",
    "visibility": "private",
    "draft": false

};
