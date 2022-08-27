import 'package:flutter/widgets.dart';

abstract class LayoutSelector {
  Widget pc();
  Widget phone();
}

enum ScreenSize { phone, pc }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > 600) return ScreenSize.pc;
  return ScreenSize.phone;
}
