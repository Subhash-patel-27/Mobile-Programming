import 'product.dart';

class Order {
  final List<Product> items;
  final DateTime time;

  Order({required this.items, required this.time});
}

class OrderManager {
  static final List<Order> orders = [];

  static void placeOrder(List<Product> items) {
    orders.add(Order(items: List.from(items), time: DateTime.now()));
  }

  static List<Order> get all => orders;
}
