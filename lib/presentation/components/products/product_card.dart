import 'package:appnike/domain/products/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/products/${product.id}');
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children:[
                Image.network(
                  product.image,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                if ((product.isNew ?? false))
                  const Padding(
                    padding: EdgeInsets.all(6),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Nuevo',
                        style: TextStyle(
                          color: Color.fromARGB(255, 215, 195, 104),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ] 
                ),
            
            ListTile(
              title: Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(product.type),
              trailing: Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
