import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/products.dart';
import 'screens/products_detail_screen.dart';
import 'screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        /* Main အပိုင်း - App အတွက် State Management စနစ်

    Products() class ကို တစ်ခုလုံးအတွက် ရရှိအောင် လုပ်ပေးတယ်

    ဘယ် Screen ကမဆို Provider.of<Products>(context) လို့ခေါ်ရင် ဒီက Products() object ကို ရမယ်
        */
        title: 'MyShop',
        theme: ThemeData(
          // App ရဲ့ အပြင်အဆင် Design
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.cyan, // အဓိက အရောင်
            secondary: Colors.amber, // ဒုတိယ အရောင်
            primaryContainer: Colors.pink.shade50, // contrainer အရောင်
          ),
          fontFamily: 'Lato', // default font
          useMaterial3: true, // Material 3 design ကို အသုံးပြုမယ်
        ),
        home: ProductsOverviewScreen(), //ပထမဆုံး ပြသမယ့် Screen
        routes: {
          // Navigation အတွက် route mapping
          // ProductsDetailScreen.routeName (/product-detail) လို့ခေါ်ရင် ProductsDetailScreen() ကို ပြမယ်
          ProductsDetailScreen.routeName: (ctx) => ProductsDetailScreen(),
        },
      ),
    );
  }
}
