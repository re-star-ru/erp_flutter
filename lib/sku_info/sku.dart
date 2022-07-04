import 'package:flutter/material.dart';

class SkuInfo {
  SkuInfo(this.name);
  final String name;
}

class SkuInfoView extends StatelessWidget {
  const SkuInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("Наименование")),
        DataColumn(label: Text("Цена")),
        DataColumn(
          label: Text("Новая станция"),
          tooltip: "Нажмите для показа ячейки",
        ),
        DataColumn(
          label: Text("Старая станция"),
          tooltip: "Нажмите для показа ячейки",
        ),
      ],
      rows: [
        ProductRow("RG CS125", 13023.22, 132),
        ProductRow("RG CS125", 1.2, 132),
        ProductRow("RG CS125", 1.2, 132),
        ProductRow("RG CS125", 1.2, 132),
        ProductRow("RG CS125", 1.2, 132),
      ],
    );
  }
}

DataRow ProductRow(String name, double price, int quantity) {
  return DataRow(cells: [
    DataCell(Text(name)),
    DataCell(Text(price.toString())),
    DataCell(Text('$quantity шт.'), onTap: () => print("tup")),
    DataCell(Text('$quantity шт.'), onTap: () => print("tup")),
  ]);
}
