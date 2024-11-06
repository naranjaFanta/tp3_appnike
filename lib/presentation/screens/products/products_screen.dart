import 'package:appnike/core/app_router.dart';
import 'package:appnike/domain/products/product.dart';
import 'package:appnike/presentation/components/common/main_drawer.dart';
import 'package:appnike/presentation/components/products/product_card.dart';
import 'package:appnike/presentation/screens/cart/cart_screen.dart';
import 'package:appnike/core/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatefulWidget {
  static const String name = 'products';
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Screen'),
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
      drawer: MainDrawer(),
      body: Center(
        child: _ProductList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/products/create');
        },
        label: const Text("Agregar Producto"),
        icon: const Icon(Icons.add)
      ),
    );
  }

  Widget _ProductList() {
    return StreamBuilder(
      stream: _productService.getAllProducts(), 
      builder: (context, snapshot) {
        List products = snapshot.data?.docs ?? [];
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 2.0, // spacing between rows
            crossAxisSpacing: 2.0, // spacing between columns
          ),
          itemCount: products.length,
          itemBuilder: (context, index) { 
            Product product = products[index].data();
            // return Text(product.name);
            return ProductCard(product: product);
          }
        );
        
        // return ListView.builder(
        //   itemCount: products.length,
        //   itemBuilder: (context, index) {
        //     Product product = products[index].data();
        //     // return Text(product.name);
        //     return ProductCard(product: product);
        //   }
        // );
      }
    );
  }
}