import 'package:cloud_firestore/cloud_firestore.dart';

class Purchase {
  final String id;
  final String userEmail;
  final Timestamp date;
  final List<String> items;
  final double totalAmount;

  Purchase({
    required this.id,
    required this.userEmail,
    required this.date,
    required this.items,
    required this.totalAmount,
  });

  Purchase.fromJson(Map<String, Object?> json)
    : this (
      id: json['id']! as String,
      userEmail: json['userEmail']! as String,
      date: json['date']! as Timestamp,
      items: (json['items']! as List).map((e) => e as String).toList(),
      totalAmount: json['totalAmount']! as double,
    );

  Map<String, Object?> toJson() {
    return <String, Object?> {
      "id": id,
      "userEmail": userEmail,
      "date": date,
      "items": items,
      "totalAmount": totalAmount,
    };
  }
}