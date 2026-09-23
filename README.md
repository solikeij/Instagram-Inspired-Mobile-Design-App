# Instagram Dark Mode — ITP107 Finals Lab 1

Flutter sign-in and sign-up screens based on the supplied dark-mode reference. Home is an integration placeholder reserved for your groupmate.

## Run

Install Flutter stable (this project was checked with Flutter 3.47.1 / Dart 3.13.1). From this folder:

```sh
flutter pub get
flutter run -d chrome
```

For Android, start an emulator or connect a phone and run `flutter run`. Android and web platform folders are included. No extra runtime packages or API keys are needed.

## Features

- Charcoal theme, supplied Instagram icon, rounded fields and blue actions.
- Login with username or email and password; sign-up with full name, email, password and confirmation.
- Inline errors, show/hide passwords, keyboard actions and scrolling on smaller screens.
- Name: 2–80 characters, includes letters, rejects numbers and invalid control characters.
- Email: checks address format, domain and invalid dots; trims surrounding whitespace.
- Username: 3–30 letters, numbers, periods or underscores.
- Password: 8–64 characters, at least one letter and one number, no whitespace. Confirmation must match exactly.
- Named routes with pushNamed, pushReplacementNamed, pop and pushNamedAndRemoveUntil.

## Scope

This is a navigation and validation demo, not real authentication. Any input that passes validation proceeds to the placeholder. It does not store accounts, verify credentials, contact Instagram, or send reset emails. The Forgot password action explains this limitation. Use fictional details such as maria@example.com and Sample123!.

The supplied square icon differs from the outlined icon in the reference; the supplied asset is used unchanged. The optional white wordmark is included in assets for your groupmate.

## Home screen handoff

Replace the body of `lib/screens/home_screen.dart`, keeping the `HomeScreen` class and `/home` route registered in `lib/app.dart`.

```dart
final user = ModalRoute.of(context)!.settings.arguments as HomeArguments;
Text('Welcome, ${user.name}');
```

Import `../models/home_arguments.dart` in Home. Sign-up passes the full name and email. Sign-in passes the username, or the email portion before @, as the display name. Passwords are never passed to Home.

For logout, clear the route stack:

```dart
Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false);
```

## Structure

- lib/app.dart — theme and named routes
- lib/screens/sign_in_screen.dart — login form
- lib/screens/sign_up_screen.dart — registration form
- lib/screens/home_screen.dart — groupmate integration placeholder
- lib/widgets/auth_widgets.dart — shared layout and password field
- lib/validation/validators.dart — reusable validation rules
- lib/models/home_arguments.dart — route data
- test/widget_test.dart — validation, navigation and small-screen checks

## Checks

```sh
flutter analyze
flutter test
flutter build web
```

For submission, rename the ZIP to ITP107_FinalsLab1_Section_GroupNo using your actual section and group number. Add your groupmate's Home screen, full-flow screenshots/recording, and completed laboratory form before submitting.

Flutter navigation reference: https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
