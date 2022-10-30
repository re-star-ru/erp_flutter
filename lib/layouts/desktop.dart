import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:go_router/go_router.dart";
import 'package:test_flutter/components/nav_button.dart';
import 'package:test_flutter/components/theme.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 60,
          child: NavBar(),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  static const bntColor = Color(0xFF14213D);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NavBtn(
          const Icon(Icons.search, color: bntColor),
          () => context.go('/'),
        ),
        const SizedBox(height: 10),
        NavBtn(
          const Icon(Icons.receipt, color: bntColor),
          () => context.go('/repair'),
        ),
        const SizedBox(height: 10),
        NavBtn(
          const Icon(Icons.update, color: bntColor),
          () async {},
        ),
        const SizedBox(height: 10),
        NavBtn(
          const Icon(Icons.settings, color: bntColor),
          () => context.go('/settings'),
        ),
        const SizedBox(height: 10),
        NavBtn(
          const Icon(Icons.chat_sharp, color: bntColor),
          () => context.go('/settings'),
        ),
        const SizedBox(height: 10),
        NavBtn(
          const Icon(Icons.dark_mode, color: bntColor),
          () {
            context.read<DarkThemeCubit>().toggle();
          },
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
