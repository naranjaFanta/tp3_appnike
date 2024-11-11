import 'package:appnike/domain/discounts/coupon.dart';
import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  final Coupon discount;
  final bool isUsed;
  final VoidCallback onUse;

  const DiscountCard({
    super.key,
    required this.discount,
    required this.isUsed,
    required this.onUse,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isUsed) {
          onUse();
        }
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(5),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    discount.code,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text('Descuento del ${discount.discountPercent}%'),
                ),
              ],
            ),
            if (isUsed)
              const Positioned(
                right: 8,
                top: 8,
                child: Icon(Icons.block, color: Colors.red),
              ),
            if (isUsed)
              Container(
                color: Colors.grey.withOpacity(0.5),
                alignment: Alignment.center,
                child: const Center(
                  child: Text(
                    'No disponible',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
