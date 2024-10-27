import 'package:appnike/domain/products/product.dart';
import 'package:appnike/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCreateScreen extends StatefulWidget {
  static const String name = 'create_product';
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  String name = '';
  String description = '';
  String type = '';
  double price = 0.00;
  String image = '';
  bool isNew = false;

  final ProductService _productService = ProductService();

  createProduct() async {
    try {
      var id = await _productService.getLastId();
      Product product = Product(id: id, name: name, description: description, type: type, price: price, image: image, isNew: isNew);
      _productService.addProduct(product);
      
      context.replace('/products');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El producto se ha creado exitosamente!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al crear producto $e')),
      ); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear Producto")),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              TextField(
                onChanged: (value) {
                  type = value;
                },
                decoration: const InputDecoration(labelText: 'Tipo'),
              ),
              TextField(
                onChanged: (value) {
                  price = double.parse(value);
                },
                decoration: const InputDecoration(labelText: 'Precio'),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    image = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Imagen'),
              ),
              ImagePreview(image: image),
              Row(
                children: [
                  const Text("Nuevo"),
                  Checkbox(  
                    value: isNew, 
                    onChanged: (bool? value) {
                      setState(() {
                        isNew = value!;
                      });
                    }
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  createProduct();
                },
                child: const Text("Crear Producto"),
              )
            ],
          ),
        )
      ),
    );
  }
}

class ImagePreview extends StatefulWidget {
  const ImagePreview({
    super.key,
    required this.image,
  });

  final String image;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    if(widget.image.isEmpty) {
      return Image.asset(
        'assets/image/placeholder.png',
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height*0.3,
        fit: BoxFit.cover,
      );   
    } else {
      return Image.network(
        widget.image,
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height*0.3,
        fit: BoxFit.cover,
      );
    }
  }
}