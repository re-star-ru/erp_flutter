import 'package:flutter/src/widgets/framework.dart';
import 'package:test_flutter/components/layout.dart';
import 'package:test_flutter/pages/settings/view.dart';

class SettingsSelector extends LayoutSelector {
  @override
  Widget pc() {
    return SettingsView();
  }

  @override
  Widget phone() {
    return SettingsView();
  }
}
