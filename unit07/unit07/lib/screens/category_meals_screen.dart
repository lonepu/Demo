import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = '';
  List<Meal> displayedMeals = [];
  var _loaderInitiData = false;

  @override
  void initState() {
    super.initState();
    //...
  }

  @override
  void didChangeDependencies() {
    if (!_loaderInitiData) {
      super.didChangeDependencies();
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
      categoryTitle = routeArgs?['title'] as String;
      final categoryId = routeArgs?['id'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loaderInitiData = true;
    }
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealID);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    //ဒီအပိုင်းက တော်တော်လေး နားလည်ရခက်ပါတယ် နားမလည်သေးပါ ModalRoute ကို နားမလည်
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ), //‌as String က ကိုယ့်ဘာသာကိုယ်ထည့်တာပါ error တက်နေလို့ပါ
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
