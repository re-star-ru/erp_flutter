import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:go_router/go_router.dart";
import 'package:test_flutter/search/search.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go("/"),
          child: const Icon(Icons.close_outlined),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [SearchInput(focus), Expanded(child: SearchTable())],
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(color: Colors.lightGreenAccent),
            )
          ],
        ));
  }
}

class SearchTable extends StatelessWidget {
  const SearchTable({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SearchCubit>().state;

    print('STATE: ${state.status}');

    switch (state.status) {
      case SearchStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case SearchStatus.ok:
        return ListView.builder(
          itemCount: state.result.length,
          itemBuilder: (context, index) {
            return ListTile(
              enabled: true,
              leading: Text('leading ${state.result[index].sku}'),
              title: Text("Item $index"),
              onTap: () {
                print('on intem click $index');
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

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
