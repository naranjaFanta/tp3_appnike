import 'package:appnike/presentation/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  login(String email, String password, BuildContext context, WidgetRef ref) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ref.read(userProvider.notifier).login(userCredential.user!);
      context.go('/');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al iniciar sesión')),
      );
    }
  }

  register(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Su usuario (${userCredential.user?.email}) fue creado exitosamente')),
      );
    } catch (e) {
      print('Error al registrar usuario: $e');
      return null;
    }
  }

  logout(BuildContext context, WidgetRef ref) async {
    await _auth.signOut();
    ref.read(userProvider.notifier).logout();
  }
}
