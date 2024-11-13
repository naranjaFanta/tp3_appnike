import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appnike/presentation/providers/purchase_provider.dart';

class PurchaseHistoryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchases = ref.watch(purchaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Compras'),
      ),
      body: purchases.isEmpty
          ? const Center(
              child: Text('No hay compras todavia.'),
            )
          : ListView.builder(
              itemCount: purchases.length,
              itemBuilder: (context, index) {
                final purchase = purchases[index];
                return ListTile(
                  title: Text('Compra del ${purchase.date.toLocal()}'),
                  subtitle: Text(
                      'Items: ${purchase.items.join(", ")} \n Total: \$${purchase.totalAmount}'),
                );
              },
            ),
    );
  }
}