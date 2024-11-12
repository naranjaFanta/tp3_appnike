import 'package:appnike/domain/products/product.dart';
import 'package:appnike/presentation/providers/coupon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final NotifierProvider<CartNotifier, List<Product>> cartProvider = NotifierProvider<CartNotifier, List<Product>>(CartNotifier.new);

class CartNotifier extends Notifier<List<Product>> {
  double _discountPercent = 0.0;
  
  @override
  List<Product> build() {
    return [];
  }

  addToCart(Product product) {
    state.add(product);
  }

  removeFromCart(Product product) {
    state.remove(product);
  }

  emptyCart() {
    state.clear();
    _discountPercent = 0.0;
  }

  bool get isEmpty => state.isEmpty;

  double get totalPriceWithoutDiscount {
    return state.fold(0.0, (sum, item) => sum + item.price);
  }

  double get totalPrice {
    return totalPriceWithoutDiscount * (1 - _discountPercent / 100);
  }

  double get discountedAmount {
    return totalPriceWithoutDiscount - (totalPriceWithoutDiscount * (1 - _discountPercent / 100));
  }

  List<String> getProductsNames () {
    return state.map((p) => p.name).toList();
  }

  void applyDiscount(BuildContext context, WidgetRef ref, String discountCode) {
    final isCouponValid = ref.read(couponProvider.notifier).applyCouponIfValid(discountCode);
    
    if (isCouponValid) {
      _discountPercent = ref.read(couponProvider.notifier).getCouponDiscount(discountCode);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cupón inválido o ya utilizado")),
      );
    }
  }
}

/*
class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];
  double _discountPercent = 0.0;
  String? _lastAppliedCouponCode;

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void emptyCart() {
    _cartItems.clear();
    _discountPercent = 0.0;
    notifyListeners();
  }


  bool get isEmpty => _cartItems.isEmpty;

  double get totalPriceWithoutDiscount {
    return _cartItems.fold(0.0, (sum, item) => sum + item.price);
  }

  double get totalPrice {
    return totalPriceWithoutDiscount * (1 - _discountPercent / 100);
  }

  double get discountedAmount {
    return totalPriceWithoutDiscount - (totalPriceWithoutDiscount * (1 - _discountPercent / 100));
  }

  void applyDiscount(BuildContext context, String discountCode) {
    final couponProvider = Provider.of<CouponProvider>(context, listen: false);
    final isCouponValid = couponProvider.applyCouponIfValid(discountCode);
    
    if (isCouponValid) {
      _discountPercent = couponProvider.getCouponDiscount(discountCode);
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cupón inválido o ya utilizado")),
      );
    }
  }
}
*/