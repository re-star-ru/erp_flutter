import 'package:flutter/material.dart';
import 'package:test_flutter/components/layout.dart';
import 'package:test_flutter/pages/repair/pc/list/list_view.dart';
import 'package:test_flutter/pages/repair/pc/list/view.dart';
import 'package:test_flutter/pages/repair/phone/list/view.dart';

class RepairSelector extends LayoutSelector {
  @override
  Widget pc({String? id}) {
    if (id == null) {
      return ErrorWidget.withDetails(message: "wtf, id not found");
    }

    return RepairViewPC(id);
  }

  @override
  Widget phone({String? id}) {
    return Stack();
  }
}

class RepairListSelector extends LayoutSelector {
  @override
  Widget pc({String? id}) {
    return const RepairListViewPC();
  }

  @override
  Widget phone({String? id}) {
    return const RepairListViewPhone();
  }
}
