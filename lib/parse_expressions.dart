import 'dart:math';

main() {

  Map style = { };
  //Map feature = { 'class': 'residential', 'filterrank': 2.0, 'sizerank': 14.0, "name": "Somename", 'rank': 5 };
  //Map feature = {'type': 'mini_roundabout', 'structure': 'none', 'oneway': 'false', 'class': 'pedestrian', 'iso_3166_2': 'GB-ENG', 'iso_3166_1': 'GB'};
  Map feature = {'admin_level': 1, 'sizerank': false, 'class': 'park', 'name': 'Great Britain', 'disputed': 'false',};
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
 ["interpolate", ["linear"], ["zoom"], 15, ["match", ["get", "class"], "park", "hsl(78, 50%, 73%)", "airport", "hsl(225, 42%, 82%)", "cemetery", "hsl(60, 44%, 79%)", "glacier", "hsl(205, 66%, 90%)", "hospital", "hsl(3, 42%, 78%)", "pitch", "hsl(78, 51%, 68%)", "sand", "hsl(43, 48%, 76%)", "school", "hsl(40, 43%, 72%)", "hsl(40, 42%, 76%)"], 16, ["match", ["get", "class"], "park", "hsl(78, 50%, 73%)", "airport", "hsl(225, 56%, 80%)", "cemetery", "hsl(60, 44%, 79%)", "glacier", "hsl(205, 66%, 90%)", "hospital", "hsl(3, 44%, 80%)", "pitch", "hsl(78, 51%, 68%)", "sand", "hsl(43, 48%, 76%)", "school", "hsl(40, 43%, 72%)", "hsl(40, 42%, 76%)"]]

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
 var test = checkFilter( testStyle2['layers']?[0]['filter'], layerString, type, feature, 14);
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

   /// print("here2 [$command]");

    if( args is Map) { // oslayer style ?
      if(args.containsKey("base")) {
        //(base, val, tempkeys)
        result = interp(args['base'], tileZoom, args['stops']);
      } else {
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
          result = parse(args[1]) == parse(args[2]);
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
        //print("Doing STEP!!!");
          result = parse(args[2]);
          step:
          for (var c = 3; c < args.length; c = c + 2) {
            //print("Checking parse ${args[1]}");
            //print("vs parse ${args[c]}");
            if (parse(args[1]) >= parse(args[c])) {
              result = parse(args[c + 1]);
            } else {
              break step;
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
        case "var":
          result = store[args[1]];
          break;

        case "interpolate": // base, val, keys
          var type = args[1][0];
          //print("TYPE IS $type");
          if (type == "linear") {
            //print("linear");
 //print("interplinear, ${args[2]}     >>   ${args.sublist(3)}}");
 //print("${parse(args[2])}");
var testres = args.sublist(3).map((val){return parse(val); }).toList();
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

   ///print("xres is $xres");
    return xres;
  }
}


dynamic checkFilter(dynamic style, String layerString,String type, Map feature, double tileZoom) {

  ///print("Checking filter $layerString $style $feature");

  ///List layers = style['layers'] ?? [];

  var parser = new Parser(layerString, feature, type, tileZoom);
  var result;


  try {
    //print("here21");
    result = parser.parse(style);
    //print("here22 $result");

  } catch(e) { print("Error: $e"); }


  return result;
}




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
