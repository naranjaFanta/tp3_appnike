import 'package:flutter/material.dart';

class DiscountsScreen extends StatelessWidget {
  static const String name = 'discounts';
  const DiscountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discounts Screen'),
      ),
      body: const Center(child: Text('Discounts Screen')),
    );
  }
}
