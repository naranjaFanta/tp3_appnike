import 'dart:async';
import 'package:appnike/presentation/providers/cart_provider.dart';
import 'package:appnike/presentation/screens/payments/payment_confirmation_screen.dart';
import 'package:appnike/presentation/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  static const String name = 'payment_process';
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  void initState() {
    super.initState();
    // Temporizador de 3 segundos para simular el procesamiento del pago
    Timer(const Duration(seconds: 3), () {
      final _cartProvider = context.read<CartProvider>();
      _cartProvider.emptyCart();
      context.go('/payment_confirmation');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: 
          Text(
            'Procesando el pago...',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
      ),
    );
  }
}
