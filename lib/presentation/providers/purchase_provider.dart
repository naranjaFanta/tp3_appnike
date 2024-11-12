import 'package:appnike/database/purchases/purchases.database.dart';
import 'package:appnike/domain/purchases/purchase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final NotifierProvider<PurchaseNotifier, List<Purchase>> purchaseProvider = NotifierProvider<PurchaseNotifier, List<Purchase>>(PurchaseNotifier.new);

class PurchaseNotifier extends Notifier<List<Purchase>> {
  @override
  build() {
    return List.from(purchaseDB);
    //Purchase(id: "dsa", date: DateTime(2, [2,3,4] as int), items: ["items"], totalAmount: 2222);
  }

  addPurchase(List<String> items, double totalAmount) {
    final newPurchase = Purchase(
      id: const Uuid().v4(),
      date: DateTime.now(),
      items: items,
      totalAmount: totalAmount,
    );

    state.add(newPurchase);
  }

}