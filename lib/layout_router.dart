import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import 'package:test_flutter/layout/desktop.dart';
import 'package:test_flutter/layout/phone.dart';
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
