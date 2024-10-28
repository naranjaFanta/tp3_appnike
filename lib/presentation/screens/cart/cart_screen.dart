import 'package:appnike/presentation/screens/payments/payment_Screen.dart';
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
      body: Column(
        children: [
          Expanded(
            child: cartProvider.isEmpty
                ? const Center(child: Text('El carrito está vacío'))
                : ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartProvider.cartItems[index];
                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'), // Mostrar el precio del producto
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cartProvider.removeFromCart(product);
                          },
                        ),
                      );
                    },
                  ),
          ),
          if (!cartProvider.isEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${cartProvider.totalPrice.toStringAsFixed(2)}', // Mostrar el precio total
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(userEmail: "usuario@ejemplo.com"),
                          ),
                        );
                      },
                      child: const Text('Pagar'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
