import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/home_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/favorites_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const intro = '/intro';
  static const home = '/home';
  static const detail = '/detail';
  static const favorites = '/favorites';

  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => const SplashScreen(),
    intro: (_) => const IntroScreen(),
    home: (_) => const HomeScreen(),
    detail: (_) => const DetailScreen(),
    favorites: (_) => const FavoritesScreen(),
  };
}