import 'package:json_annotation/json_annotation.dart';

part 'sku_info.g.dart';

enum InfoState {
  loading,
  loaded,
  error,
}

@JsonSerializable()
class SkuInfo {
  SkuInfo(
    this.sku,
    this.warehouses,
    this.entries, {
    this.state = InfoState.loaded,
  });
  factory SkuInfo.fromJson(Map<String, dynamic> json) =>
      _$SkuInfoFromJson(json);

  @JsonKey(ignore: true)
  final InfoState state;

  final String sku;

  final List<Warehouse> warehouses;
  final Map<String, Entry> entries;
}

@JsonSerializable()
class Warehouse {
  Warehouse(this.id, this.name);
  factory Warehouse.fromJson(Map<String, dynamic> json) =>
      _$WarehouseFromJson(json);

  final String id;
  final String name;
}

@JsonSerializable()
class Entry {
  Entry(
    this.name,
    this.characteristic,
    this.description,
    this.quantity,
    this.warehouses,
  );

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  @JsonKey(name: 'char')
  final String characteristic;

  final String name;
  final String description;
  final double quantity;
  final Map<String, WarehouseEntry>? warehouses;
}

@JsonSerializable()
class WarehouseEntry {
  WarehouseEntry(this.quantity, this.selection, this.cells);

  factory WarehouseEntry.fromJson(Map<String, dynamic> json) =>
      _$WarehouseEntryFromJson(json);

  final double quantity, selection;
  final List<CellEntry> cells;
}

@JsonSerializable()
class CellEntry {
  CellEntry(this.id, this.quantity, this.selection);

  factory CellEntry.fromJson(Map<String, dynamic> json) =>
      _$CellEntryFromJson(json);

  final String id;
  final double quantity, selection;
}
