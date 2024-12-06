import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  bool watched = false;

  Product({required this.id, required this.name});

  void toggleWatched() {
    watched = !watched;
    notifyListeners();
  }
}
