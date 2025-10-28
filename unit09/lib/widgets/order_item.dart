import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import '../providers/orders.dart'
    as ord; // Import Orders provider as ord to avoid name conflict

class OrderItem extends StatefulWidget {
  final ord.OrderItems order;

  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            // Display total amount of the order
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm ').format(widget.order.dateTime),
              // Format date and time using package:intl
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              // Function when pressed to expand/collapse order details
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              // Icon can be changed to expand_less when expanded
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 100, 180),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${prod.quantity}x \$${prod.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
