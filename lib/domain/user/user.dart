import 'package:appnike/domain/user/adress.dart';
import 'package:appnike/domain/user/credit_card.dart';
import 'package:appnike/domain/user/gender.enum.dart';

class User {
  String uid;
  String email;
  String? firstName;
  String? lastName;
  String? phone;
  Gender? gender;
  Adress? adress;
  CreditCard? creditCard;

  User(
    {
      required this.uid,
      required this.email,
      this.firstName,
      this.lastName,
      this.phone,
      this.gender,
      this.adress,
      this.creditCard,
    }
  );
}
