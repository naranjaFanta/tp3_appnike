import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          const ListTile(
            title: Text('Usuario'),
            subtitle: Text('mail@gmail.com'), //TODO Usar mail del usuario (un provider)
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
              context.push('/login');
            },
          ),
        ],
      ),
    );
  }
}