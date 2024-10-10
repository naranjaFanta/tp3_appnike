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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                product.image,
              ),
            ),
            const SizedBox(height: 16),
            if ((product.isNew ?? false))
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Nuevo',
                  style: TextStyle(
                    color: Color.fromARGB(255, 215, 195, 104),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            Text(product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(product.description),
            const SizedBox(height: 16),
            Text('Precio: \$${product.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Agregar al carrito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
