import 'package:flutter/material.dart';

class ProductsDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;
  // const ProductsDetailScreen(this.title, this.price, {super.key});
  static const routeName = '/product-detail';

  const ProductsDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "title",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(),
    );
  }
}
