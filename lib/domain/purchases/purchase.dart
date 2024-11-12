class Purchase {
  final String id;
  final DateTime date;
  final List<String> items;
  final double totalAmount;

  Purchase({
    required this.id,
    required this.date,
    required this.items,
    required this.totalAmount,
  });
}