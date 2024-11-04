import 'dart:async';
import 'package:appnike/presentation/screens/payments/payment_confirmation_screen.dart';
import 'package:appnike/presentation/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    // Temporizador de 12 segundos para simular el procesamiento del pago
    Timer(const Duration(seconds: 5), () => context.go('/payment_confirmation'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procesando el Pago'),
      ),
      body: const Center(
        child: Text(
          'Procesando el pago...',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
