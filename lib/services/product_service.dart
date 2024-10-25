
import 'package:appnike/domain/products/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _productRef;

  ProductService() {
    _productRef = _firestore.collection('productos').withConverter<Product>(
      fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!), 
      toFirestore: (product, _) => product.toJson()
    );
  }

  Stream<QuerySnapshot> getAllProducts() {
    return _productRef.snapshots();
  }

  Future<Product?> getProduct(int id) async {
    Product? p = (await _productRef.withConverter(
      fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!), 
      toFirestore: (product, _) => product.toJson())
      .doc(id.toString()).get()).data();
    return p;
  }

  addProduct(Product product) async {
    AggregateQuerySnapshot query = await _productRef.count().get();
    
    _productRef
      .doc(query.count.toString())
      .set(product)
      .onError((e, _) => print("ERROR en la creacion del producto ${product.toString()}"));

  }
}