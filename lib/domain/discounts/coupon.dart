class Coupon {
  final String code;
  final int discountPercent;
  bool isUsed; // Cambia el estado del cupón

  Coupon({
    required this.code,
    required this.discountPercent,
    this.isUsed = false, // Por defecto, el cupón no está usado
  });
}

