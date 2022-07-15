import 'package:auto_updater/auto_updater.dart';
import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import 'package:logger/logger.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          color: Colors.amber.shade100,
          child: const NavBar(),
        ),
        Expanded(child: child),
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NavBtn(
          const Icon(Icons.search, color: Colors.black),
          () => context.go('/'),
        ),
        const SizedBox(height: 10),
        NavBtn(
          const Icon(Icons.receipt, color: Colors.black),
          () => context.go('/document'),
        ),
        const SizedBox(height: 30),
        NavBtn(
          const Icon(Icons.update, color: Colors.black),
          () async {
            Logger().i("Update button pressed");

            String feed = 'http://localhost:5000/appcast.xml';
            AutoUpdater.instance.setFeedURL(feed);
            AutoUpdater.instance.checkForUpdates(inBackground: true);
            // autoUpdater.setFeedURL(feed);
            // awaut autoUpdater.checkForUpdates();
          },
        ),
      ],
    );
  }
}

class NavBtn extends StatelessWidget {
  const NavBtn(this.icon, this.onPressed, {super.key});

  final Icon icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[100],
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(60, 60),
      ),
      child: icon,
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 30,
          itemBuilder: (context, index) {
            return const MyTab();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 5);
          },
        ),
      ),
    );
  }
}

class MyTab extends StatelessWidget {
  const MyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[100],
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(60, 60),
      ),
      onPressed: (() => {}),
      child: const Text("Tab"),
    );
  }
}
