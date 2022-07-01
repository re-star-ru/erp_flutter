import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BarcodeStatus { listen, input, end }

class BarcodeCubit extends Cubit<BarcodeState> {
  BarcodeCubit()
      : super(BarcodeState(BarcodeStatus.listen, "",
            ServicesBinding.instance.currentSystemFrameTimeStamp));

  final maxDelay = 75;

  void keyEvent(KeyEvent key) {
    if (key.character == null) {
      return;
    }

    final delay = (key.timeStamp - state.timeStamp).inMilliseconds;
    final char = key.character!;

    switch (state.status) {
      case BarcodeStatus.listen:
        if (delay < maxDelay) {
          emit(BarcodeState(
            BarcodeStatus.input,
            state.text + char,
            key.timeStamp,
          ));
        } else {
          emit(BarcodeState(BarcodeStatus.listen, char, key.timeStamp));
        }

        return;

      case BarcodeStatus.input:
        if (delay < maxDelay) {
          if (key.logicalKey.keyLabel == 'Enter') {
            emit(BarcodeState(BarcodeStatus.end, state.text, key.timeStamp));
            print("Barcode: ${state.text}");
            return;
          }

          emit(BarcodeState(
            BarcodeStatus.input,
            state.text + char,
            key.timeStamp,
          ));
        } else {
          emit(BarcodeState(BarcodeStatus.listen, char, key.timeStamp));
        }

        return;

      case BarcodeStatus.end:
        emit(BarcodeState(BarcodeStatus.listen, char, key.timeStamp));
        return;
    }
  }
}

class BarcodeState {
  const BarcodeState(this.status, this.text, this.timeStamp);

  final BarcodeStatus status;
  final String text;
  final Duration timeStamp;
}
