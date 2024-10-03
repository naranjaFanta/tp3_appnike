import 'package:appnike/database/products/products.database.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  static const String name = 'product_detail';
  final int productId;

  const ProductDetail({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final product = productsDB.firstWhere((prod) => prod.id == productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image),
            const SizedBox(height: 16),
            Text(product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description),
            const SizedBox(height: 16),
            Text('Price: \$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
