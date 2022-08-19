import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _key,
      children: const [Text("CONFIGS")],
    );
  }
}

class SettingsCubit extends Cubit<Settings> {
  SettingsCubit() : super(Settings("localhost:3000"));
}

class Settings {
  Settings(this.basepath);

  final String basepath;
}
