import 'package:appnike/database/discounts/discounts.database.dart';
import 'package:appnike/domain/discounts/discount.dart';
import 'package:appnike/presentation/components/discounts/discount_card.dart';
import 'package:flutter/material.dart';

class DiscountsScreen extends StatelessWidget {
  static const String name = 'discounts';
  DiscountsScreen({super.key});
  final List<Discount> discounts = discountDB;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discounts Screen'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: discounts.length,
        itemBuilder: (context, index) {
          final discount = discounts[index];
          return DiscountCard(discount: discount);
        },
      ),
    );
  }
}
