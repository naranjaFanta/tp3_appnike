import 'package:appnike/domain/products/product.dart';

List<Product> productsDB = [
  Product(
    id: 1,
    name: 'Nike Air Force 1',
    description:
        'Las clásicas zapatillas Nike Air Force 1, ahora con un toque moderno.',
    type: 'Casual',
    price: 129.99,
    image: 'assets/images/nike_air_force_1.jpg',
    isNew: true,
  ),
  Product(
    id: 2,
    name: 'Adidas Ultraboost 23',
    description:
        'Zapatillas de running de alta performance con tecnología Boost.',
    type: 'Running',
    price: 189.99,
    image: 'assets/images/adidas_ultraboost_23.jpg',
    isNew: false,
  ),
  Product(
    id: 3,
    name: 'Puma Suede',
    description: 'Las icónicas Puma Suede, un básico para cualquier armario.',
    type: 'Casual',
    price: 99.99,
    image: 'assets/images/puma_suede.jpg',
    isNew: false,
  ),
  Product(
    id: 4,
    name: 'New Balance 574',
    description: 'Un clásico atemporal con un diseño versátil.',
    type: 'Casual',
    price: 89.99,
    image: 'assets/images/new_balance_574.jpg',
    isNew: false,
  ),
  Product(
    id: 5,
    name: 'Adidas Yeezy Boost 350',
    description: 'Zapatillas de edición limitada diseñadas por Kanye West.',
    type: 'Streetwear',
    price: 399.99,
    image: 'assets/images/adidas_yeezy_boost_350.jpg',
    isNew: false,
  ),
  Product(
    id: 6,
    name: 'Nike Dunk Low',
    description: 'Un modelo icónico que nunca pasa de moda.',
    type: 'Casual',
    price: 119.99,
    image: 'assets/images/nike_dunk_low.jpg',
    isNew: true,
  ),
];
