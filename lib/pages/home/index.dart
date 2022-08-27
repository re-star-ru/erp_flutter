import 'package:test_flutter/components/layout.dart';
import 'package:test_flutter/pages/home/pc/view.dart';
import 'package:test_flutter/pages/home/phone/view.dart';

class HomeSelector extends LayoutSelector {
  @override
  pc() {
    return HomePC();
  }

  @override
  phone() {
    return HomePhone();
  }
}
