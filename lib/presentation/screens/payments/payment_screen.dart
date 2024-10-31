import 'dart:async';
import 'package:appnike/presentation/screens/payments/payment_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:appnike/database/discounts/coupons.database.dart';
import 'package:appnike/domain/discounts/coupon.dart';

class PaymentScreen extends StatefulWidget {
  final String userEmail;

  const PaymentScreen({super.key, required this.userEmail});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _couponController = TextEditingController();
  int originalTotalAmount = 100; // Example initial total amount
  int discountedTotalAmount = 100;
  String message = "";


  @override
  void initState() {
    super.initState();
    // Temporizador de 4 segundos para simular el procesamiento del pago
    Timer(const Duration(seconds: 12), () {
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


// Funcion para cupones
  void applyCoupon() {
    String enteredCode = _couponController.text;
    Coupon? coupon = couponDB.firstWhere(
      (c) => c.code == enteredCode && !c.isUsed,
    );

    if (coupon != null) {
      setState(() {
        double discount = (coupon.discountPercent / 100) * originalTotalAmount;
        discountedTotalAmount = originalTotalAmount - discount.toInt();
        coupon.isUsed = true; // Marca como usado o no
        message = "Cupon de ${coupon.discountPercent}% aplicado.";
      });
    } else {
      setState(() {
        message = "Cupon usado o invalido.";
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Procesando el Pago'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Procesando el pago...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Text("Total original: \$${originalTotalAmount}"),
          Text("Total con descuento: \$${discountedTotalAmount}"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _couponController,
              decoration: InputDecoration(
                labelText: "Ingresar Cupon",
                suffixIcon: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: applyCoupon,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(message, style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}