import 'package:flutter_bloc/flutter_bloc.dart';

class DarkThemeCubit extends Cubit<bool> {
  DarkThemeCubit() : super(false);

  void toggle() {
    emit(!state);
  }
}
