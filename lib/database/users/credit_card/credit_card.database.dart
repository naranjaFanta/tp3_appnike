import 'package:appnike/domain/user/credit_card.dart';

List<CreditCard> creditCardsDB = [
  CreditCard(
      userId: 1,
      number: 1234567890123456,
      name: "John Doe",
      expiryDate: DateTime(2025, 5),
      cvv: "123"),
  CreditCard(
      userId: 2,
      number: 2345678901234567,
      name: "Jane Smith",
      expiryDate: DateTime(2024, 7),
      cvv: "456"),
  CreditCard(
      userId: 3,
      number: 3456789012345678,
      name: "Robert Johnson",
      expiryDate: DateTime(2026, 3),
      cvv: "789"),
  CreditCard(
      userId: 4,
      number: 4567890123456789,
      name: "Emily Davis",
      expiryDate: DateTime(2023, 12),
      cvv: "321"),
  CreditCard(
      userId: 5,
      number: 5678901234567890,
      name: "Michael Brown",
      expiryDate: DateTime(2027, 8),
      cvv: "654"),
];
