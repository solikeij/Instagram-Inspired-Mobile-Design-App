import 'package:flutter_test/flutter_test.dart';
import 'package:home_screen/app.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const InstagramLabApp());
    expect(find.byType(InstagramLabApp), findsOneWidget);
  });
}