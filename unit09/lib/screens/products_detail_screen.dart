import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductsDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;
  // const ProductsDetailScreen(this.title, this.price, {super.key});
  static const routeName = '/product-detail';
  // Route နာမည်

  const ProductsDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Navigate ကနေ ပြန်ပို့လာတဲ့ product ID ကို လက်ခံယူမယ်
    final productID = ModalRoute.of(context)?.settings.arguments as String;
    // ModalRoute ကနေ arguments အနေနဲ့ လာမယ့် product ID ကိုဖမ်းယူမယ်

    // Provider ကနေ product ID နဲ့ ကိုက်တဲ့ product ကို ရှာမယ်
    final loadedProduct = Provider.of<Products>(
      context,
    ).items.firstWhere((prod) => prod.id == productID);

    return Scaffold(
      // AppBar မှာ product title ကို ပြမယ်
      appBar: AppBar(title: Text(loadedProduct.title)),

      // body ထဲမှာ နောက်ထပ် UI တွေ ထည့်သွားမယ်
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
