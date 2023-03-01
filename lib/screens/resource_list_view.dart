import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/resource_provider.dart';

import '../widgets/app_drawer.dart';

class ResourceListView extends StatelessWidget {
  static const routeName = '/list';

  const ResourceListView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      drawer: const AppDrawer(ResourceListView.routeName),
      body: FutureBuilder(
        future: Provider.of<Resource>(context, listen: false).fetchAndSetRecords(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<Resource>(
                child: const Center(
                  child: Text('No records yet!'),
                ),
                builder: (ctx, resourceRecords, ch) => resourceRecords.records.isNotEmpty
                    ? ListView.builder(
                        itemCount: resourceRecords.records.length,
                        itemBuilder: (cntx, index) => ListTile(
                          // leading: CircleAvatar(
                          //   backgroundImage: FileImage(greatPlaces.records[index].image),
                          // ),
                          title: Text(resourceRecords.records[index].content),
                          // subtitle: Text(greatPlaces.items[index].location!.address as String),
                          // onTap: () {
                          //   Navigator.of(context).pushNamed(PlaceDetailScreen.routeName, arguments: greatPlaces.items[index].id);
                          // },
                        ),
                      )
                    : ch!),
      ),
    );
  }
}
