import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/sku_info/overlay/overlay.dart';
import 'package:test_flutter/sku_info/sku_cubit.dart';

class SkuInfoView extends StatelessWidget {
  SkuInfoView({super.key});

  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: _key,
      fit: StackFit.expand,
      children: [
        BlocBuilder<SkuCubit, SkuInfo>(
          builder: (context, state) {
            if (state.entriyes.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            // return SingleChildScrollView(child: MyTable(state));
            return SingleChildScrollView(child: MyTableFloat(state));
          },
        ),
        OverlayView(_key),
      ],
    );
  }
}

class MyTableFloat extends StatelessWidget {
  MyTableFloat(this._skuInfo, {super.key});

  final SkuInfo _skuInfo;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FractionColumnWidth(0.3),
        1: FractionColumnWidth(0.2),
      },
      border: TableBorder.all(color: Colors.black),
      children: [
        TableRow(children: [
          Text("Товар"),
          Text("Цена"),
          ..._skuInfo.warehouses.values.map((id) => Text(id)).toList(),
        ]),
        TableRow(children: [
          const Text("cs125 rg"),
          const Text("1231231.23"),
          WarehouseCell(),
          WarehouseCell(),
        ]),
        ...List<TableRow>.generate(
          100,
          (index) => TableRow(children: [
            const Text("cs125 rg"),
            const Text("1231231.23"),
            WarehouseCell(),
            WarehouseCell()
          ]),
        )
      ],
    );
  }
}

class WarehouseCell extends StatelessWidget {
  WarehouseCell({super.key});

  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: _key,
      cursor: SystemMouseCursors.help,
      onEnter: (event) {
        Logger().d("hover!");
        context.read<OverlayCubit>().showOverlay(_key);
      },
      onExit: (event) {
        Logger().d("unhover!");
        context.read<OverlayCubit>().showOverlay(GlobalKey());
      },
      child: Container(
        child: Text("123 шт."),
        padding: EdgeInsets.all(4),
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  const MyTable(this._skuInfo, {super.key});

  final SkuInfo _skuInfo;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text("Товар")),
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
      rows: List<DataRow>.generate(
        100,
        (index) => ProductRow(context, "cs125", "RG", 133.23, 10),
      ),
    );
  }
}

DataRow ProductRow(
  BuildContext context,
  String name,
  String char,
  double price,
  int quantity,
) {
  var n = RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: char,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        TextSpan(
          text: " $name",
          style: const TextStyle(color: Colors.black),
        ),
        const TextSpan(
          text: "\nописание asdf asdf",
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ],
    ),
  );

  return DataRow(
    cells: [
      DataCell(n),
      DataCell(Text('$price р.')),
      MyDataCell(context, Text('$quantity шт.')),
      MyDataCell(context, Text('$quantity шт.')),
    ],
  );
}

DataCell MyDataCell(BuildContext context, Widget child) {
  final key = GlobalKey();

  return DataCell(
    Container(
      key: key,
      constraints: const BoxConstraints.expand(),
      child: MouseRegion(
        cursor: SystemMouseCursors.help,
        onEnter: (value) {
          Logger().d("hover!");
          context.read<OverlayCubit>().showOverlay(key);
        },
        onExit: (value) {
          Logger().d("unhover!");
          context.read<OverlayCubit>().showOverlay(GlobalKey());
        },
        child: child,
      ),
    ),
    // onTap: () {},
  );

  //    InkWell(
  //   key: key,
  //   child: child,
  //   onHover: (value) {
  //     Logger().d("on hover");
  //   },
  //   onTap: () {},
  // ));
}
