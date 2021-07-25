import 'dart:math';

import 'package:flutter_map_vector_tile/log.dart';

dynamic interp (base, val, tempkeys) {

  var keys = [];

  if(!(tempkeys[0] is List)) {
    for(var c=0; c<tempkeys.length; c=c+2) {
	    keys.add([tempkeys[c],tempkeys[c+1]]);
    }
  } else {
    keys = tempkeys;
  }

  if(val >= keys[keys.length-1][0].toDouble()) return keys[keys.length-1][1];
  if(val <= keys[0][0].toDouble()) return keys[0][1];

  var i;
  for (i = 0; i < keys.length; i++) {
    if (keys[i][0].toDouble() > val) break;
  }

  var ii = i-1;
  if(keys[ii][1] is String || keys[ii][1] is bool) // not a num, so dont interp
    return keys[ii][1];

  double before0 =  keys[ii][0].toDouble();
  double after0 = keys[ii+1][0].toDouble();

  double before1 = keys[ii][1].toDouble();
  double after1 = keys[ii+1][1].toDouble();

  var a = (val - before0) / (after0 - before0);

  var intKey = before1 * (1-a) + after1 * a;

  var ratio = (pow(base, val - before0) - 1) / (pow(base, after0 - before0) - 1);

  if(base > 1) // exponential
    intKey = (before1 * (1 - ratio)) + (after1 * ratio);

  return intKey;

}

class Parser {

  final Map feature;
  final String layerString;
  final double tileZoom;
  final type;
  Map store = {};

  static l ( string ) {
    Log.out(L.expression, string);
  }

  Parser(this.layerString, this.feature, this.type, this.tileZoom);

