import 'package:flutter/material.dart';

<<<<<<< HEAD
class BrandIcon extends StatelessWidget {
  const BrandIcon({super.key, this.size = 100});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.camera_alt,
      size: size,
      color: Colors.white,
    );
  }
=======
class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.builder});
  final Widget Function(double height) builder;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: builder(constraints.maxHeight),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class BrandIcon extends StatelessWidget {
  const BrandIcon({super.key, this.size = 100});
  final double size;
  @override
  Widget build(BuildContext context) => Image.asset(
    'assets/images/instagram_icon.png',
    width: size,
    height: size,
    semanticLabel: 'Instagram',
    filterQuality: FilterQuality.high,
  );
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.label,
    required this.validator,
    this.onChanged,
    this.onSubmitted,
    this.isNew = false,
  });
  final TextEditingController controller;
  final String label;
  final String? Function(String?) validator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final bool isNew;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _hidden = true;
  @override
  Widget build(BuildContext context) => TextFormField(
    controller: widget.controller,
    validator: widget.validator,
    onChanged: widget.onChanged,
    obscureText: _hidden,
    autocorrect: false,
    enableSuggestions: false,
    keyboardType: TextInputType.visiblePassword,
    autofillHints: [
      widget.isNew ? AutofillHints.newPassword : AutofillHints.password,
    ],
    textInputAction: widget.onSubmitted == null
        ? TextInputAction.next
        : TextInputAction.done,
    onFieldSubmitted: (_) => widget.onSubmitted?.call(),
    decoration: InputDecoration(
      labelText: widget.label,
      suffixIcon: IconButton(
        tooltip: _hidden
            ? 'Show ${widget.label.toLowerCase()}'
            : 'Hide ${widget.label.toLowerCase()}',
        onPressed: () => setState(() => _hidden = !_hidden),
        icon: Icon(
          _hidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: 21,
          color: const Color(0xFFB3B6BA),
        ),
      ),
    ),
  );
>>>>>>> 114b604102c028d9ed107c22ad8bf5ef0124dddd
}

class DemoFooter extends StatelessWidget {
  const DemoFooter({super.key});
<<<<<<< HEAD

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Center(
        child: Text(
          'ITP107 - De Matta & Malana',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF9DA1A6),
            fontSize: 12,
            letterSpacing: .4,
          ),
        ),
      ),
    );
  }
}
=======
  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 18),
    child: Text(
      'ITP107 - De Matta & Malana',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF9DA1A6),
        fontSize: 12,
        letterSpacing: .4,
      ),
    ),
  );
}
>>>>>>> 114b604102c028d9ed107c22ad8bf5ef0124dddd
