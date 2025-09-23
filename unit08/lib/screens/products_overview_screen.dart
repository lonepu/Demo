import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyShop')),
      // body ထဲမှာ ProductsGrid widget ကို ခေါ်သုံးမယ်
      body: ProductsGrid(),
    );
  }
}
