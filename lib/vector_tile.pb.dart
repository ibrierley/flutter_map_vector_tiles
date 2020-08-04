///
//  Generated code. Do not modify.
//  source: vector_tile.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'vector_tile.pbenum.dart';

export 'vector_tile.pbenum.dart';

class Tile_Value extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tile.Value', package: const $pb.PackageName('vector_tile'), createEmptyInstance: create)
    ..aOS(1, 'stringValue')
    ..a<$core.double>(2, 'floatValue', $pb.PbFieldType.OF)
    ..a<$core.double>(3, 'doubleValue', $pb.PbFieldType.OD)
    ..aInt64(4, 'intValue')
    ..a<$fixnum.Int64>(5, 'uintValue', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, 'sintValue', $pb.PbFieldType.OS6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(7, 'boolValue')
    ..hasExtensions = true
  ;

  Tile_Value._() : super();
  factory Tile_Value() => create();
  factory Tile_Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tile_Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tile_Value clone() => Tile_Value()..mergeFromMessage(this);
  Tile_Value copyWith(void Function(Tile_Value) updates) => super.copyWith((message) => updates(message as Tile_Value));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tile_Value create() => Tile_Value._();
  Tile_Value createEmptyInstance() => create();
  static $pb.PbList<Tile_Value> createRepeated() => $pb.PbList<Tile_Value>();
  @$core.pragma('dart2js:noInline')
  static Tile_Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tile_Value>(create);
  static Tile_Value _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get stringValue => $_getSZ(0);
  @$pb.TagNumber(1)
  set stringValue($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStringValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearStringValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get floatValue => $_getN(1);
  @$pb.TagNumber(2)
  set floatValue($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFloatValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearFloatValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get doubleValue => $_getN(2);
  @$pb.TagNumber(3)
  set doubleValue($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDoubleValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearDoubleValue() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get intValue => $_getI64(3);
  @$pb.TagNumber(4)
  set intValue($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIntValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearIntValue() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get uintValue => $_getI64(4);
  @$pb.TagNumber(5)
  set uintValue($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUintValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearUintValue() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get sintValue => $_getI64(5);
  @$pb.TagNumber(6)
  set sintValue($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSintValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearSintValue() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get boolValue => $_getBF(6);
  @$pb.TagNumber(7)
  set boolValue($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBoolValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearBoolValue() => clearField(7);
}

class Tile_Feature extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tile.Feature', package: const $pb.PackageName('vector_tile'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'id', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$core.int>(2, 'tags', $pb.PbFieldType.KU3)
    ..e<Tile_GeomType>(3, 'type', $pb.PbFieldType.OE, defaultOrMaker: Tile_GeomType.UNKNOWN, valueOf: Tile_GeomType.valueOf, enumValues: Tile_GeomType.values)
    ..p<$core.int>(4, 'geometry', $pb.PbFieldType.KU3)
    ..hasRequiredFields = false
  ;

  Tile_Feature._() : super();
  factory Tile_Feature() => create();
  factory Tile_Feature.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tile_Feature.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tile_Feature clone() => Tile_Feature()..mergeFromMessage(this);
  Tile_Feature copyWith(void Function(Tile_Feature) updates) => super.copyWith((message) => updates(message as Tile_Feature));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tile_Feature create() => Tile_Feature._();
  Tile_Feature createEmptyInstance() => create();
  static $pb.PbList<Tile_Feature> createRepeated() => $pb.PbList<Tile_Feature>();
  @$core.pragma('dart2js:noInline')
  static Tile_Feature getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tile_Feature>(create);
  static Tile_Feature _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get tags => $_getList(1);

  @$pb.TagNumber(3)
  Tile_GeomType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(Tile_GeomType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get geometry => $_getList(3);
}

class Tile_Layer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tile.Layer', package: const $pb.PackageName('vector_tile'), createEmptyInstance: create)
    ..aQS(1, 'name')
    ..pc<Tile_Feature>(2, 'features', $pb.PbFieldType.PM, subBuilder: Tile_Feature.create)
    ..pPS(3, 'keys')
    ..pc<Tile_Value>(4, 'values', $pb.PbFieldType.PM, subBuilder: Tile_Value.create)
    ..a<$core.int>(5, 'extent', $pb.PbFieldType.OU3, defaultOrMaker: 4096)
    ..a<$core.int>(15, 'version', $pb.PbFieldType.QU3, defaultOrMaker: 1)
    ..hasExtensions = true
  ;

  Tile_Layer._() : super();
  factory Tile_Layer() => create();
  factory Tile_Layer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tile_Layer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tile_Layer clone() => Tile_Layer()..mergeFromMessage(this);
  Tile_Layer copyWith(void Function(Tile_Layer) updates) => super.copyWith((message) => updates(message as Tile_Layer));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tile_Layer create() => Tile_Layer._();
  Tile_Layer createEmptyInstance() => create();
  static $pb.PbList<Tile_Layer> createRepeated() => $pb.PbList<Tile_Layer>();
  @$core.pragma('dart2js:noInline')
  static Tile_Layer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tile_Layer>(create);
  static Tile_Layer _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Tile_Feature> get features => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get keys => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Tile_Value> get values => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get extent => $_getI(4, 4096);
  @$pb.TagNumber(5)
  set extent($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExtent() => $_has(4);
  @$pb.TagNumber(5)
  void clearExtent() => clearField(5);

  @$pb.TagNumber(15)
  $core.int get version => $_getI(5, 1);
  @$pb.TagNumber(15)
  set version($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(15)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(15)
  void clearVersion() => clearField(15);
}

class Tile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tile', package: const $pb.PackageName('vector_tile'), createEmptyInstance: create)
    ..pc<Tile_Layer>(3, 'layers', $pb.PbFieldType.PM, subBuilder: Tile_Layer.create)
    ..hasExtensions = true
  ;

  Tile._() : super();
  factory Tile() => create();
  factory Tile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tile clone() => Tile()..mergeFromMessage(this);
  Tile copyWith(void Function(Tile) updates) => super.copyWith((message) => updates(message as Tile));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tile create() => Tile._();
  Tile createEmptyInstance() => create();
  static $pb.PbList<Tile> createRepeated() => $pb.PbList<Tile>();
  @$core.pragma('dart2js:noInline')
  static Tile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tile>(create);
  static Tile _defaultInstance;

  @$pb.TagNumber(3)
  $core.List<Tile_Layer> get layers => $_getList(0);
}

