import 'package:flutter/cupertino.dart';

class RepairListView extends StatelessWidget {
  const RepairListView({super.key});

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
