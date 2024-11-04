import 'package:appnike/domain/products/product.dart';
import 'package:appnike/domain/discounts/coupon.dart';
import 'package:appnike/presentation/providers/coupon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Asegúrate de que este import esté presente
import '../../database/discounts/coupons.database.dart';
// Importa tu CouponProvider

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];
  double _discountPercent = 0.0;
  String? _lastAppliedCouponCode;

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

  // Precio total con descuento aplicado
  double get totalPrice {
    return totalPriceWithoutDiscount * (1 - _discountPercent / 100);
  }

  // Aplicar descuento basado en el código ingresado
  void applyDiscount(BuildContext context, String discountCode) {
    final couponProvider = Provider.of<CouponProvider>(context, listen: false);

    // Verificar si el cupón es válido y no ha sido usado
    final isCouponValid = couponProvider.applyCouponIfValid(discountCode);
    
    if (isCouponValid) {
      // Lógica para aplicar el descuento al total en CartProvider
      _discountPercent = couponProvider.getCouponDiscount(discountCode); // Asegúrate de guardar el descuento
      notifyListeners(); // Notifica a los listeners de que el total ha cambiado
    } else {
      // Mostrar mensaje si el cupón no es válido o ya está usado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cupón inválido o ya utilizado")),
      );
    }
  }
}
