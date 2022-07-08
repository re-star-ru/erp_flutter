import 'package:flutter_bloc/flutter_bloc.dart';

class SkuCubit extends Cubit<SkuInfo> {
  SkuCubit()
      : super(SkuInfo(
          "default",
          {"ID": "Новый склад", "ID2": "Старый склад"},
          testEntries(),
        ));

  void showSkuInfo(String sku) async {
    return;
  }
}

class SkuInfo {
  SkuInfo(
    this.name,
    this.warehouses,
    this.entriyes,
  );
  final String name;

  final Map<String, String> warehouses;
  final List<SkuEntry> entriyes;
}

class SkuEntry {
  SkuEntry(
    this.sku,
    this.name,
    this.characteristic,
    this.price,
    this.warehouses,
  );

  final String sku, name, characteristic;
  final double price;
  final Map<String, WarehouseEntry> warehouses; // id > warehouse
}

class WarehouseEntry {
  WarehouseEntry(this.quantity, this.cells);
  final double quantity;
  final List<CellEntry> cells;
}

class CellEntry {
  CellEntry(this.id, this.quantity);
  final String id;
  final double quantity;
}

List<SkuEntry> testEntries() {
  return [
    SkuEntry(
      "sku",
      "name",
      "characteristic",
      123243.22,
      {
        "ID": WarehouseEntry(
          1.0,
          [
            CellEntry("cell", 1.0),
          ],
        ),
        "ID2": WarehouseEntry(
          2.0,
          [
            CellEntry("cell", 2.0),
          ],
        ),
      },
    )
  ];
}
