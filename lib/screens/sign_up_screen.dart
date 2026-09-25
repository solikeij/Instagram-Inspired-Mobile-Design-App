import 'package:flutter/material.dart';

import '../app.dart';
import '../models/home_arguments.dart';
import '../validation/validators.dart';
import '../widgets/auth_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _submitted = false;
  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _signup() {
    setState(() => _submitted = true);
    if (!_form.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (_) => false,
      arguments: HomeArguments(
        name: _name.text.trim(),
        email: _email.text.trim(),
      ),
    );
  }

  void _back() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) => AuthLayout(
    builder: (height) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            tooltip: 'Back to log in',
            onPressed: _back,
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        const Center(child: BrandIcon(size: 72)),
        const SizedBox(height: 12),
        const Text(
          'Create your account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: -.7,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'A little more you. A little more connected.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFFB3B6BA), fontSize: 14),
        ),
        const SizedBox(height: 30),
        Form(
          key: _form,
          autovalidateMode: _submitted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                validator: Validators.fullName,
                textCapitalization: TextCapitalization.words,
                autofillHints: const [AutofillHints.name],
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Full name'),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _email,
                validator: Validators.email,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                enableSuggestions: false,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Email address'),
              ),
              const SizedBox(height: 14),
              PasswordField(
                controller: _password,
                label: 'Password',
                isNew: true,
                validator: Validators.password,
                onChanged: (_) {
                  if (_submitted) _form.currentState!.validate();
                },
              ),
              const SizedBox(height: 14),
              PasswordField(
                controller: _confirm,
                label: 'Confirm password',
                isNew: true,
                validator: (value) =>
                    Validators.confirmation(value, _password.text),
                onSubmitted: _signup,
              ),
              const SizedBox(height: 24),
              FilledButton(onPressed: _signup, child: const Text('Sign up')),
            ],
          ),
        ),
        const SizedBox(height: 22),
        OutlinedButton(
          onPressed: _back,
          child: const Text('Already have an account? Log in'),
        ),
        const DemoFooter(),
      ],
    ),
  );
}
