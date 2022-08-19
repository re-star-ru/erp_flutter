import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/sku_info/overlay/overlay.dart';
import 'package:test_flutter/sku_info/sku_cubit.dart';
import 'package:test_flutter/sku_info/sku_info.dart';

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
            if (state.state == InfoState.error) {
              return const Center(child: Text("error"));
            }

            if (state.state == InfoState.loading) {
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
  const MyTableFloat(this._skuInfo, {super.key});

  final SkuInfo _skuInfo;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FractionColumnWidth(0.3),
        1: FractionColumnWidth(0.2),
      },
      // border: TableBorder.all(color: Colors.black),
      border: const TableBorder(
        horizontalInside: BorderSide(color: Colors.blueGrey),
      ),
      children: [
        TableRow(children: [
          const TextCell("Товар"),
          const TextCell("Цена"),
          ..._skuInfo.warehouses.map((v) => TextCell(v.name)).toList(),
        ]),
        ...(_skuInfo.entries.entries.toList()
              ..sort(
                (a, b) {
                  return (b.value.quantity - a.value.quantity).toInt();
                },
              ))
            .map((entry) {
          return TableRow(
            children: [
              ProductCell(
                entry.value.name,
                entry.value.characteristic,
                entry.value.description,
              ),
              const TextCell('todo :руб.'),
              ..._skuInfo.warehouses.map((w) {
                final wh = entry.value.warehouses;
                if (wh == null || wh.isEmpty) {
                  return const TextCell("");
                }

                final cells = wh[w.id];
                if (cells == null) {
                  return const TextCell("");
                }

                return WarehouseCell(cells);
              }).toList(),
            ],
          );
        }).toList()
      ],
    );
  }
}

class TextCell extends StatelessWidget {
  const TextCell(this._data, {super.key});

  final String _data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(_data),
    );
  }
}

class ProductCell extends StatelessWidget {
  const ProductCell(this._name, this._char, this._description, {super.key});

  final String _name, _char, _description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: _char,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' $_name',
              style: DefaultTextStyle.of(context).style,
            ),
            TextSpan(
              text: '\n$_description',
              style: DefaultTextStyle.of(context).style,
            ),
          ],
        ),
      ),
    );
  }
}

class WarehouseCell extends StatelessWidget {
  WarehouseCell(this._whCell, {super.key});

  final _key = GlobalKey();
  final WarehouseEntry _whCell;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: _key,
      cursor: SystemMouseCursors.help,
      onEnter: (event) {
        // Logger().d("hover!");

        context.read<OverlayCubit>().showOverlay(
              CellOverlay(_key, _whCell.cells),
            );
      },
      onExit: (event) {
        // Logger().d("unhover!");
        context.read<OverlayCubit>().showOverlay(null);
      },
      child: TextCell('${_whCell.quantity} шт.'),
    );
  }
}
