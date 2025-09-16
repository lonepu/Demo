import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite_border),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              // Handle favorite toggle
            },
          ),
          trailing: IconButton(
            onPressed: () {
              // Handle add to cart action
            },
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(title, textAlign: TextAlign.center),
        ),
        child: imageUrl != null
            ? Image.network(imageUrl, fit: BoxFit.cover)
            : Text('No Image'),
      ),
    );
  }
}
