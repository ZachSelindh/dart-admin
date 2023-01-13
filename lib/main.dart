import 'package:dart_admin/screens/users_list_view.dart';
import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
      routes: {
        UserListView.routeName: (ctx) => const UserListView(),
        // CartScreen.routeName: (ctx) => CartScreen(),
        // OrdersScreen.routeName: (ctx) => OrdersScreen(),
        // UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        // EditProductScreen.routeName: (ctx) => EditProductScreen(),
      },
    );
  }
}
