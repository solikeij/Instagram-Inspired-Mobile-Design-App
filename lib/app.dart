import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/home_screen.dart';

class AppRoutes {
  static const String signin = '/';
  static const String signup = '/signup';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
        signin: (context) => const SignInScreen(),
        signup: (context) => const SignUpScreen(),
        home: (context) => const HomeScreen(),
      };
}