import 'package:flutter/material.dart';

import './screens/dashboard.dart';

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
      home: const Dashboard(),
      routes: {
        // ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        // CartScreen.routeName: (ctx) => CartScreen(),
        // OrdersScreen.routeName: (ctx) => OrdersScreen(),
        // UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        // EditProductScreen.routeName: (ctx) => EditProductScreen(),
      },
    );
  }
}
