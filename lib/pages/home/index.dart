import 'package:test_flutter/components/layout.dart';
import 'package:test_flutter/pages/home/pc_view.dart';
import 'package:test_flutter/pages/home/phone_view.dart';

class HomeSelector extends LayoutSelector {
  @override
  pc({String? id}) {
    return HomePC();
  }

  @override
  phone({String? id}) {
    return HomePhone();
  }
}
