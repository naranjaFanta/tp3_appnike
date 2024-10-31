import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:appnike/presentation/providers/user_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String name = 'login';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  // Credenciales de prueba
  final String testEmail = 'edu@hotmail.com';
  final String testPassword = 'eduardo';

  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUserEmail(userCredential.user?.email ?? email);

      context.go('/'); // Usando GoRouter
    } catch (e) {
      print("Error al iniciar sesión: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al iniciar sesión')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: signIn,
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