  dynamic parse(dynamic args, [bool useList = true]) {

    //l("$args");
    var command = args is List ? args[0] : args;
    var result;



    if( args is Map) { // oslayer style ?
      if(args.containsKey("base")) {
        result = interp(args['base'], tileZoom, args['stops']);
      } else if (args.containsKey("stops")) {
        result = parse([...["stops" ],...args['stops']]);
      }  else {
        result = args;
      }
      return result;
    }

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
          final s1 = parse(args[1]);
          var s2 = parse(args[2]);
          if(s1 is String) { // messy LineString vs LINESTRING etc
            s2 = s2.toString(); // sometimes we seem to get a string false, rather than a bool type
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
          result = parse(args[1]) <= parse(args[2]);
          break;
        case "<":
          result = parse(args[1]) < parse(args[2]);
          break;
        case ">":
          result = parse(args[1]) > parse(args[2]);
          break;
        case "any":
          result = args.sublist(1).any((val) {
            return parse(val) as bool;
          });
          break;
        case '\$type':
          result = type;
          break;
        case "all":
          if(args is String || !(allBool(args.sublist(1)))) {
            result = args; // we can get a value "all" as well as keyword "all"
          } else {
            //l("DOING ALL for $args");
            final sublist = args.sublist(1);
            result = true;
            //var notAllBool = false;
            SUB: for (var c = 0; c < sublist.length; c++) {
              //l("DOING ALL CHECK FOR parse ${sublist[c]}");
              final test = parse(sublist[c]);
              if ((test is bool) && test == false) {
                //l("ALL HERE WAS FALSE");
                result = false;
                break SUB;
              } else if ((test is bool) && test == true) {
                //l("ALL test is bool and true (test is $test)");
              } else {
                //l("ALL something else..test was $test");
                result = false;
                break SUB;
              }
            }
          }

          l("ALL final result was $result");
          break;
        case "in":
        /// http://kuanbutts.com/2019/02/18/mapbox-expressions/

        //l("DOING REAL IN WITH $args");
          if (args.length >= 2) {
            final featureVal = parse(args[1]);
            if (featureVal != null) {
              //l("featureval is $featureVal");
              var checkList;
              if (args[2] is List) {
                //l("args2 is list ${args[2]}");
                checkList = parse(args[2]);
              } else {
                //l("args2 is NOT list so working on parsing ${args.sublist(2)} args2 is ${args[2]}");
                checkList = parse(args.sublist(2));
              }
              //l("_IN_ DOING ANY!!! checklist is $checkList args is $args");
              result = checkList.any((val) {
                return featureVal == parse(val);
              });
              ///print("res kkk = $result");
            } else {
              result = false;
            }
          }
          break;
        case "!in":
          result = !parse(["in", ...args.sublist(1)]);
          break;
        case "get":
          //l("getting ${args[1]}");
          //l("res is ${feature[args[1]]} feature is $feature");
          if (args[1] != null) {
            result = feature[args[1]];
          } else {
          }
          return result;
          break;
        case "has":
          if (feature.containsKey(parse(args[1]))) {
            result = true;
          } else {
            result = false;
          }
          break;
        case "!has":
          if (feature.containsKey(parse(args[1]))) {
            result = false;
          } else {
            result = true;
          }
          break;
        case "!":
          result = !parse(args[1]);
          break;
        case "match":
          //l("MATCH checkarg will be parse ${args[1]}");
          var checkArg = parse(args[1]);

          for (var c = 2; c < args.length - 2; c = c + 2) {
            if (args[c] is String) {
              if (checkArg == parse(args[c])) {
                //l("matches true $checkArg and parsed ${args[c]}");
                return parse(args[c + 1]);
              }
            } else if (args[c] is List) {
              //l("GOT HERE WANT TO DO [IN] $checkArg ${args[c]} (result would be ${args[c+1]})");
              if (parse(["in", checkArg, args[c]])) {
                //l("matches IN true $checkArg and parsed ${args[c]}, will return ${args[c+1]}");
                return parse(args[c + 1]);
              } else {
              }
            } else {
            }
          }
          //l("didn't match so returning last ${args.last}");
          return args.last;

          /// just let it pass through ?
          break;
        case "coalesce":
          for (var c = 1; c < args.length; c++) {
            var test = parse(args[c]);
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
         //l("DOING STEP, initial result is parsed ${args[2]}");
          result = parse(args[2]);
          //l("have step result here of $result");
          STEP: for (var c = 3; c < args.length; c = c + 2) {
            if (parse(args[1]) >= parse(args[c])) {
              result = parse(args[c + 1]);
            } else {
              break STEP;
            }
          }
          //l("STEP RES IS $result");
          break;
        case "stops":
          result = parse(args[1][1]);
          STOP: for (var c = 1; c < args.length; c = c + 1) {
            if (tileZoom >= parse(args[c][0])) {
              result = parse(args[c][1]);
            } else {
              break STOP;
            }
          }
          break;
        case "case":
          result = parse(args[args.length - 1]);
          xcase:
          for (var c = 1; c < args.length - 1; c = c + 2) {
            if (parse(args[c])) {
              result = parse(args[c + 1]);
              break xcase;
            }
          }
          break;
        case "let":
          for (var c = 1; c < args.length - 1; c = c + 2) {
            store[args[c]] = parse(args[c + 1]);
          }
          result = parse(args[args.length - 1]);
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
          //l("GEOMTYPE IS actually $result");
          break;
        case "interpolate": // base, val, keys
          var type = args[1][0];
          if (type == "linear") {
            result = interp(1.0, parse(args[2]), args.sublist(3).map((val)
              { return parse(val); }).toList() );

          } else if (type == "exponential") {
		        result = interp( parse(args[1][1]), parse(args[2]), args.sublist(3).map( (val)
              {return parse(val); }).toList() );
          } else if (type == "identity") {
            result = args[1]; // untested
          }
          break;

      }
    }

    if(args is String) {
      if(feature.containsKey(args))
	      result = feature[args];
      if(args == "false")
        result = false;
    }

    var xres = result != null ? result : args;

    return xres;
  }

  bool allBool(list) {
    //l("ALLBOOL CHECK $list");
    for(var e in list) {
      if(!(parse(e) is bool)) {
        return false;
      }
    }
    return true;
  }
}


dynamic checkFilter(dynamic style, String layerString, Map featureInfo, double tileZoom) {

  //print("CHECKING FILTER!!!!!!!!!!!!!!!!!!!");

  var feature = featureInfo['properties'];
  var geom = featureInfo['geometry'];
  var type = geom['type'];
  var parser = new Parser(layerString, feature, type, tileZoom);
  var result;

  try {
    result = parser.parse(style);
  } catch(e) { print("FilterParseError: $e from $style, feature $featureInfo"); }


  return result;
}