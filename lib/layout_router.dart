import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import 'package:test_flutter/home.dart';
import 'package:test_flutter/layout/desktop.dart';
import 'package:test_flutter/layout/phone.dart';
import 'package:test_flutter/pages/repair/pc/list/view.dart';
import 'package:test_flutter/pages/settings/view.dart';

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

class LayoutRouter extends StatelessWidget {
  LayoutRouter({super.key});

  final _router = GoRouter(
    routes: [
      _goRoute('/', Home()),
      _goRoute('/settings', SettingsView()),
      _goRoute('/document', const RepairListView())
    ],
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
          textTheme: Theme.of(context).textTheme.apply(
                fontSizeFactor: 1.05,
                fontSizeDelta: 1.5,
              ),
        ),
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

GoRoute _goRoute(
  String path,
  Widget body,
) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: LayoutPage(body),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}

class LayoutPage extends StatelessWidget {
  const LayoutPage(this.body, {super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = getSize(context);
      if (size == ScreenSize.pc) {
        return Scaffold(body: DesktopLayout(body));
      }

      return const Scaffold(body: MyTabBar());
    });
  }
}

enum ScreenSize { phone, pc }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > 600) return ScreenSize.pc;
  return ScreenSize.phone;
}
