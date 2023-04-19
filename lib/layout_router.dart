// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter/gestures.dart';
// import 'package:mobx/mobx.dart';
// import 'package:test_flutter/components/theme.dart';
// import 'package:test_flutter/layouts/desktop.dart';
// import 'package:test_flutter/layouts/phone.dart';
// import 'package:test_flutter/pages/home/index.dart';
// import 'package:test_flutter/pages/repair/index.dart';
// import 'package:test_flutter/pages/settings/index.dart';
// import 'package:test_flutter/router/pc.dart';
// import 'package:test_flutter/components/mycolors.dart';
// import 'components/layout.dart';

// final isDark = Observable(false);

// class Layout extends StatelessWidget {
//   const Layout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DarkThemeCubit, bool>(builder: (context, state) {
//       return LayoutBuilder(builder: (context, constrains) {
//         if (constrains.maxWidth > 600) {
//           // pc layout
//           return PCRouter(isDark: state);
//         } else {
//           // phone layout
//           return SizedBox();
//         }
//       });
//     });
//   }
// }
