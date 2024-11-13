import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appnike/presentation/providers/purchase_provider.dart';

class PurchaseHistoryScreen extends ConsumerWidget {
  static const String name = 'purchase_history';
  const PurchaseHistoryScreen({super.key});

  void _confirmClearHistory(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: const Text('¿Estás seguro de que deseas eliminar todo el historial de compras?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                ref.read(purchaseProvider.notifier).clearHistory(); 
                Navigator.of(context).pop();
              },
              child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchases = ref.watch(purchaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Compras'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmClearHistory(context, ref),
          ),
        ],
      ),
      body: purchases.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Column(
          children: [
            Text(error.toString()),
            Text(stack.toString()),
          ],
        ),
        data: (purchases) => purchases.isEmpty
            ? const Center(
                child: Text('No hay compras todavía.'),
              )
            : ListView.builder(
                itemCount: purchases.length,
                itemBuilder: (context, index) {
                  final purchase = purchases[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        'Compra del ${purchase.date.toDate().toLocal()}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Items: ${purchase.items.join(", ")}\nTotal: \$${purchase.totalAmount}',
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
