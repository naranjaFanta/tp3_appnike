import 'dart:async';

import 'package:appnike/domain/purchases/purchase.dart';
import 'package:appnike/presentation/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final AsyncNotifierProvider<PurchaseNotifier, List<Purchase>> purchaseProvider = AsyncNotifierProvider<PurchaseNotifier, List<Purchase>>(PurchaseNotifier.new);

class PurchaseNotifier extends AsyncNotifier<List<Purchase>> {
  final db = FirebaseFirestore.instance;
  late final CollectionReference _purchaseRef;

  @override
  Future<List<Purchase>> build() async {
    _purchaseRef = db.collection('compras').withConverter<Purchase>(
      fromFirestore: (snapshot, _) => Purchase.fromJson(snapshot.data()!), 
      toFirestore: (purchase, _) => purchase.toJson()
    );
    
    return getAllPurchases();
  }

  Future<List<Purchase>> getAllPurchases () async {
    var data = await db.collection('compras').withConverter<Purchase>(
      fromFirestore: (snapshot, _) => Purchase.fromJson(snapshot.data()!), 
      toFirestore: (purchase, _) => purchase.toJson()
    ).get();
    
    final allData = data.docs.map((doc) => doc.data()).toList();

    return allData;

  }

  addPurchase(List<String> items, double totalAmount, WidgetRef ref) {
    final newPurchase = Purchase(
      id: const Uuid().v4(),
      userEmail: ref.read(userProvider).email,
      date: Timestamp.now(),
      items: items,
      totalAmount: totalAmount,
    );
    //state.add(newPurchase);
    
    _purchaseRef
      .doc()
      .set(newPurchase)
      .onError((e, _) => print("ERROR en el proceso de compra: ${newPurchase.toString()}"));
  }

}