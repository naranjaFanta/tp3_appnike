import 'package:appnike/database/discounts/coupons.database.dart';
import 'package:appnike/domain/discounts/coupon.dart';
import 'package:flutter/material.dart';

class CouponProvider with ChangeNotifier {
  List<Coupon> _coupons = List.from(couponDB); // Crea una copia de los cupones iniciales

  List<Coupon> get coupons => _coupons;

  void useCoupon(String code) {
    // Encuentra el cupón por código y márcalo como usado
    final couponIndex = _coupons.indexWhere((c) => c.code == code);
    if (couponIndex != -1 && !_coupons[couponIndex].isUsed) {
      _coupons[couponIndex].isUsed = true;
      notifyListeners(); // Notifica a los listeners para actualizar la UI
    }
  }

  bool applyCouponIfValid(String code) {
    final couponIndex = _coupons.indexWhere((c) => c.code == code);
    
    if (couponIndex != -1 && !_coupons[couponIndex].isUsed) {
      _coupons[couponIndex].isUsed = true;
      notifyListeners(); // Notificar cambios en el estado de los cupones
      return true; // El cupón es válido y fue aplicado exitosamente
    }
    return false; // El cupón es inválido o ya ha sido usado
  }

  double getCouponDiscount(String code) {
    final coupon = _coupons.firstWhere(
      (c) => c.code == code,
      orElse: () => Coupon(code: 'invalid', discountPercent: 0), // Devuelve un cupón no válido
    );
    return coupon.discountPercent.toDouble(); // Convertir a double antes de devolver
  }
}
