import 'package:appnike/core/app_router.dart';
import 'package:appnike/database/discounts/discounts.database.dart';
import 'package:appnike/domain/discounts/discount.dart';
import 'package:appnike/presentation/components/common/main_drawer.dart';
import 'package:appnike/presentation/components/discounts/discount_card.dart';
import 'package:appnike/presentation/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

class DiscountsScreen extends StatelessWidget {
  static const String name = 'discounts';
  DiscountsScreen({super.key});
  final List<Discount> discounts = discountDB;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discounts Screen'),
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              2, // Puedes cambiar esto a 3 si necesitas más columnas
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.6, // Ajusta este valor para cambiar la altura
        ),
        padding: const EdgeInsets.all(10),
        itemCount: discounts.length,
        itemBuilder: (context, index) {
          final discount = discounts[index];
          return DiscountCard(discount: discount);
        },
      ),
    );
  }
}
