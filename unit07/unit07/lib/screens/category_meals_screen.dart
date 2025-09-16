import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = ''; // Initial vlaue is I have given that to skip error
  List<Meal> displayedMeals =
      []; // Initial vlaue is I have given that to skip error
  var _loaderInitiData = false;

  @override
  void initState() {
    super.initState();
    //... not used now
  }

  @override
  void didChangeDependencies() {
    if (!_loaderInitiData) {
      super.didChangeDependencies();
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments
              as Map<String, String>?; // error မတတ်ရန် ? လေးထည့်ခဲ့ရ
      categoryTitle = routeArgs?['title'] as String; // difference from Tutorial
      final categoryId = routeArgs?['id']; // difference from Tutorial
      displayedMeals = widget.availableMeals.where((meal) {
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
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
