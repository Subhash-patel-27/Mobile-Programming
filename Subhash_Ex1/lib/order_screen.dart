import 'package:flutter/material.dart';
import 'order.dart';
import 'product.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = OrderManager.all;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: orders.isEmpty
          ? Center(child: Text("No orders yet!"))
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (_, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              title: Text("Order ${index + 1}"),
              subtitle: Text("Placed on ${order.time.toLocal().toString().split('.')[0]}"),
              children: order.items.map((item) {
                return ListTile(
                  leading: Image.asset(item.image, width: 40),
                  title: Text(item.name),
                  subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
