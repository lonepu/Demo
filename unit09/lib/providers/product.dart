import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavouriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
    // isFavorite status ပြောင်းလဲတာနဲ့ ဒီ Product ကို listen လုပ်ထားတဲ့ widget တွေ အားလုံး rebuild ဖြစ်မယ်
  }
}
