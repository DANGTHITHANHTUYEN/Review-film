import 'package:flutter/material.dart';
import 'package:review_film/common/widgets/bottom_bar.dart';
import 'package:review_film/features/admin/screens/add_product_screen.dart';
import 'package:review_film/features/auth/screens/login_screen.dart';
import 'package:review_film/features/home/screens/home_screen.dart';
import 'features/auth/screens/register_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case RegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exits!!!'),
          ),
        ),
      );
  }
}
