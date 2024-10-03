import 'package:appnike/domain/products/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Image.network(product.image,
                width: 50, height: 50, fit: BoxFit.cover),
            title: Text(product.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(product.description),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Price: \$${product.price.toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }
}
