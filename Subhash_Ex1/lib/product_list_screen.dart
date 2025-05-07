import 'package:flutter/material.dart';
import 'product.dart';
import 'cart.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';
import 'order_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Nike Air Max 90',
      price: 99.56,
      image: 'assets/shoe1.png',
      description: 'Classic design with modern comfort. Great for casual wear.',
    ),
    Product(
      name: 'Air Jordan low 1',
      price: 137.50,
      image: 'assets/shoe2.png',
      description: 'Stylish and durable. Perfect for gym and running.',
    ),
    Product(
      name: 'Air Max Pre-Day',
      price: 200.99,
      image: 'assets/shoe3.png',
      description: 'High-performance shoe with cushioned sole and bold look.',
    ),
    Product(
      name: 'Creter Impact',
      price: 150.99,
      image: 'assets/shoe4.png',
      description: 'High-performance shoe with cushioned sole and bold look.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nike Shoe Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.receipt_long),
            tooltip: 'View Orders',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => OrderScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag),
            tooltip: 'View Cart',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        product.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        product.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
