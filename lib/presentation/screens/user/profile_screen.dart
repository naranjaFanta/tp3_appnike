import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const name = 'profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: const Center(child: Text('Profile Screen')),
    );
  }
}
