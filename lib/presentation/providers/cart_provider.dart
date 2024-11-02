import 'package:appnike/domain/products/product.dart';
import 'package:appnike/domain/discounts/coupon.dart';
import 'package:flutter/material.dart';
import '../../database/discounts/coupons.database.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];
  double _discountPercent = 0.0;
  String? _lastAppliedCouponCode; // Código del cupón aplicado más reciente

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

  // Precio total sin descuento
  double get totalPriceWithoutDiscount {
    return _cartItems.fold(0.0, (sum, item) => sum + item.price);
  }

  // Precio total con descuento
  double get totalPrice {
    return totalPriceWithoutDiscount * (1 - _discountPercent / 100);
  }

  // Aplicar descuento basado en el código ingresado
  void applyDiscount(String code) {
    // Si el código está vacío o es el mismo que el último aplicado, no hacemos nada
    if (code.isEmpty || code == _lastAppliedCouponCode) return;

    final coupon = couponDB.firstWhere(
      (c) => c.code == code,
      orElse: () => Coupon(code: '', discountPercent: 0),
    );

    // Aplicamos el descuento solo si el código es válido
    if (coupon.discountPercent > 0) {
      _discountPercent = coupon.discountPercent.toDouble();
      _lastAppliedCouponCode = code;
      notifyListeners();
    }
  }
}
