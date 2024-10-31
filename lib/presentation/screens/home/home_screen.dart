import 'package:appnike/core/app_router.dart';
import 'package:appnike/presentation/components/common/main_drawer.dart';
import 'package:appnike/presentation/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          // Icono del carrito en el AppBar
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navega a CartScreen
              appRouter.pushNamed(CartScreen.name);
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Nike Store Home!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20), // Espaciado entre el texto y la imagen
            Image.asset(
              'assets/image/appnike.jpg', // Cambia "imagen.jpg" por el nombre real de tu archivo de imagen
              height: 200, // Altura de la imagen (puedes ajustarlo)
              fit: BoxFit.cover, // Ajuste de la imagen
            ),
          ],
        ),
      ),
    );
  }
}
