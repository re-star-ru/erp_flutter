import 'package:flutter/material.dart';

class NavBtn extends StatelessWidget {
  const NavBtn(this.icon, this.onPressed, {super.key});

  final Icon icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[100],
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(60, 60),
      ),
      child: icon,
    );
  }
}
