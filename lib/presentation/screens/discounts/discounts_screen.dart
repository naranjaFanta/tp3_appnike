import 'package:appnike/database/discounts/coupons.database.dart';
import 'package:appnike/presentation/components/discounts/discount_card.dart';
import 'package:flutter/material.dart';

class DiscountsScreen extends StatefulWidget {
  static const String name = 'discounts';
  @override
  _DiscountsScreenState createState() => _DiscountsScreenState();
}

class _DiscountsScreenState extends State<DiscountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Descuentos")),
      body: ListView.builder(
        itemCount: couponDB.length,
        itemBuilder: (context, index) {
          final coupon = couponDB[index];
          return DiscountCard(
            discount: coupon,
            isUsed: coupon.isUsed,
            onUse: () {
              if (!coupon.isUsed) {
                setState(() {
                  coupon.isUsed = true; // Marca el cupón como usado
                });
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
