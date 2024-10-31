class Coupon {
  final String code;
  final int discountPercent;
  bool isUsed = false;

  Coupon({required this.code, required this.discountPercent});
}