class Validators {
  static String? fullName(String? value) {
    final name = (value ?? '').trim();
    if (name.isEmpty) return 'Enter your full name.';
    if (name.runes.length < 2 || name.runes.length > 80) {
      return 'Use between 2 and 80 characters.';
    }
    if (!RegExp(r'\p{L}', unicode: true).hasMatch(name) ||
        RegExp(r'[\d\x00-\x1F<>@]').hasMatch(name)) {
      return 'Enter a name using letters, spaces, or name punctuation.';
    }
    return null;
  }

  static String? email(String? value) {
    final email = (value ?? '').trim();
    if (email.isEmpty) return 'Enter your email address.';
    if (email.length > 254 ||
        !RegExp(
          r'^[a-zA-Z0-9.!#$%&\x27*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)+$',
        ).hasMatch(email)) {
      return 'Enter a valid email, like name@example.com.';
    }
    final local = email.split('@').first;
    if (local.length > 64 ||
        local.startsWith('.') ||
        local.endsWith('.') ||
        local.contains('..')) {
      return 'Enter a valid email, like name@example.com.';
    }
    return null;
  }

  static String? identifier(String? value) {
    final input = (value ?? '').trim();
    if (input.isEmpty) return 'Enter your username or email.';
    if (input.contains('@')) return email(input);
    if (!RegExp(r'^[a-zA-Z0-9._]{3,30}$').hasMatch(input)) {
      return 'Use 3–30 letters, numbers, periods, or underscores.';
    }
    return null;
  }

  static String? password(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return 'Enter your password.';
    if (password.length < 8 || password.length > 64) {
      return 'Use 8–64 characters.';
    }
    if (RegExp(r'\s').hasMatch(password)) {
      return 'Do not use spaces in your password.';
    }
    if (!RegExp(r'[a-zA-Z]').hasMatch(password) ||
        !RegExp(r'[0-9]').hasMatch(password)) {
      return 'Include at least one letter and one number.';
    }
    return null;
  }

  static String? confirmation(String? value, String password) {
    if (value == null || value.isEmpty) return 'Confirm your password.';
    if (value != password) return 'Passwords do not match.';
    return null;
  }
}
