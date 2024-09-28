import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  static const String name = 'product_detail';
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: const Center(child: Text('Product Detail')),
    );
  }
}
