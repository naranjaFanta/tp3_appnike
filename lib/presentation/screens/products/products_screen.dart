import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const String name = 'products';
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Screen'),
      ),
      body: const Center(child: Text('Products Screen')),
    );
  }
}
