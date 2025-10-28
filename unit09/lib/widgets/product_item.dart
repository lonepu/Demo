import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/products_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem({
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl,
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    //...
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
              arguments: product.id,
            );
          },
          child: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  product.toggleFavouriteStatus();

                  // Handle favorite toggle
                },
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.title, product.price);
                // Handle add to cart action
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  // Show a snackbar when item is added to cart
                  SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text(
                      textAlign: TextAlign.center,
                      'Added item to cart!',
                    ),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      },
                    ),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(product.title, textAlign: TextAlign.center),

            // ပစ္စည်းနာမည်
          ),
        ),
        child: Image.network(product.imageUrl, fit: BoxFit.cover),
        // ရုပ်ပုံရှိရင် ပြမယ်
      ),
    );
  }
}
