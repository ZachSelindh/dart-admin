import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class UserListView extends StatelessWidget {
  static const routeName = '/users';

  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        drawer: const AppDrawer(activeRoute: UserListView.routeName),
        body: Column(children: const [
          Card(
            child: Text('Users'),
          ),
        ]));
  }
}
