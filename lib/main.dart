import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/components/barcode.dart';
import 'package:test_flutter/repo/search/search.dart';
import 'package:test_flutter/pages/settings/view.dart';
import 'package:test_flutter/pages/sku_info/overlay/overlay.dart';
import 'package:test_flutter/pages/sku_info/sku_cubit.dart';
import 'package:test_flutter/layout_router.dart';

void main() {
  runApp(const BlocMyApp());
}

class BlocMyApp extends StatelessWidget {
  const BlocMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
        BlocProvider<BarcodeCubit>(
          create: (context) => BarcodeCubit(),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(),
        ),
        BlocProvider<SkuCubit>(
          create: (context) => SkuCubit(),
        ),
        BlocProvider<OverlayCubit>(
          create: (context) => OverlayCubit(),
        ),
      ],
      child: const FocusMyApp(),
    );
  }
}

class FocusMyApp extends StatelessWidget {
  const FocusMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) {
          return KeyEventResult.ignored;
        }

        context.read<BarcodeCubit>().keyEvent(event);

        return KeyEventResult.ignored;
      },
      child: LayoutRouter(),
    );
  }
}
