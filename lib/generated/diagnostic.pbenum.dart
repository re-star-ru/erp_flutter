///
//  Generated code. Do not modify.
//  source: diagnostic.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Item_ItemType extends $pb.ProtobufEnum {
  static const Item_ItemType ITEM_TYPE_UNSPECIFIED = Item_ItemType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ITEM_TYPE_UNSPECIFIED');
  static const Item_ItemType ITEM_TYPE_PRODUCT = Item_ItemType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ITEM_TYPE_PRODUCT');
  static const Item_ItemType ITEM_TYPE_SERVICE = Item_ItemType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ITEM_TYPE_SERVICE');

  static const $core.List<Item_ItemType> values = <Item_ItemType> [
    ITEM_TYPE_UNSPECIFIED,
    ITEM_TYPE_PRODUCT,
    ITEM_TYPE_SERVICE,
  ];

  static final $core.Map<$core.int, Item_ItemType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Item_ItemType? valueOf($core.int value) => _byValue[value];

  const Item_ItemType._($core.int v, $core.String n) : super(v, n);
}

