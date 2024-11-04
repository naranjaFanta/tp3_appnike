import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appnike/presentation/providers/coupon_provider.dart';
import 'package:appnike/presentation/components/discounts/discount_card.dart';

class DiscountsScreen extends StatelessWidget {
  static const String name = 'discounts';

  @override
  Widget build(BuildContext context) {
    final couponProvider = Provider.of<CouponProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Descuentos")),
      body: ListView.builder(
        itemCount: couponProvider.coupons.length,
        itemBuilder: (context, index) {
          final coupon = couponProvider.coupons[index];
          return DiscountCard(
            discount: coupon,
            isUsed: coupon.isUsed,
            onUse: () {
              if (!coupon.isUsed) {
                couponProvider.useCoupon(coupon.code);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Cupón ${coupon.code} usado.")),
                );
              }
            },
          );
        },
      ),
    );
  }
}
