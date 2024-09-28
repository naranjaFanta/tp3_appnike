class Adress {
  String street;
  int number;
  String? floor;
  String? appartment;
  String city;
  String province;
  String? postalCode;

  Adress(
      {required this.street,
      required this.number,
      this.floor,
      this.appartment,
      required this.city,
      required this.province,
      this.postalCode});
}
