import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRoute _goRoute(String path) {
//   return GoRoute(
//     path: path,
//     pageBuilder: (context, state) => CustomTransitionPage<void>(
//       key: state.pageKey,
//       child: Builder(builder: (context) {
//         final id = state.params['id'];
//         return LayoutPage(selector, id: id);
//       }),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//           FadeTransition(opacity: animation, child: child),
//     ),
//   );
// }

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
