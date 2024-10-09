import 'package:appnike/core/app_router.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Login Screen'),
              onTap: () {
                appRouter.push('/login');
               // Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Products Screen'),
              onTap: () {
                appRouter.push('/products');
                //Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Discounts Screen'),
              onTap: () {
                appRouter.push('/discounts');
                //Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Discounts Detail'),
              onTap: () {
                appRouter.push('/discounts/1');
                //Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Profile Screen'),
              onTap: () {
                appRouter.push('/profile');
                //Navigator.pop(context); // Cierra el drawer
              },
            ),
            ListTile(
              title: const Text('Profile Form'),
              onTap: () {
                appRouter.push('/profile/new');
               // Navigator.pop(context); // Cierra el drawer
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: const Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
