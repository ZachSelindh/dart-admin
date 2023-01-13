import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
