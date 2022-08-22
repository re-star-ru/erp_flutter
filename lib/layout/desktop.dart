import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import 'package:logger/logger.dart';
import 'package:test_flutter/components/nav_button.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          color: Colors.amber.shade100,
          child: const NavBar(),
        ),
        Expanded(child: child),
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NavBtn(
          const Icon(Icons.search, color: Colors.black),
          () => context.go('/'),
        ),
        const SizedBox(height: 10),
        NavBtn(
          const Icon(Icons.receipt, color: Colors.black),
          () => context.go('/document'),
        ),
        const SizedBox(height: 30),
        NavBtn(
          const Icon(Icons.update, color: Colors.black),
          () async {
            Logger().i("Update button pressed");
          },
        ),
        const SizedBox(height: 10),
        NavBtn(
          const Icon(Icons.settings, color: Colors.black),
          () => context.go('/settings'),
        ),
        NavBtn(
          const Icon(Icons.chat_sharp, color: Colors.black),
          () => context.go('/settings'),
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
