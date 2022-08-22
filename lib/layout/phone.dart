import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/components/nav_button.dart';
import 'package:test_flutter/layout/desktop.dart';
import "package:go_router/go_router.dart";

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            // Logger().i("Update button pressed");
          },
        ),
      ],
    );
  }
}



// return const DefaultTabController(
//       initialIndex: 1,
//       length: 3,
//       child: Scaffold(
//         appBar: TabBar(
//           labelColor: Colors.brown,
//           indicatorColor: Colors.black,
//           tabs: [
//             Tab(icon: Icon(Icons.search)),
//             Tab(icon: Icon(Icons.receipt)),
//             Tab(icon: Icon(Icons.settings)),
//           ],
//         ),
//         body: TabBarView(
//           children: [
//             Center(
//               child: Text("It's cloudy here"),
//             ),
//             Center(
//               child: Text("It's rainy here"),
//             ),
//             Center(
//               child: Text("It's sunny here"),
//             ),
//           ],
//         ),
//       ),
//     );