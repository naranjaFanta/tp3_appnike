import 'package:appnike/database/users/users/users.database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int testUserId = 5;

    final user = usersDB.firstWhere((user) => user.id == testUserId);

    int userAge(DateTime birth) {
      DateTime today = DateTime.now();
      int age = today.year - birth.year;

      if (today.month < birth.month ||
          (today.month == birth.month && today.day < birth.day)) {
        age--;
      }

      return age;
    }

    String creditCardVisibleNumbers(int fullNumber) {
      String number = fullNumber.toString();
      return number.substring(number.length - 4);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(user.image!),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${user.firstName} ${user.lastName}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${userAge(user.birth)} años",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            infoRow(Icons.cake,
                "${user.birth.day}/${user.birth.month}/${user.birth.year}"),
            infoRow(Icons.location_on,
                "${user.adress.street} ${user.adress.number}, ${user.adress.city}, ${user.adress.province}"),
            infoRow(Icons.account_box, "DNI: ${user.document}"),
            infoRow(Icons.transgender, "Genero: ${user.gender}"),
            infoRow(Icons.email, user.email),
            infoRow(Icons.phone, "${user.phone}"),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                    "¿Desea utilizar el mismo domicilio para las entregas?"),
                Switch(
                  value: true,
                  onChanged: (val) {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Tarjetas asociadas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.credit_card, size: 30),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "**** **** **** ${creditCardVisibleNumbers(user.creditCard.number)}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(user.creditCard.name),
                      Text(
                          "Vence: ${user.creditCard.expiryDate.month}/${user.creditCard.expiryDate.year}"),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/purchase-history');
                },
                child: const Text("Ver Historial de Compras"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
