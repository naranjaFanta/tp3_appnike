import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appnike/presentation/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  static const String name = 'cart'; // Define el nombre aquí
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'), // Título de la vista
      ),
      body: cartProvider.isEmpty
          ? const Center(child: Text('El carrito está vacío'))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cartItems[index];
                return ListTile(
                  title: Text(product.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cartProvider.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
    );
  }
}
