import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

// Cart class ကို ChangeNotifier နဲ့ သုံးထားပါတယ်
class Cart with ChangeNotifier {
  // _items ဆိုတာက cart ထဲမှာရှိတဲ့ item တွေကို သိမ်းထားတဲ့ map ပါ
  Map<String, CartItem> _items = {};
  // removed final *** for clear function ***

  // items getter က _items ကို ပြန်ပေးပါတယ်၊ spread operator နဲ့ copy လုပ်ပေးပါတယ်
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // addItem method က productId, title, price ကိုယူပြီး cart ထဲထည့်ပေးပါတယ်
  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // အကယ်၍ အရင်က ရှိပြီးသား item ဖြစ်ရင် quantity ကို တစ်ခုတိုးမယ်
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1, // quantity တစ်ခုတိုး
        ),
      );
    } else {
      // အကယ်၍ မရှိသေးရင် အသစ်ထည့်မယ်
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(), // id ကို datetime နဲ့ generate လုပ်
          title: title,
          price: price,
          quantity: 1, // quantity ကို 1 နဲ့ initialize လုပ်
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    // cart မှ item ကို ဖယ်ရှားမယ့် method
    _items.remove(productId); // productId အရ item ကို ဖယ်ရှား
    notifyListeners(); // listeners တွေကို အသိပေး
  }

  void clear() {
    _items = {}; // cart ကို အလုံးစုံ ဖယ်ရှား
    notifyListeners(); // listeners တွေကို အသိပေး
  }
}
