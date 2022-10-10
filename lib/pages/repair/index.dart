import 'package:flutter/material.dart';
import 'package:test_flutter/components/layout.dart';
import 'package:test_flutter/pages/repair/list_pc_view.dart';
import 'package:test_flutter/pages/repair/pc_view.dart';
import 'package:test_flutter/pages/repair/list_phone_view.dart';

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
