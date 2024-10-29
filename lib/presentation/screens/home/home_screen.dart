import 'package:appnike/core/app_router.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Login Screen'),
              onTap: () {
                appRouter.push('/login');
              },
            ),
            ListTile(
              title: const Text('Products Screen'),
              onTap: () {
                appRouter.push('/products');
              },
            ),
            ListTile(
              title: const Text('Discounts Screen'),
              onTap: () {
                appRouter.push('/discounts');
              },
            ),
            ListTile(
              title: const Text('Profile Screen'),
              onTap: () {
                appRouter.push('/profile');
              },
            ),
            ListTile(
              title: const Text('Profile Form'),
              onTap: () {
                appRouter.push('/profile/new');
              },
            ),
            ListTile(
              title: const Text('Carrito de Compras'),
              onTap: () {
                appRouter
                    .pushNamed(CartScreen.name); // Usa el nombre de la ruta
              },
            ),
          ],
        ),
      ),
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
