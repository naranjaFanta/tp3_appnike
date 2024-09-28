import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  static const String name = 'profile_form';
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Form'),
      ),
      body: const Center(child: Text('Profile Form')),
    );
  }
}
