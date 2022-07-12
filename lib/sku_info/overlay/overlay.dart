import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverlayCubit extends Cubit<Overlay> {
  OverlayCubit() : super(Overlay(null));

  showOverlay(GlobalKey key) {
    emit(Overlay(key));
  }
}

class Overlay {
  Overlay(this._globalKey);
  final GlobalKey? _globalKey;
}

class OverlayView extends StatelessWidget {
  const OverlayView(this._rootKey, {super.key});

  final GlobalKey _rootKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverlayCubit, Overlay>(
      builder: (context, state) {
        if (state._globalKey == null) return Container();
        return WarehouseInfoOverlay(_rootKey, state._globalKey!);
      },
      // buildWhen: (previous, current) {
      //   return current._globalKey != null;
      // },
    );
  }
}

class WarehouseInfoOverlay extends StatelessWidget {
  const WarehouseInfoOverlay(this._rootKey, this.pkey, {super.key});

  final GlobalKey _rootKey;
  final GlobalKey pkey;

  @override
  Widget build(BuildContext context) {
    if (pkey.currentContext == null) {
      // Logger().d("pkey.currentContext == null");
      return Container();
    }

    if (_rootKey.currentContext == null) {
      // Logger().d("_rootKey.currentContext == null");
      return Container();
    }

    final rootBox = _rootKey.currentContext!.findRenderObject() as RenderBox;
    final rootOffset = rootBox.localToGlobal(Offset.zero);

    // Logger().d("rootOffset: $rootOffset");

    final box = pkey.currentContext!.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset(-rootOffset.dx, 0));

    final top = MediaQuery.of(context).size.height > 200 + 48 + position.dy
        ? position.dy + 40
        : position.dy - 200;

    return Positioned(
      left: position.dx,
      top: top,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[200]?.withOpacity(0.9),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        child: Column(
          children: const [
            Text("N2_2-32-A | 1 шт."),
            Text("N2_2-32-A | 1 шт."),
          ],
        ),
      ),
    );
  }
}
