import 'package:flutter/material.dart';

import '../screens/products_detail_screen.dart';

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
    // final productID = ModalRoute.of(context)?.settings.arguments as String;
    // //...
    return ClipRRect(
      // အနားလေးတွေ ဝိုင်းစေဖို့ ClipRRect သုံး
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GestureDetector(
          // footer ကို နှိပ်လိုက်ရင် အလုပ်လုပ်ဖို့ Detail Screen ကို ပို့မယ်
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductsDetailScreen.routeName,
              // routeName နဲ့ လှမ်းခေါ်ပါမယ် ProductDetailScreen ကို
              // product ID ကို arguments အနေနဲ့ ပို့မယ်
              arguments: id,
            );
          },
          child: GridTileBar(
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

            // ပစ္စည်းနာမည်
          ),
        ),
        child: imageUrl != null
            ? Image.network(imageUrl, fit: BoxFit.cover)
            // ရုပ်ပုံရှိရင် ပြမယ်
            : Text('No Image'),
        // မရှိရင် ဒီစာသားကို ပြမယ်
      ),
    );
  }
}
