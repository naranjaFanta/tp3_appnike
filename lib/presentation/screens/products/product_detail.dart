import 'package:appnike/domain/products/product.dart';
import 'package:appnike/presentation/providers/cart_provider.dart';
import 'package:appnike/core/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProductDetail extends ConsumerWidget {
  static const String name = 'product_detail';
  final int productId;
  ProductDetail({super.key, required this.productId});
  
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: _productService.getProduct(productId), 
      builder: (context, AsyncSnapshot<Product?> snapshot) {
        if(snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data!.name),
              ),
              body: 
                  ListView(
                    shrinkWrap: true,
                      children: [
                        Center(
                          child: Image.network(snapshot.data!.image),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              child: Text(
                                '\$${snapshot.data!.price}',
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
                              ),
                            ),
                            if ((snapshot.data!.isNew ?? false))
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Nuevo',
                              style: TextStyle(
                                color: Color.fromARGB(255, 215, 195, 104),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ],
                        ),
                        Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              child: Text(snapshot.data!.name,
                                style: const TextStyle(fontSize: 24)
                              ),
                            ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                          child: Text(snapshot.data!.description),
                        ),
                        
                        const SizedBox(height: 25),
                      ],
                  ),
                  bottomNavigationBar:Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(cartProvider.notifier).addToCart(snapshot.data!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Producto agregado al carrito')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Agregar al carrito'),
                    ),
                  ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Producto")
            ),
            body: const Center(
              child: CircularProgressIndicator()
            ),
          );
        }
      }
    );
  }
}