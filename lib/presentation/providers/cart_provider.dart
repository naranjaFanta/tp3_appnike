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

  void addToCart(Product product) {
    state = [...state, product];
  }

  void removeFromCart(Product product) {
    state = state.where((item) => item != product).toList();
  }

  void emptyCart() {
    state = [];
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
    return totalPriceWithoutDiscount * (_discountPercent / 100);
  }

  List<String> getProductsNames () {
    return state.map((p) => p.name).toList();
  }

  void applyDiscount(BuildContext context, WidgetRef ref, String discountCode) {
    final isCouponValid = ref.read(couponProvider.notifier).applyCouponIfValid(discountCode);
    
    if (isCouponValid) {
      _discountPercent = ref.read(couponProvider.notifier).getCouponDiscount(discountCode);
      state = [...state];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cupón inválido o ya utilizado")),
      );
    }
  }
}
