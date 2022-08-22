import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/pages/sku_info/sku_info.dart';

class SkuCubit extends Cubit<SkuInfo> {
  SkuCubit() : super(SkuInfo("", [], {}));

  final _dio = Dio(
    BaseOptions(baseUrl: "https://api.re-star.ru/v1/oprox/warehouse/sku"),
  );

  Future<SkuInfo> _request(String query) async {
    try {
      final response = await _dio.get('/$query');
      final body = (jsonDecode(response.data) as Map<String, dynamic>)['body'];

      return SkuInfo.fromJson(body);
    } catch (e, stack) {
      Logger().e("request error", e, stack);
      return SkuInfo("", [], {}, state: InfoState.error);
    }
  }

  void showSkuInfo(String sku) async {
    emit(SkuInfo("", [], {}, state: InfoState.loading));
    final result = await _request(sku);
    emit(result);

    return;
  }
}

// class SkuInfo {
//   SkuInfo(
//     this.name,
//     this.warehouses,
//     this.entries,
//   );
//   final String name;

//   final List<Warehouse> warehouses;
//   final List<SkuEntry> entries;
// }

// class Warehouse {
//   Warehouse(this.id, this.name);
//   final String id;
//   final String name;
// }

// class SkuEntry {
//   SkuEntry(
//     this.sku,
//     this.name,
//     this.characteristic,
//     this.description,
//     this.price,
//     this.warehouses,
//   );

//   final String sku, name, characteristic, description;
//   final double price;
//   final Map<String, WarehouseEntry> warehouses; // id > warehouse
// }

// class WarehouseEntry {
//   WarehouseEntry(this.quantity, this.cells);
//   final double quantity;
//   final List<CellEntry> cells;
// }

// class CellEntry {
//   CellEntry(this.id, this.quantity);
//   final String id;
//   final double quantity;
// }

// List<SkuEntry> testEntries() {
//   return [
//     SkuEntry(
//       "sku",
//       "name",
//       "characteristic",
//       "стартер бла",
//       123243.22,
//       {
//         "1": WarehouseEntry(
//           1.0,
//           [
//             CellEntry("cell", 1.0),
//           ],
//         ),
//         "2": WarehouseEntry(
//           2.0,
//           [
//             CellEntry("cell", 2.0),
//           ],
//         ),
//       },
//     ),
//     SkuEntry(
//       "sku2",
//       "name2",
//       "characteristic2",
//       "стартер бла2",
//       123243.22,
//       {
//         "1": WarehouseEntry(
//           1.0,
//           [
//             CellEntry("cell", 1.0),
//           ],
//         ),
//       },
//     )
//   ];
// }
