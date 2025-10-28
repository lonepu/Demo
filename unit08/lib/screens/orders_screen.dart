import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders; // Import only Orders class
import '../widgets/order_item.dart'
    as ordw; // Import order_item.dart as ordw to avoid name conflict

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => ordw.OrderItem(
          ordersData.orders[i], // Use ordw to reference OrderItem widget
        ),
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
