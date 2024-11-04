import 'package:appnike/domain/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final NotifierProvider<UserNotifier, User> userProvider = NotifierProvider<UserNotifier, User>(UserNotifier.new);

class UserNotifier extends Notifier<User> {
  @override
  build() {
    return User(email: "nomail", uid: 'nouser');
  }

  Future login(firebase_auth.User user) async {
    state = User(email: user.email!, uid: user.uid, firstName: user.displayName, phone: user.phoneNumber);
  }

  void logout() {
    state = User(email: "nomail", uid: 'nouser');
  }
}