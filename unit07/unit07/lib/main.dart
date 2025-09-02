import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink, // replaces primarySwatch
          secondary: Colors.amber, // replaces accentColor
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(
          255,
          254,
          229,
          1,
        ), // replaces canvasColor
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            // replaces body1 → now bodyLarge/bodyMedium/bodySmall
            backgroundColor: Color.fromRGBO(255, 254, 229, 1),
          ),
          bodyMedium: const TextStyle(
            // replaces body1 → now bodyLarge/bodyMedium/bodySmall
            backgroundColor: Color.fromRGBO(255, 254, 229, 1),
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true, // enable Material 3
      ),

      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routName: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DeliMeals')),
      body: Center(child: Text('Navigation Time!')),
    );
  }
}
