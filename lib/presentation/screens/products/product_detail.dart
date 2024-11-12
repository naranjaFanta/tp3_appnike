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
                        if ((snapshot.data!.isNew ?? false))
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Center(
                              child: Text(
                                'Nuevo',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 215, 195, 104),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        Center(
                          child: Text(snapshot.data!.name,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 8),
                        Center(child: Text(snapshot.data!.description)),
                        const SizedBox(height: 16),
                        Center(
                          child: Text('Precio: \$${snapshot.data!.price}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
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
                      ],
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