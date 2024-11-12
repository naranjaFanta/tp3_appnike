import 'package:appnike/database/discounts/coupons.database.dart';
import 'package:appnike/domain/discounts/coupon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final NotifierProvider<CouponNotifier, List<Coupon>> couponProvider = NotifierProvider<CouponNotifier, List<Coupon>>(CouponNotifier.new);

class CouponNotifier extends Notifier<List<Coupon>> {
  @override
  build() {
    return List.from(couponDB);
  }
  
  useCoupon(String code) {
    final couponIndex = state.indexWhere((c) => c.code == code);
    if (couponIndex != -1 && !state[couponIndex].isUsed) {
      state[couponIndex].isUsed = true;
    }
  }

  bool applyCouponIfValid(String code) {
    final couponIndex = state.indexWhere((c) => c.code == code);
    
    if (couponIndex != -1 && !state[couponIndex].isUsed) {
      state[couponIndex].isUsed = true;
      return true;
    }
    return false;
  }

  double getCouponDiscount(String code) {
    final coupon = state.firstWhere(
      (c) => c.code == code,
      orElse: () => Coupon(code: 'invalid', discountPercent: 0),
    );
    return coupon.discountPercent.toDouble();
  }
}
