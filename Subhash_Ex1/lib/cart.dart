import 'product.dart';

class Cart {
  static List<Product> items = [];

  static void add(Product product) {
    items.add(product);
  }

  static double get total => items.fold(0, (sum, item) => sum + item.price);
}
