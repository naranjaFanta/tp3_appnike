import 'package:appnike/core/app_router.dart';
import 'package:appnike/firebase_options.dart';
import 'package:appnike/presentation/providers/cart_provider.dart';
import 'package:appnike/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart' as provider; // Alias para provider


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialización de Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase conectado exitosamente');
  } catch (e) {
    print('Error conectando a Firebase: $e');
  }

  runApp(
    const ProviderScope(child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(create: (_) => CartProvider()),
        provider.ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

