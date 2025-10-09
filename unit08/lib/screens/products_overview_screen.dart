import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  // const ProductsOverviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // AppBar ရဲ့ အပေါ်ညာဘက်မှာ အလုပ်လုပ်မယ့် IconButton တွေ
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
            ],
          ),
        ],
        title: Text('MyShop'),
      ),
      // body ထဲမှာ ProductsGrid widget ကို ခေါ်သုံးမယ်
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
