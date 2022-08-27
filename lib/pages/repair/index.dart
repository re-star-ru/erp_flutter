import 'package:flutter/material.dart';
import 'package:test_flutter/components/layout.dart';
import 'package:test_flutter/pages/repair/pc/list/view.dart';
import 'package:test_flutter/pages/repair/phone/list/view.dart';

class RepairSelector extends LayoutSelector {
  @override
  Widget pc() {
    return Stack();
  }

  @override
  Widget phone() {
    return Stack();
  }
}

class RepairListSelector extends LayoutSelector {
  @override
  Widget pc() {
    return const RepairListViewPC();
  }

  @override
  Widget phone() {
    return const RepairListViewPhone();
  }
}
