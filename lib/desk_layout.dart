import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";

class MyBox extends StatelessWidget {
  const MyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            SearchBtn(),
            Tabs(),
          ],
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Bx(),
              Expanded(child: Bx()),
            ],
          ),
        ),
      ],
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 30,
          itemBuilder: (context, index) {
            return const MyTab();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 5);
          },
        ),
      ),
    );
  }
}

class MyTab extends StatelessWidget {
  const MyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[100],
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(60, 60),
      ),
      onPressed: (() => {}),
      child: const Text("Tab"),
    );
  }
}

class SearchBtn extends StatelessWidget {
  const SearchBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[100],
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(60, 60),
      ),
      onPressed: () => context.go('/home'),
      child: const Icon(
        Icons.search,
        color: Colors.black,
      ),
    );
  }
}

class Bx extends StatelessWidget {
  const Bx({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: const Text("KK"),
    );
  }
}
