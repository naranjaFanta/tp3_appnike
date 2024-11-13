import 'package:appnike/presentation/components/products/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:appnike/presentation/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  static const String name = 'cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier  = ref.watch(cartProvider.notifier);
    final cartProducts  = ref.watch(cartProvider);
    final discountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartNotifier.isEmpty
                ? const Center(child: Text('El carrito está vacío'))
                : ListView.builder(
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      final product = cartProducts[index];
                      return ProductTile(product: product);
                    },
                  ),
          ),
          
          if (!cartNotifier.isEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: discountController,
                    decoration: InputDecoration(
                      labelText: 'Código de Descuento',
                      border: const OutlineInputBorder(),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextButton(
                          onPressed: () {
                            final discountCode = discountController.text;
                            cartNotifier.applyDiscount(context, ref, discountCode);
                          }, 
                          child: const Text("Aplicar")
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 8),
                  AmoutTile(
                    title: "Subtotal", 
                    amount: cartNotifier.totalPriceWithoutDiscount,
                    titleStyle: const TextStyle(fontSize: 18, color: Colors.black54),
                    amountStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)  
                  ),
                  AmoutTile(
                    title: "Descuento", 
                    amount: cartNotifier.discountedAmount, 
                    titleStyle: const TextStyle(fontSize: 18, color: Colors.black54),
                    amountStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    isNegative: true
                  ),
                  const Divider(),
                  AmoutTile(
                    title: "Total:", 
                    amount: cartNotifier.totalPrice,
                    titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    amountStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 19),
                      ),
                      onPressed: () {
                        context.go('/payment');
                      },
                      child: const Text('Pagar', style: TextStyle(fontSize: 17),),
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

class AmoutTile extends StatelessWidget {
  const AmoutTile({
    super.key,
    required this.amount,
    required this.title,
    this.titleStyle,
    this.amountStyle,
    this.isNegative = false
  });

  final double amount;
  final String title;
  final TextStyle? titleStyle, amountStyle;
  final bool? isNegative; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Text(
            '${isNegative! ? '-' : ''}\$${amount.toStringAsFixed(2)}',
            style: amountStyle,
          ),
        ],
      ),
    );
  }
}
