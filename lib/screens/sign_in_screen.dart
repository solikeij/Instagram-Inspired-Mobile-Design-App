import 'package:flutter/material.dart';

import '../app.dart';
import '../models/home_arguments.dart';
import '../validation/validators.dart';
import '../widgets/auth_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _form = GlobalKey<FormState>();
  final _identifier = TextEditingController();
  final _password = TextEditingController();
  bool _submitted = false;
  @override
  void dispose() {
    _identifier.dispose();
    _password.dispose();
    super.dispose();
  }

  void _login() {
    setState(() => _submitted = true);
    if (!_form.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    final value = _identifier.text.trim();
    // Lab navigation only; connect a real authentication service here if needed.
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.home,
      arguments: HomeArguments(
        name: value.split('@').first,
        email: value.contains('@') ? value : '',
      ),
    );
  }

  void _forgotPassword() => showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Password help'),
      content: const Text('Walang kanin busseng!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Got it'),
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) => AuthLayout(
    builder: (height) {
      final tall = height >= 720;
      return ConstrainedBox(
        constraints: BoxConstraints(minHeight: height),
        child: IntrinsicHeight(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'English (US)',
                style: TextStyle(color: Color(0xFFB3B6BA), fontSize: 14),
              ),
              SizedBox(height: tall ? 64 : 28),
              const BrandIcon(size: 112),
              SizedBox(height: tall ? 82 : 32),
              Form(
                key: _form,
                autovalidateMode: _submitted
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _identifier,
                      validator: Validators.identifier,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.username],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Username or email',
                      ),
                    ),
                    const SizedBox(height: 14),
                    PasswordField(
                      controller: _password,
                      label: 'Password',
                      validator: Validators.password,
                      onSubmitted: _login,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: _login,
                      child: const Text('Log in'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: _forgotPassword,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: const Size(48, 48),
                ),
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 40),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  _password.clear();
                  Navigator.pushNamed(context, AppRoutes.signup);
                },
                child: const Text('Create new account'),
              ),
              const DemoFooter(),
            ],
          ),
        ),
      );
    },
  );
}
