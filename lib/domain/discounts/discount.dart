class Discount {
  int id;
  String business;
  String description;
  String type;
  int regular;
  int premium;
  String image;

  Discount(
      {required this.id,
      required this.business,
      required this.description,
      required this.type,
      required this.regular,
      required this.premium,
      required this.image});
}
