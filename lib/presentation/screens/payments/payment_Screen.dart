import 'dart:async';
import 'package:appnike/presentation/screens/payments/payment_confirmation_screen.dart';
import 'package:flutter/material.dart';


class PaymentScreen extends StatefulWidget {
  final String userEmail;

  const PaymentScreen({super.key, required this.userEmail});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    // Temporizador de 4 segundos para simular el procesamiento del pago
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentConfirmationScreen(
            userEmail: widget.userEmail,
          ),
        ),
      );
    });
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
