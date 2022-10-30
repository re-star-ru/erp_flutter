import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import 'package:test_flutter/components/theme.dart';
import 'package:test_flutter/layouts/desktop.dart';
import 'package:test_flutter/layouts/phone.dart';
import 'package:test_flutter/pages/home/index.dart';
import 'package:test_flutter/pages/repair/index.dart';
import 'package:test_flutter/pages/settings/index.dart';
import 'components/layout.dart';

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

const rcolor = MaterialColor(0xff14213D, color);
const Map<int, Color> color = {
  50: Color.fromRGBO(20, 33, 61, .1),
  100: Color.fromRGBO(20, 33, 61, .2),
  200: Color.fromRGBO(20, 33, 61, .3),
  300: Color.fromRGBO(20, 33, 61, .4),
  400: Color.fromRGBO(20, 33, 61, .5),
  500: Color.fromRGBO(20, 33, 61, .6),
  600: Color.fromRGBO(20, 33, 61, .7),
  700: Color.fromRGBO(20, 33, 61, .8),
  800: Color.fromRGBO(20, 33, 61, .9),
  900: Color.fromRGBO(20, 33, 61, 1),
};

class LayoutRouter extends StatelessWidget {
  LayoutRouter({super.key});

  final _router = GoRouter(
    routes: [
      _goRoute('/', HomeSelector()),
      _goRoute('/repair', RepairListSelector()), // repair list
      _goRoute('/repair/:id', RepairSelector()),
      _goRoute('/settings', SettingsSelector()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkThemeCubit, bool>(builder: (context, state) {
      return MaterialApp.router(
        themeMode: context.read<DarkThemeCubit>().state
            ? ThemeMode.dark
            : ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          primarySwatch: rcolor,
        ),
        darkTheme: ThemeData.dark(useMaterial3: true),
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        }),
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      );
    });
  }
}

GoRoute _goRoute(String path, LayoutSelector selector) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: Builder(builder: (context) {
        final id = state.params['id'];
        return LayoutPage(selector, id: id);
      }),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}

class LayoutPage extends StatelessWidget {
  const LayoutPage(this.selector, {super.key, this.id});

  final String? id;
  final LayoutSelector selector;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = getSize(context);
      if (size == ScreenSize.pc) {
        return Scaffold(body: DesktopLayout(selector.pc(id: id)));
      }

      return Scaffold(body: PhoneLayout(selector.phone(id: id)));
    });
  }
}
