import 'package:flutter/material.dart';
import 'package:test_flutter/components/nav_button.dart';
import "package:go_router/go_router.dart";

class PhoneLayout extends StatelessWidget {
  const PhoneLayout(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavBtn(
              const Icon(Icons.search, color: Colors.black),
              () => context.go('/'),
            ),
            const SizedBox(width: 10),
            NavBtn(
              const Icon(Icons.receipt, color: Colors.black),
              () => context.go('/repair'),
            ),
            const SizedBox(width: 10),
            NavBtn(
              const Icon(Icons.settings, color: Colors.black),
              () => context.go('/settings'),
            ),
          ],
        ),
        Text("WTF"),
      ],
    );
  }
}
