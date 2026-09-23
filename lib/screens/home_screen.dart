import 'package:flutter/material.dart';

import '../app.dart';
import '../models/home_arguments.dart';

/// Integration placeholder only. Your groupmate owns the Home screen UI.
/// Keep this class/route, and replace its body with their implementation.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final user = arguments is HomeArguments ? arguments : null;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  size: 40,
                  color: Color(0xFF70B5FF),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Home screen placeholder',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Text(
                  'Name received: ${user?.name ?? "Guest"}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (_) => false,
                  ),
                  child: const Text('Return to log in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
