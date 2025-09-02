import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final categoryTitle = routeArgs?['title'];
    final categoryId = routeArgs?['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    print(categoryTitle);
    //ဒီအပိုင်းက တော်တော်လေး နားလည်ရခက်ပါတယ် နားမလည်သေးပါ ModalRoute ကို နားမလည်
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ), //‌as String က ကိုယ့်ဘာသာကိုယ်ထည့်တာပါ error တက်နေလို့ပါ
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
