import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  int id;
  String name;
  String description;
  String type;
  double price;
  String image;
  bool? isNew;

  Product(
    {
      required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.price,
      required this.image,
      this.isNew
    }
  );
  
  Product.fromJson(Map<String, Object?> json)
    : this (
      id: json['id']! as int,
      name: json['name']! as String,
      description: json['description']! as String,
      type: json['type']! as String,
      price: json['price']! as double,
      image: json['image']! as String,
      isNew: json['isNew']! as bool,
    );

  Map<String, Object?> toJson() {
    return <String, Object?> {
      "id": id,
      "name": name,
      "description": description,
      "type": type,
      "price": price,
      "image": image,
      "isNew": isNew
    };
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": id,
      "state": name,
      "description": description,
      "type": type,
      "price": price,
      "image": image,
      "isNew": isNew
    };
  }

  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    
    return Product(
      id: data?['id'],
      name: data?['name'],
      description: data?['description'],
      type: data?['type'],
      price: data?['price'],
      image: data?['image'],
      isNew: data?['is_new'],
    );
  }

  

}