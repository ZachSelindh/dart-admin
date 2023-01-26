import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = '/';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: AppDrawer(DashboardScreen.routeName),
      body: const Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
