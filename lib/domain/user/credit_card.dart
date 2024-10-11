class CreditCard {
  int userId;
  int number;
  String name;
  DateTime expiryDate;
  String cvv;

  CreditCard(
      {required this.userId,
      required this.number,
      required this.name,
      required this.expiryDate,
      required this.cvv});
}
