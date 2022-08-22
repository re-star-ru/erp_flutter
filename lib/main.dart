import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter/components/barcode.dart';
import 'package:test_flutter/desk_layout.dart';
import 'package:test_flutter/home.dart';
import 'package:test_flutter/pages/repair/list/view.dart';
import 'package:test_flutter/repo/search/search.dart';
import 'package:test_flutter/pages/settings/view.dart';
import 'package:test_flutter/pages/sku_info/overlay/overlay.dart';
import 'package:test_flutter/pages/sku_info/sku_cubit.dart';

void main() {
  runApp(const BlocMyApp());
}

enum ScreenSize { phone, pc }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > 600) return ScreenSize.pc;
  return ScreenSize.phone;
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
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MyAppPage(Home()),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => MyAppPage(SettingsView()),
      ),
      GoRoute(
        path: '/document',
        builder: (context, state) => const MyAppPage(RepairListView()),
      ),
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

class MyAppPage extends StatelessWidget {
  const MyAppPage(this.body, {super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = getSize(context);
      if (size == ScreenSize.pc) {
        return Scaffold(body: DesktopLayout(body));
      }

      return const MyTabBar();
    });
  }
}

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom: const TabBar(
            labelColor: Colors.brown,
            indicatorColor: Colors.black,
            tabs: [
              Tab(icon: Icon(Icons.home_outlined)),
              Tab(icon: Icon(Icons.beach_access_sharp)),
              Tab(icon: Icon(Icons.brightness_5_sharp)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePageStateless extends StatelessWidget {
  const MyHomePageStateless({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          TextField(),
          BarcodeText(),
        ],
      ),
    );
  }
}

class BarcodeText extends StatelessWidget {
  const BarcodeText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarcodeCubit, BarcodeState>(
      builder: (context, state) {
        return Text(state.text);
      },
      buildWhen: ((prev, curr) {
        if (curr.status == BarcodeStatus.end) {
          return true;
        }

        return false;
      }),
    );
  }
}
