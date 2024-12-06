import 'package:flutter/material.dart';
import 'package:shop_animation/models/Product.dart';

class Products with ChangeNotifier {
  final List<Product> _products = List.generate(
    1000,
    (index) => Product(id: index.toString(), name: 'Product $index'),
  );

  List<Product> get products => [..._products];

  Product getById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    notifyListeners();
  }

  void updateCounts() {
    notifyListeners();
  }
}
