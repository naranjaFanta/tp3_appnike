import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appnike/presentation/providers/coupon_provider.dart';
import 'package:appnike/presentation/components/discounts/discount_card.dart';

class DiscountsScreen extends ConsumerWidget {
  static const String name = 'discounts';

  const DiscountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Descuentos")),
      body: ListView.builder(
        itemCount: ref.read(couponProvider).length,
        itemBuilder: (context, index) {
          final coupon = ref.read(couponProvider)[index];
          return DiscountCard(
            discount: coupon,
            isUsed: coupon.isUsed,
            onUse: () {
              if (!coupon.isUsed) {
                ref.read(couponProvider.notifier).useCoupon(coupon.code);
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
//