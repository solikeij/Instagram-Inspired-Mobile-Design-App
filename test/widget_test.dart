<<<<<<< HEAD
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:home_screen/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
=======
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_dark_lab/app.dart';
import 'package:instagram_dark_lab/validation/validators.dart';

void main() {
  test('validates names, email, identifiers and passwords', () {
    for (final value in ['', 'a', '1234', 'Name123']) {
      expect(Validators.fullName(value), isNotNull);
    }
    expect(Validators.fullName('María Santos'), isNull);
    for (final value in [
      '',
      'a@',
      'a@domain',
      '.a@example.com',
      'a..b@example.com',
      'a@-domain.com',
      'a b@example.com',
    ]) {
      expect(Validators.email(value), isNotNull, reason: value);
    }
    expect(Validators.email('  maria+lab@example.com  '), isNull);
    expect(Validators.identifier('maria.santos_1'), isNull);
    expect(Validators.identifier('bad user'), isNotNull);
    for (final value in ['', 'abc1', 'abcdefgh', '12345678', 'Password 1']) {
      expect(Validators.password(value), isNotNull);
    }
    expect(Validators.password('Sample123!'), isNull);
    expect(Validators.confirmation('Sample124!', 'Sample123!'), isNotNull);
    expect(Validators.confirmation('Sample123!', 'Sample123!'), isNull);
  });

  Future<void> start(
    WidgetTester tester, {
    Size size = const Size(390, 844),
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const InstagramLabApp());
    await tester.pumpAndSettle();
  }

  Future<void> tapText(WidgetTester tester, String label) async {
    await tester.ensureVisible(find.text(label));
    await tester.tap(find.text(label));
    await tester.pumpAndSettle();
  }

  testWidgets(
    'login rejects empty fields, toggles password, routes valid input',
    (tester) async {
      await start(tester);
      await tapText(tester, 'Log in');
      expect(find.text('Enter your username or email.'), findsOneWidget);
      expect(find.text('Enter your password.'), findsOneWidget);
      await tester.enterText(
        find.byType(TextFormField).at(0),
        'maria@example.com',
      );
      await tester.enterText(find.byType(TextFormField).at(1), 'Sample123!');
      await tester.tap(find.byTooltip('Show password'));
      await tester.pump();
      expect(
        tester.widget<TextField>(find.byType(TextField).at(1)).obscureText,
        isFalse,
      );
      await tapText(tester, 'Log in');
      expect(find.text('Name received: maria'), findsOneWidget);
      await tapText(tester, 'Return to log in');
      expect(find.text('Create new account'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets(
    'signup checks confirmation and sends name to reserved Home route',
    (tester) async {
      await start(tester);
      await tapText(tester, 'Create new account');
      await tester.enterText(find.byType(TextFormField).at(0), 'María Santos');
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'maria@example.com',
      );
      await tester.enterText(find.byType(TextFormField).at(2), 'Sample123!');
      await tester.enterText(find.byType(TextFormField).at(3), 'Wrong123!');
      await tapText(tester, 'Sign up');
      expect(find.text('Passwords do not match.'), findsOneWidget);
      await tester.enterText(find.byType(TextFormField).at(3), 'Sample123!');
      await tapText(tester, 'Sign up');
      expect(find.text('Name received: María Santos'), findsOneWidget);
      final context = tester.element(find.text('Home screen placeholder'));
      expect(Navigator.canPop(context), isFalse);
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('small screen and keyboard leave both forms scrollable', (
    tester,
  ) async {
    await start(tester, size: const Size(320, 568));
    tester.view.viewInsets = const FakeViewPadding(bottom: 250);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpAndSettle();
    await tapText(tester, 'Create new account');
    await tapText(tester, 'Sign up');
    expect(find.text('Enter your full name.'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tapText(tester, 'Already have an account? Log in');
    expect(find.text('Create new account'), findsOneWidget);
>>>>>>> 114b604102c028d9ed107c22ad8bf5ef0124dddd
  });
}
