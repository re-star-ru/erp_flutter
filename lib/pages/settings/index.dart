import 'package:flutter/material.dart';
import 'package:test_flutter/components/layout.dart';
import 'package:test_flutter/pages/settings/view.dart';

class SettingsSelector extends LayoutSelector {
  @override
  Widget phone({String? id}) {
    return SettingsView();
  }

  @override
  Widget pc({String? id}) {
    return SettingsView();
  }
}
