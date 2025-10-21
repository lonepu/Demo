import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart'
    as ord; // Import Orders provider as ord to avoid name conflict

class OrderItem extends StatelessWidget {
  final ord.OrderItems order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            // Display total amount of the order
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm ').format(order.dateTime),
              // Format date and time using package:intl
            ),
            trailing: IconButton(
              onPressed: () {},
              // Function when pressed to expand/collapse order details
              icon: Icon(Icons.expand_more),
              // Icon can be changed to expand_less when expanded
            ),
          ),
        ],
      ),
    );
  }
}
