import 'package:flutter/material.dart';
import 'package:appnike/domain/purchases/purchase.dart';
import 'package:uuid/uuid.dart';

class PurchaseProvider with ChangeNotifier {
  List<Purchase> _purchases = List.from(purchaseDB);

  List<Purchase> get purchases => _purchases;

  void addPurchase(List<String> items, double totalAmount) {
    final newPurchase = Purchase(
      id: const Uuid().v4(),
      date: DateTime.now(),
      items: items,
      totalAmount: totalAmount,
    );

    _purchases.add(newPurchase);
    notifyListeners();
  }
}//