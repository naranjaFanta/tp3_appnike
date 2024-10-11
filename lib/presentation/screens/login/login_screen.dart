import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  static const String name = 'login'; // Asegúrate de definir el nombre aquí

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Si el inicio de sesión es exitoso, redirige a la pantalla principal
      context.go('/'); // Cambia esta línea para usar GoRouter
    } catch (e) {
      print("Error al iniciar sesión: $e");
      // Muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Sesión')),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: signIn,
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
