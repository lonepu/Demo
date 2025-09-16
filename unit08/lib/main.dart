import 'package:flutter/material.dart';

import 'screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          secondary: Colors.amber,
          primaryContainer: Colors.pink.shade50,
        ),
        fontFamily: 'Lato',
        useMaterial3: true,
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
