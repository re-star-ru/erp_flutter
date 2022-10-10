import 'package:flutter/material.dart';

class RepairViewPC extends StatelessWidget {
  const RepairViewPC(this._id, {super.key});

  final String _id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text(_id)),
      ],
    );
  }
}
