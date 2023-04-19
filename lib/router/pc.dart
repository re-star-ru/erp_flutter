import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/components/mycolors.dart';
import 'package:test_flutter/components/theme.dart';
import 'package:test_flutter/layouts/desktop.dart';
import 'package:test_flutter/pages/home/pc_view.dart';

class PCRouter extends StatelessWidget {
  PCRouter({super.key, required this.isDark});

  final bool isDark;

  final _router = GoRouter(
    routes: [
      _goRoute('/', Home()),
      // _goRoute('/repair', RepairListSelector()), // repair list
      // _goRoute('/repair/:id', RepairSelector()),
      // _goRoute('/settings', SettingsSelector()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
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
  }
}

GoRoute _goRoute(String path, Widget widget) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: DesktopLayout(widget),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}
