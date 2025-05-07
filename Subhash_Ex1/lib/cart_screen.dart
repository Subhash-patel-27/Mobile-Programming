import 'package:flutter/material.dart';
import 'cart.dart';
import 'order.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void handleCheckout() {
    if (Cart.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Your bag is empty!")),
      );
      return;
    }

    OrderManager.placeOrder(Cart.items);
    setState(() => Cart.items.clear());

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text("Order Placed!"),
        content: Text("Your order has been successfully placed."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Cart.items;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Bag"),
      ),
      body: cart.isEmpty
          ? Center(child: Text("Your bag is empty."))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (_, index) {
                final item = cart[index];
                return ListTile(
                  leading: Image.asset(item.image, width: 40),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        Cart.items.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.name} removed from bag!')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: \$${Cart.total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: handleCheckout,
                  icon: Icon(Icons.payment),
                  label: Text("Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
