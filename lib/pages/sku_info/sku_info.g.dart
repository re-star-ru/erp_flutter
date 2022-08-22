// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkuInfo _$SkuInfoFromJson(Map<String, dynamic> json) => SkuInfo(
      json['sku'] as String,
      (json['warehouses'] as List<dynamic>)
          .map((e) => Warehouse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['entries'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Entry.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$SkuInfoToJson(SkuInfo instance) => <String, dynamic>{
      'sku': instance.sku,
      'warehouses': instance.warehouses,
      'entries': instance.entries,
    };

Warehouse _$WarehouseFromJson(Map<String, dynamic> json) => Warehouse(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$WarehouseToJson(Warehouse instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      json['name'] as String,
      json['char'] as String,
      json['description'] as String,
      (json['quantity'] as num).toDouble(),
      (json['warehouses'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WarehouseEntry.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'char': instance.characteristic,
      'name': instance.name,
      'description': instance.description,
      'quantity': instance.quantity,
      'warehouses': instance.warehouses,
    };

WarehouseEntry _$WarehouseEntryFromJson(Map<String, dynamic> json) =>
    WarehouseEntry(
      (json['quantity'] as num).toDouble(),
      (json['selection'] as num).toDouble(),
      (json['cells'] as List<dynamic>)
          .map((e) => CellEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WarehouseEntryToJson(WarehouseEntry instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'selection': instance.selection,
      'cells': instance.cells,
    };

CellEntry _$CellEntryFromJson(Map<String, dynamic> json) => CellEntry(
      json['id'] as String,
      (json['quantity'] as num).toDouble(),
      (json['selection'] as num).toDouble(),
    );

Map<String, dynamic> _$CellEntryToJson(CellEntry instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'selection': instance.selection,
    };
