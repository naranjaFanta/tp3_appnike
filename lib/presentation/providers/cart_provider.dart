import 'package:appnike/domain/products/product.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }
    void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  bool get isEmpty => _cartItems.isEmpty;
}
