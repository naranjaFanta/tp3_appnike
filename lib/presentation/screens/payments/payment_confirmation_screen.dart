import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final String userEmail;

  const PaymentConfirmationScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmación de Pago'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.close),
              onPressed: () { 
                context.go('/'); 
              },
              tooltip: "Volver al inicio",
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Su compra se realizó con éxito!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Text(
              'Puede retirar el producto en la sucursal más cercana.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Email: $userEmail',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text("Volver al inicio"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text("Cerrar Sesión"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
