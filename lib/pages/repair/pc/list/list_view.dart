import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/components/network_states.dart';
import 'package:test_flutter/repo/diagnostic/diagnostic_cubit.dart';

class RepairListViewPC extends StatelessWidget {
  const RepairListViewPC({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Талон ремонта'),
        FilledButton(
          onPressed: () async => context.read<DiagnosticListCubit>().list(),
          child: const Text("Message"),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: BlocBuilder<DiagnosticListCubit, DiagnosticList>(
              builder: (context, state) {
                if (state.state == NetworkState.error) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    context.showErrorBar(content: const Text("Network error"));
                  });
                  return const Text("Error");
                }

                if (state.state == NetworkState.loading) {
                  return const CircularProgressIndicator();
                }

                return DiagnosticListView(state);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DiagnosticListView extends StatelessWidget {
  const DiagnosticListView(this._diagnosticList, {super.key});

  final DiagnosticList _diagnosticList;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowHeight: 58.0,
      columns: const [
        DataColumn(label: Text("id")),
        DataColumn(label: Text("created at")),
        DataColumn(label: Text("updated at")),
        DataColumn(label: Text("defined number")),
        DataColumn(label: Text("sku")),
      ],
      rows: _diagnosticList.diagnosticList.map((el) {
        return DataRow(
          cells: [
            DataCell(
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(el.id.toString()),
                subtitle: Text(el.version.toString()),
              ),
              onTap: () {
                Logger().d("list tile ${el.id}");
                context.go("/repair/${el.id}");
              },
            ),
            DataCell(ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(DateFormat.yMMMMd().format(el.createdAt)),
              subtitle: Text(DateFormat.Hms().format(el.createdAt)),
            )),
            DataCell(ListTile(
              title: Text(DateFormat.yMMMMd().format(el.updatedAt)),
              subtitle: Text(DateFormat.Hms().format(el.updatedAt)),
            )),
            DataCell(Text(el.definedNumber)),
            DataCell(Text(el.sku)),
          ],
        );
      }).toList(),
    );
  }
}
