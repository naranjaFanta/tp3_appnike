import 'package:appnike/database/discounts/discounts.database.dart';
import 'package:flutter/material.dart';

class DiscountDetail extends StatelessWidget {
  static const String name = 'discount_detail';
  final int discountId;

  const DiscountDetail({super.key, required this.discountId});

  @override
  Widget build(BuildContext context) {
    final discount = discountDB.firstWhere((prod) => prod.id == discountId);

    return Scaffold(
      appBar: AppBar(
        title: Text(discount.business),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network(discount.image,
                  width: 200, height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(discount.business,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(discount.description),
            const SizedBox(height: 16),
            Text('Descuento regular: ${discount.regular}%',
                style: const TextStyle(fontSize: 18)),
            Text('Descuento premium: ${discount.premium}%',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}//
