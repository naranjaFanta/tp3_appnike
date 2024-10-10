import 'package:appnike/domain/products/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListProvider = StateNotifierProvider<ProductListNotifier, List<Product>>(
  (ref) => ProductListNotifier(FirebaseFirestore.instance),
);

class ProductListNotifier extends StateNotifier<List<Product>> {
  final FirebaseFirestore db;
  
  ProductListNotifier(this.db) : super([]);
  
  Future<void> addProduct(Product product) async {
    final doc = db.collection('productos').doc();
    try {
      await doc.set(product.toFirestore());
      state = [...state, product];
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllProduct() async {
    final docs = db.collection('productos')
    .withConverter(
        fromFirestore: Product.fromFirestore,
        toFirestore: (Product product, _) => product.toFirestore());
    final products = await docs.get();
    state = [...state, ...products.docs.map((d) => d.data())];
  }
} 