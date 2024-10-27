import 'package:appnike/presentation/screens/discounts/discount_detail.dart';
import 'package:appnike/presentation/screens/discounts/discounts_screen.dart';
import 'package:appnike/presentation/screens/home/home_screen.dart';
import 'package:appnike/presentation/screens/login/login_screen.dart';
import 'package:appnike/presentation/screens/products/product_create_screen.dart';
import 'package:appnike/presentation/screens/products/product_detail.dart';
import 'package:appnike/presentation/screens/products/products_screen.dart';
import 'package:appnike/presentation/screens/user/profile_form.dart';
import 'package:appnike/presentation/screens/user/profile_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: (context, state) => LoginScreen()),
    GoRoute(
        path: '/products',
        name: ProductsScreen.name,
        builder: (context, state) => ProductsScreen()),
    GoRoute(
        path: '/products/create',
        name: ProductCreateScreen.name,
        builder: (context, state) => const ProductCreateScreen()),
    GoRoute(
      path: '/products/:id',
      name: ProductDetail.name,
      builder: (context, state) {
        final productId = state.pathParameters['id'];
        return ProductDetail(productId: int.parse(productId!));
      },
    ),
    GoRoute(
        path: '/discounts',
        name: DiscountsScreen.name,
        builder: (context, state) => DiscountsScreen()),
    GoRoute(
      path: '/discounts/:id',
      name: DiscountDetail.name,
      builder: (context, state) {
        final discountId = state.pathParameters['id'];
        return DiscountDetail(discountId: int.parse(discountId!));
      },
    ),
    GoRoute(
        path: '/profile',
        name: ProfileScreen.name,
        builder: (context, state) => const ProfileScreen()),
    GoRoute(
        path: '/profile/new',
        name: ProfileForm.name,
        builder: (context, state) => const ProfileForm()),
  ],
);
