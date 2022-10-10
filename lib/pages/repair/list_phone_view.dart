import 'package:flutter/cupertino.dart';

class RepairListViewPhone extends StatelessWidget {
  const RepairListViewPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Талон ремонта'),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                100,
                (index) => SizedBox(
                  width: double.infinity,
                  child: Text('$index'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
