import 'dart:async';

import 'package:appnike/domain/purchases/purchase.dart';
import 'package:appnike/presentation/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final AsyncNotifierProvider<PurchaseNotifier, List<Purchase>> purchaseProvider = AsyncNotifierProvider<PurchaseNotifier, List<Purchase>>(PurchaseNotifier.new);

class PurchaseNotifier extends AsyncNotifier<List<Purchase>> {
  final db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  late final CollectionReference _purchaseRef = db.collection('compras').withConverter<Purchase>(
    fromFirestore: (snapshot, _) => Purchase.fromJson(snapshot.data()!), 
    toFirestore: (purchase, _) => purchase.toJson()
  );

  @override
  Future<List<Purchase>> build() async {
    return getCurrentUserPurchases();
  }

  Future<List<Purchase>> getAllPurchases () async {
    var data = await db.collection('compras').withConverter<Purchase>(
      fromFirestore: (snapshot, _) => Purchase.fromJson(snapshot.data()!), 
      toFirestore: (purchase, _) => purchase.toJson()
    ).get();
    final allData = data.docs.map((doc) => doc.data()).toList();

    return allData;

  }

  Future<List<Purchase>> getCurrentUserPurchases () async {
    final User? user = auth.currentUser;

    var data = await db.collection('compras')
    .where("userEmail", isEqualTo: user?.email)
    .withConverter<Purchase>(
      fromFirestore: (snapshot, _) => Purchase.fromJson(snapshot.data()!), 
      toFirestore: (purchase, _) => purchase.toJson()
    ).get();
    
    return data.docs.map((doc) => doc.data()).toList();
  }

  addPurchase(List<String> items, double totalAmount, WidgetRef ref) {
    final newPurchase = Purchase(
      id: const Uuid().v4(),
      userEmail: ref.read(userProvider).email,
      date: Timestamp.now(),
      items: items,
      totalAmount: totalAmount,
    );
    state.value!.add(newPurchase);
    _purchaseRef
      .doc()
      .set(newPurchase)
      .onError((e, _) => print("ERROR en el proceso de compra: ${newPurchase.toString()}"));
  }

}