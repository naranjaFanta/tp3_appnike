import 'package:appnike/core/services/auth_service.dart';
import 'package:appnike/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainDrawer extends ConsumerWidget {
  MainDrawer({super.key});

  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 105,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              margin: const EdgeInsets.all(0),
              child: 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: SvgPicture.asset(
                    'assets/svg/logo.svg',
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                )
            ),
          ),
          ListTile(
            title: const Text('Usuario'),
            subtitle: Text(ref.watch(userProvider).email),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          ListTile(
            title: const Text('Products Screen'),
            onTap: () {
              context.push('/products');
            },
          ),
          ListTile(
            title: const Text('Discounts Screen'),
            onTap: () {
              context.push('/discounts');
            },
          ),
          ListTile(
            title: const Text('Profile Screen'),
            onTap: () {
              context.push('/profile');
            },
          ),
          ListTile(
            title: const Text('Profile Form'),
            onTap: () {
              context.push('/profile/new');
            },
          ),
          ListTile(
            title: const Text('Carrito de Compras'),
            onTap: () {
              context.pushNamed('/cart'); // Usa el nombre de la ruta
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          ListTile(
            title: const Text('Cerrar sesión'),
            onTap: () {
              _authService.logout(context, ref);
            },
          ),
        ],
      ),
    );
  }
}