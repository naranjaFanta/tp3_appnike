import 'package:appnike/domain/discounts/discount.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiscountCard extends StatelessWidget {
  final Discount discount;

  const DiscountCard({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/discounts/${discount.id}');
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              discount.image,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(
                discount.business,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(discount.type),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${discount.regular}%',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  const Text('|',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  Text(
                    '${discount.premium}%',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
