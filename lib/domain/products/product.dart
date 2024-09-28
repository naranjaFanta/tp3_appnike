class Product {
  int id;
  String name;
  String description;
  String type;
  double price;
  String image;
  bool? isNew;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.price,
      required this.image,
      this.isNew});
}
