import 'package:appnike/domain/products/product.dart';
import 'package:appnike/presentation/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as flutter_provider;


class ProductTile extends StatelessWidget {
  final Product product;
  
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = flutter_provider.Provider.of<CartProvider>(context);

    return ListTile(
      leading: Image.network(product.image),
      title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Confirmación'),
                content: const Text('¿Estás seguro de que deseas eliminar este producto?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancelar'),
                  ),
                  FilledButton(
                    onPressed: () {
                      cartProvider.removeFromCart(product);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Eliminar'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}