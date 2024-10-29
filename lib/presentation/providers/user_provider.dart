import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _email = '';

  String get email => _email;

  void setUserEmail(String email) {
    _email = email;
    notifyListeners();
  }
}
