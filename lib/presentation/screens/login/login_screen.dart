import 'package:appnike/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class LoginScreen extends ConsumerWidget {
  static const String name = 'login';

  LoginScreen({super.key});

  final AuthService _authService = AuthService();
  String email = '';
  String password = '';

  // Credenciales de prueba
  final String testEmail = 'edu@hotmail.com';
  final String testPassword = 'eduardo';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: SvgPicture.asset(
                  'assets/svg/logo.svg',
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _authService.login(email, password, context, ref);
                },
                child: const Text('Iniciar Sesión'),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: [
                    const Text(
                      'Usuario de prueba:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Email: $testEmail'),
                    Text('Contraseña: $testPassword'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
