import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/components/debouncer.dart';
import 'package:test_flutter/repo/search/search.dart';
import 'package:test_flutter/pages/sku_info/sku_pc_view.dart';
import 'package:test_flutter/pages/sku_info/sku_cubit.dart';

class HomePC extends StatelessWidget {
  HomePC({super.key});

  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Material(
            elevation: 8.0,
            child: Column(
              children: [
                SearchInput(focus),
                const Expanded(child: SearchTable())
              ],
            ),
          ),
        ),
        Container(
          width: 8.0,
          color: Theme.of(context).colorScheme.background,
        ),
        Expanded(
          flex: 10,
          // child: const SkuInfoView(),
          child: Material(
            type: MaterialType.canvas,
            elevation: 8.0,
            child: SkuInfoView(),
          ),
        )
      ],
    );
  }
}

class SearchTable extends StatelessWidget {
  const SearchTable({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SearchCubit>().state;

    switch (state.status) {
      case SearchStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case SearchStatus.ok:
        return ListView.builder(
          itemCount: state.result.length,
          itemBuilder: (context, index) {
            return ListTile(
              enabled: true,
              title: Text(
                state.result[index].sku,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                context.read<SkuCubit>().showSkuInfo(state.result[index].sku);
              },
            );
          },
        );
    }
  }
}

class SearchInput extends StatelessWidget {
  SearchInput(this.focus, {super.key});

  final FocusNode focus;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        autofocus: true,
        controller: TextEditingController(),
        onChanged: (value) {
          _debouncer.run(() => context.read<SearchCubit>().search(value));
        },
        onSubmitted: (value) {
          focus.requestFocus();
          _debouncer.run(() => context.read<SearchCubit>().search(value));
        },
        focusNode: focus,
        decoration: const InputDecoration(
          hintText: "Поиск...",
        ),
      ),
    );
  }
}
