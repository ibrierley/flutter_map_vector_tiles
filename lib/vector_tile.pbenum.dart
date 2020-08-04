///
//  Generated code. Do not modify.
//  source: vector_tile.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Tile_GeomType extends $pb.ProtobufEnum {
  static const Tile_GeomType UNKNOWN = Tile_GeomType._(0, 'UNKNOWN');
  static const Tile_GeomType POINT = Tile_GeomType._(1, 'POINT');
  static const Tile_GeomType LINESTRING = Tile_GeomType._(2, 'LINESTRING');
  static const Tile_GeomType POLYGON = Tile_GeomType._(3, 'POLYGON');

  static const $core.List<Tile_GeomType> values = <Tile_GeomType> [
    UNKNOWN,
    POINT,
    LINESTRING,
    POLYGON,
  ];

  static final $core.Map<$core.int, Tile_GeomType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Tile_GeomType valueOf($core.int value) => _byValue[value];

  const Tile_GeomType._($core.int v, $core.String n) : super(v, n);
}

