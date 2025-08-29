import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({super.key});
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/categories',
      arguments: {'id': id, 'title': title},
      // MaterialPageRoute(
      //   builder: (_) {
      //     return CategoryMealsScreen(id, title);
      //     //ထုတ်ချင်တာကို push နဲ့ ထုတ်ပြီး ပြပါတယ်
      //     //android မလို့ MaterialPageRoute ကိုသုံးတယ်
      //     //builder မပါမဖြစ် constructor name မပေးလဲ ဖြစ်တာမလို့
      //     //(_) ပဲပေးပြီ return  ကို CategoryMealsScreen() ပြန်တယ်
      //   },
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
