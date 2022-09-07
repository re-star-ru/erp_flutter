///
//  Generated code. Do not modify.
//  source: diagnostic.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use imageDescriptor instead')
const Image$json = const {
  '1': 'Image',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'path', '3': 3, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `Image`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDescriptor = $convert.base64Decode('CgVJbWFnZRIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRISCgRwYXRoGAMgASgJUgRwYXRo');
@$core.Deprecated('Use itemDescriptor instead')
const Item$json = const {
  '1': 'Item',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'itemType', '3': 2, '4': 1, '5': 14, '6': '.Item.ItemType', '10': 'itemType'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
  '4': const [Item_ItemType$json],
};

@$core.Deprecated('Use itemDescriptor instead')
const Item_ItemType$json = const {
  '1': 'ItemType',
  '2': const [
    const {'1': 'ITEM_TYPE_UNKNOWN', '2': 0},
    const {'1': 'ITEM_TYPE_PRODUCT', '2': 1},
    const {'1': 'ITEM_TYPE_SERVICE', '2': 2},
  ],
};

/// Descriptor for `Item`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemDescriptor = $convert.base64Decode('CgRJdGVtEg4KAmlkGAEgASgDUgJpZBIqCghpdGVtVHlwZRgCIAEoDjIOLkl0ZW0uSXRlbVR5cGVSCGl0ZW1UeXBlEhIKBG5hbWUYAyABKAlSBG5hbWUiTwoISXRlbVR5cGUSFQoRSVRFTV9UWVBFX1VOS05PV04QABIVChFJVEVNX1RZUEVfUFJPRFVDVBABEhUKEUlURU1fVFlQRV9TRVJWSUNFEAI=');
@$core.Deprecated('Use diagnosticDescriptor instead')
const Diagnostic$json = const {
  '1': 'Diagnostic',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    const {'1': 'version', '3': 2, '4': 1, '5': 13, '10': 'version'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'definedNumber', '3': 5, '4': 1, '5': 9, '10': 'definedNumber'},
    const {'1': 'SKU', '3': 6, '4': 1, '5': 9, '10': 'SKU'},
    const {'1': 'items', '3': 7, '4': 3, '5': 11, '6': '.Item', '10': 'items'},
    const {'1': 'images', '3': 8, '4': 3, '5': 11, '6': '.Image', '10': 'images'},
  ],
};

/// Descriptor for `Diagnostic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List diagnosticDescriptor = $convert.base64Decode('CgpEaWFnbm9zdGljEg4KAmlkGAEgASgEUgJpZBIYCgd2ZXJzaW9uGAIgASgNUgd2ZXJzaW9uEjgKCWNyZWF0ZWRBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI4Cgl1cGRhdGVkQXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSJAoNZGVmaW5lZE51bWJlchgFIAEoCVINZGVmaW5lZE51bWJlchIQCgNTS1UYBiABKAlSA1NLVRIbCgVpdGVtcxgHIAMoCzIFLkl0ZW1SBWl0ZW1zEh4KBmltYWdlcxgIIAMoCzIGLkltYWdlUgZpbWFnZXM=');
@$core.Deprecated('Use diagnosticListDescriptor instead')
const DiagnosticList$json = const {
  '1': 'DiagnosticList',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.Diagnostic', '10': 'list'},
  ],
};

/// Descriptor for `DiagnosticList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List diagnosticListDescriptor = $convert.base64Decode('Cg5EaWFnbm9zdGljTGlzdBIfCgRsaXN0GAEgAygLMgsuRGlhZ25vc3RpY1IEbGlzdA==');
