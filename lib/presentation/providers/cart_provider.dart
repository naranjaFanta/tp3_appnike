import 'package:appnike/domain/products/product.dart';
import 'package:appnike/domain/discounts/coupon.dart';
import 'package:appnike/presentation/providers/coupon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../database/discounts/coupons.database.dart';


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

  void emptyCart() {
    _cartItems.clear();
    _discountPercent = 0.0;
    notifyListeners();
  }


  bool get isEmpty => _cartItems.isEmpty;

  double get totalPriceWithoutDiscount {
    return _cartItems.fold(0.0, (sum, item) => sum + item.price);
  }

  double get totalPrice {
    return totalPriceWithoutDiscount * (1 - _discountPercent / 100);
  }

  double get discountedAmount {
    return totalPriceWithoutDiscount - (totalPriceWithoutDiscount * (1 - _discountPercent / 100));
  }

  void applyDiscount(BuildContext context, String discountCode) {
    final couponProvider = Provider.of<CouponProvider>(context, listen: false);
    final isCouponValid = couponProvider.applyCouponIfValid(discountCode);
    
    if (isCouponValid) {
      _discountPercent = couponProvider.getCouponDiscount(discountCode);
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cupón inválido o ya utilizado")),
      );
    }
  }
}
//