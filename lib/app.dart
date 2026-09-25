import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'screens/home_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String home = '/home';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}
=======

import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/home_screen.dart';

class AppRoutes {
  static const login = '/';
  static const signup = '/signup';
  static const home = '/home';
}

class InstagramLabApp extends StatelessWidget {
  const InstagramLabApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Instagram · ITP107',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF202020),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF70B5FF),
        onPrimary: Colors.white,
        surface: Color(0xFF202020),
        error: Color(0xFFFFAAA8),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 23,
        ),
        labelStyle: const TextStyle(color: Color(0xFFB3B6BA), fontSize: 16),
        errorMaxLines: 3,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(19)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: const BorderSide(color: Color(0xFF56585B)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: const BorderSide(color: Color(0xFF70B5FF), width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF0866E8),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          textStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF70B5FF),
          side: const BorderSide(color: Color(0xFF70B5FF)),
          minimumSize: const Size(double.infinity, 52),
          textStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    initialRoute: AppRoutes.login,
    routes: {
      AppRoutes.login: (_) => const SignInScreen(),
      AppRoutes.signup: (_) => const SignUpScreen(),
      AppRoutes.home: (_) => const HomeScreen(),
    },
  );
}
>>>>>>> 114b604102c028d9ed107c22ad8bf5ef0124dddd
