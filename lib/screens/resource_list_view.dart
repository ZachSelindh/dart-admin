import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/resource_provider.dart';

import '../widgets/app_drawer.dart';

class ResourceListView extends StatelessWidget {
  static const routeName = '/list';

  const ResourceListView({super.key});

  // Future<void> _refreshRecords(BuildContext context) async {
  //   await Provider.of<Resource>(context, listen: false).fetchAndSetRecords();
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    print(args);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
        ),
        drawer: const AppDrawer(ResourceListView.routeName),
        body: Column(children: const [
          Card(
            child: Text('Users'),
          ),
        ]));
  }
}
