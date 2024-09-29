import 'package:flutter/material.dart';

class DiscountDetail extends StatelessWidget {
  static const String name = 'discount_detail';
  const DiscountDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discount Detail'),
      ),
      body: const Center(child: Text('Discount Detail')),
    );
  }
}
