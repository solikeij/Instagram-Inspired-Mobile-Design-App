import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget Function(double availableHeight) builder;

  const AuthLayout({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: builder(constraints.maxHeight),
            );
          },
        ),
      ),
    );
  }
}

class BrandIcon extends StatelessWidget {
  final double size;

  const BrandIcon({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.28),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFEE411),
                Color(0xFFFED308),
                Color(0xFFF9373F),
                Color(0xFFC913B9),
                Color(0xFF4251E1),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Container(
              width: size * 0.62,
              height: size * 0.62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size * 0.18),
                border: Border.all(color: Colors.white, width: size * 0.06),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: size * 0.28,
                    height: size * 0.28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: size * 0.06),
                    ),
                  ),
                  Positioned(
                    top: size * 0.05,
                    right: size * 0.05,
                    child: Container(
                      width: size * 0.06,
                      height: size * 0.06,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final VoidCallback? onSubmitted;
  final bool isNew;

  const PasswordField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.isNew = false,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      validator: widget.validator,
      onChanged: widget.onChanged,
      textInputAction: widget.onSubmitted != null ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: widget.onSubmitted != null ? (_) => widget.onSubmitted!() : null,
      autofillHints: [
        widget.isNew ? AutofillHints.newPassword : AutofillHints.password,
      ],
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: const Color(0xFF8E8E93),
          ),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
      ),
    );
  }
}

class DemoFooter extends StatelessWidget {
  const DemoFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          'ITP107 - De Matta & Malana',
          style: TextStyle(
            color: Color(0xFF8E8E93),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}