import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método de autenticación que devuelve el email del usuario
  Future<String?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.email; // Devuelve el email del usuario
    } catch (e) {
      print('Error al iniciar sesión: $e');
      return null;
    }
  }

  // Método de registro que devuelve el email del usuario
  Future<String?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.email; // Devuelve el email del usuario
    } catch (e) {
      print('Error al registrar usuario: $e');
      return null;
    }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Getter para obtener el email del usuario actual
  String? get currentUserEmail => _auth.currentUser?.email;
}
