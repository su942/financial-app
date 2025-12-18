import 'package:flutter/material.dart';
import '../../auth/login_screen.dart';
import '../../home/home_screen.dart';
import '../../settings/settings_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/settings': (context) => const SettingsScreen(),
  };
}
