import 'package:flutter/material.dart';

class AppDrawerNavLink extends StatelessWidget {
  final String resourceName;
  final String resourceTitle;
  final Widget resourceIcon;
  String activeRoute;

  AppDrawerNavLink(this.resourceName, this.resourceTitle, this.resourceIcon, this.activeRoute, {super.key});

  void _navigateToListView(String resource, BuildContext ctx) {
    print(resource);
    if (resource == '/') {
      Navigator.pushReplacementNamed(ctx, '/');
    } else {
      Navigator.pushReplacementNamed(ctx, '/list', arguments: {'resource': resource});
    }
    if (Navigator.canPop(ctx)) {
      Navigator.pop(ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: resourceIcon,
      title: Text(resourceTitle),
      onTap: () => _navigateToListView(resourceName, context),
      selected: activeRoute == resourceName,
    );
  }
}
