import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget with PreferredSizeWidget {
  const AppDrawer({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var _activeRoute = '/';

  void _navigate(String navTarget, BuildContext ctx) {
    setState(() {
      _activeRoute = navTarget;
    });
    Navigator.of(ctx).pushReplacementNamed(navTarget);
    if (Navigator.canPop(ctx)) {
      Navigator.pop(ctx);
    }
  }

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
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => _navigate('/', context),
            selected: _activeRoute == '/',
          ),
          ListTile(
            leading: const Icon(Icons.person_off_outlined),
            title: const Text('Users'),
            onTap: () => _navigate('/users', context),
            selected: _activeRoute == '/users',
          ),
        ],
      ),
    );
  }
}
