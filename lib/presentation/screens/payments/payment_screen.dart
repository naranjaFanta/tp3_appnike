import 'dart:async';
import 'package:appnike/domain/purchases/purchase.dart';
import 'package:appnike/presentation/providers/cart_provider.dart';
import 'package:appnike/presentation/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appnike/presentation/providers/purchase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appnike/database/purchases/purchases.database.dart';
import 'package:uuid/uuid.dart';

class PaymentScreen extends ConsumerWidget {
  static const String name = 'payment_process';
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _purchaseProvider = ref.read(purchaseProvider.notifier);
    final _cartProvider = ref.watch(cartProvider.notifier);
    final cartState = ref.watch(cartProvider);
    
    void processPayment() {
      List<String> items = _cartProvider.getProductsNames();
      double totalAmount = _cartProvider.totalPrice;

      final newPurchase = Purchase(
        id: const Uuid().v4(),
        userEmail: ref.read(userProvider).email,
        date: Timestamp.now(),
        items: items,
        totalAmount: totalAmount,
      );

      purchaseDB.add(newPurchase);
      //TODO agregar a firestore
      _purchaseProvider.addPurchase(items, totalAmount, ref);

      _cartProvider.emptyCart();

      context.go('/payment_confirmation');
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
          const SizedBox(height: 20),
          Text("Total original: \$${cartState.fold(0.0, (sum, item) => sum + item.price)}"),
          Text("Total con descuento: \$${cartState.fold(0.0, (sum, item) => sum + item.price) * (1 - _cartProvider.discountedAmount / 100)}"),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}




    

