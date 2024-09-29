import 'package:appnike/core/app_router.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              appRouter.push('/login');
            },
            child: const Text('Login Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              appRouter.push('/products');
            },
            child: const Text('Products Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              appRouter.push('/products/1');
            },
            child: const Text('Products Detail'),
          ),
          ElevatedButton(
            onPressed: () {
              appRouter.push('/discounts');
            },
            child: const Text('Discounts Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              appRouter.push('/discounts/1');
            },
            child: const Text('Discounts Detail'),
          ),
          ElevatedButton(
            onPressed: () {
              appRouter.push('/profile');
            },
            child: const Text('Profile Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              appRouter.push('/profile/new');
            },
            child: const Text('Profile Form'),
          ),
        ])));
  }
}
