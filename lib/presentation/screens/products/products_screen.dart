import 'package:appnike/domain/products/product.dart';
import 'package:appnike/presentation/components/products/product_card.dart';
import 'package:appnike/services/product_service.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: _ProductList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _productService.addProduct(
            Product(
              id: 5,
              name: 'Adidas Yeezy Boost 350',
              description: 'Zapatillas de edición limitada diseñadas por Kanye West.',
              type: 'Streetwear',
              price: 399.99,
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRv45TDdXDVPDiCctILmVGIMO9cwvJWA1_Fg&s',
              isNew: false,
            )
          );
        },
        child: const Icon(Icons.add)
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