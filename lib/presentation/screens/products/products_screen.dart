import 'package:appnike/database/products/products.database.dart';
import 'package:appnike/domain/products/product.dart';
import 'package:appnike/presentation/components/products/product_card.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const String name = 'products';
  ProductsScreen({super.key});
  final List<Product> products = productsDB;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Screen'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
