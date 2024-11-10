import 'package:appnike/database/discounts/coupons.database.dart';
import 'package:appnike/domain/discounts/coupon.dart';
import 'package:flutter/material.dart';

class CouponProvider with ChangeNotifier {
  final List<Coupon> _coupons = List.from(couponDB); // Copia de los cupones iniciales

  List<Coupon> get coupons => _coupons;

  void useCoupon(String code) {
    final couponIndex = _coupons.indexWhere((c) => c.code == code);
    if (couponIndex != -1 && !_coupons[couponIndex].isUsed) {
      _coupons[couponIndex].isUsed = true;
      notifyListeners();
    }
  }

  bool applyCouponIfValid(String code) {
    final couponIndex = _coupons.indexWhere((c) => c.code == code);
    
    if (couponIndex != -1 && !_coupons[couponIndex].isUsed) {
      _coupons[couponIndex].isUsed = true;
      notifyListeners(); // Notifica cambios en el estado de los cupones
      return true;
    }
    return false;
  }

  double getCouponDiscount(String code) {
    final coupon = _coupons.firstWhere(
      (c) => c.code == code,
      orElse: () => Coupon(code: 'invalid', discountPercent: 0),
    );
    return coupon.discountPercent.toDouble();
  }
}
