import 'package:flutter/material.dart';

import './app_drawer_nav_link.dart';

class AppDrawer extends StatefulWidget with PreferredSizeWidget {
  final String activeRoute;

  const AppDrawer(this.activeRoute, {super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  static const List<Map<String, dynamic>> resourcesArray = [
    {'name': '/', 'title': 'Home', 'icon': Icon(Icons.home)},
    {'name': 'users', 'title': 'Users', 'icon': Icon(Icons.person_off_outlined)}
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AppBar(
            title: const Text("Drawer"),
            automaticallyImplyLeading: false,
          ),
          ...resourcesArray.map(
            (res) => AppDrawerNavLink(res['name'], res['title'], res['icon'], widget.activeRoute),
          ),
        ],
      ),
    );
  }
}
