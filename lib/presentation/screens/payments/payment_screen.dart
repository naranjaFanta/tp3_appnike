import 'dart:async';
import 'package:appnike/presentation/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:appnike/presentation/providers/purchase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appnike/presentation/screens/payments/payment_confirmation_screen.dart';
import 'package:appnike/database/purchases/purchases.database.dart';
import 'package:uuid/uuid.dart'; // nos deja crear un id unico


class PaymentScreen extends StatefulWidget {
  static const String name = 'payment_process';
  const PaymentScreen({super.key});

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    

    void applyCoupon() {
    String enteredCode = _couponController.text;
    Coupon? coupon = couponDB.firstWhere(
      (c) => c.code == enteredCode && !c.isUsed,
      orElse: () => null,
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

    void processPayment() {
      final purchaseProvider = ref.read(purchaseProvider.notifier);
      final cartProvider = ref.read(cartProvider);
      List<String> items = cartProvider.items.map((item) => item.name).toList(); //["Nike Air Force 1", "Adidas Ultraboost"];
      double totalAmount = cartProvider.totalAmount;

      final newPurchase = Purchase(
        id: const Uuid().v4(),
        date: DateTime.now(),
        items: items,
        totalAmount: totalAmount,
      );

      purchaseDB.add(newPurchase);
      purchaseProvider.addPurchase(items, totalAmount);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentConfirmationScreen(
            userEmail: userEmail,
          ),
        ),
      );
    }

    Timer(const Duration(seconds: 3), processPayment);

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




    

