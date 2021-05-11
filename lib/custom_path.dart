import 'package:flutter/material.dart';
import 'package:simplify_dart/simplify_dart.dart';

class PathPoint {
  final double x;
  final double y;
  PathPoint(this.x, this.y);
}

//kind-of-superset of ui:path that allows for better optimization
class SuperPath {
  List<List<PathPoint>> lines = [];

  //Starts a new sub path at a given corridnate
  void moveTo(double x, double y) {
    lines.add([PathPoint(x, y)]);
  }

  void lineTo(double x, double y) {
    if (lines.isEmpty) {
      moveTo(x, y);
    } else {
      lines[lines.length - 1].add(PathPoint(x, y));
    }
  }

  Path getPath({double tolerance}) {
    Path p = Path();

    List<List<PathPoint>> simplifiedPath = lines;

    for (int p = 0; p < simplifiedPath.length; p++) {
      List<PathPoint> path = simplifiedPath[p];
      //This is done at the drawing level to allow for resolution and zoom independent scaling.

      simplifiedPath[p] =
          simplify(path, tolerance: tolerance, highestQuality: true)
              .map((e) => PathPoint(e.x, e.y))
              .toList();
    }

    for (var path in simplifiedPath) {
      for (int i = 0; i < path.length; i++) {
        PathPoint point = path[i];
        if (i == 0) {
          p.moveTo(point.x, point.y);
        } else {
          p.lineTo(point.x, point.y);
        }
      }
    }
    return p;
  }
}
