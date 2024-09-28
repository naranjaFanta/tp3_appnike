import 'package:appnike/domain/user/adress.dart';
import 'package:appnike/domain/user/credit_card.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String document;
  String email;
  int phone;
  String? gender;
  DateTime birth;
  Adress adress;
  CreditCard creditCard;
  bool? isPremium;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.document,
      required this.email,
      required this.phone,
      this.gender,
      required this.birth,
      required this.adress,
      required this.creditCard,
      this.isPremium});
}
