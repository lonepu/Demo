import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';
import 'providers/products.dart';
import 'screens/cart_screen.dart';
import 'screens/products_detail_screen.dart';
import 'screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Products Provider ကို App တစ်လုံးလုံးအတွက် ထည့်သွင်းထားပါတယ်
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          // App ရဲ့ Theme အပြင်အဆင်
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.cyan, // အဓိက အရောင်
            secondary: Colors.amber, // ဒုတိယ အရောင်
            primaryContainer: Colors.pink.shade50, // container အရောင်
          ),
          fontFamily: 'Lato', // default font
          useMaterial3: true, // Material 3 design ကို အသုံးပြုမယ်
        ),
        home: ProductsOverviewScreen(), // ပထမဆုံး ပြသမယ့် Screen
        routes: {
          // Screen တစ်ခုမှ တစ်ခုသို့ သွားရန် Route တွေ သတ်မှတ်ထားပါတယ်
          ProductsDetailScreen.routeName: (ctx) => ProductsDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
