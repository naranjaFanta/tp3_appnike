import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appnike/presentation/providers/purchase_provider.dart';

class PurchaseHistoryScreen extends ConsumerWidget {
  static const String name = 'purchase_history';
  const PurchaseHistoryScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchases = ref.watch(purchaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Compras'),
      ),
      body: purchases.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Column(children: [Text(error.toString()), Text(stack.toString())]),
        data: (purchases) => 
         purchases.isEmpty
          ? const Center(
            child: Text('No hay compras todavia.'),
          )
          : ListView.builder(
            itemCount: purchases.length,
            itemBuilder: (context, index) {
              final purchase = purchases[index];
              return ListTile(
                title: Text('Compra del ${purchase.date.toDate().toLocal()}'),
                subtitle: Text(
                    'Items: ${purchase.items.join(", ")} \n Total: \$${purchase.totalAmount}'),
              );
            },
          ),
        )
    );
  
  }
}