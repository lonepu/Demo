import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  // const CartItem({super.key});

  final String id;
  final String productID;
  final double price;
  final int quantity;
  final String title;

  const CartItem(
    this.id,
    this.productID,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // item ကို swipe လုပ်ပြီး ဖယ်ရှားနိုင်ဖို့ Dismissible widget ကို သုံးထားပါတယ်
      key: ValueKey(id), // Dismissible အတွက် unique key
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productID);
      }, // Dismissed အခါမှာ လုပ်ဆောင်မယ့် function
      direction: DismissDirection.endToStart, // right to left ကိုသာ ခွင့်ပြုမယ်
      confirmDismiss: (direction) {
        // Dismiss လုပ်မယ့်အခါမှာ confirm dialog ပြမယ်
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to remove the item from the cart?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false); // Dismiss မလုပ်ဘူး
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true); // Dismiss လုပ်မယ်
                },
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      background: Container(
        // Dismissible အတွက် background
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Icon(Icons.delete, color: Colors.white, size: 40),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(child: Text('\$$price')),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
