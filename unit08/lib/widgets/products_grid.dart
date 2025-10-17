import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid(this.showFavs, {super.key});
  @override
  Widget build(BuildContext context) {
    // provider ကနေ products data တွေကို ယူမယ်

    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // တစ်ကြောင်းမှာ item ၂ ခု
        childAspectRatio: 3 / 2, // အလျား/အနံ အချိုး
        crossAxisSpacing: 10, //ဘေးချင်း ခြားနေမယ့် အကွာအဝေး
        mainAxisSpacing: 10, // အပေါ်-အောက် ခြားနေမယ့် အကွာအဝေး
      ),
      padding: const EdgeInsets.all(10.0),

      // အကွက်တစ်ခုလုံးကို padding ပေးမယ်
      itemCount: products.length,

      // item တွေရဲ့ အရေအတွက်
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
          //itemBuilder မှာ product တစ်ခုချင်းစီအတွက် ProductItem widget ကို ခေါ်သုံးပြီး data တွေ ထည့်ပေးတယ်။
          // id: products[i].id,
          // title: products[i].title,
          // imageUrl: products[i].imageUrl,
        ),
      ),
    );
  }
}
