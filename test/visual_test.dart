import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_screen/app.dart';

void main() {
  testWidgets('render mobile sign in and sign up', (tester) async {
    final font = FontLoader('Roboto')
      ..addFont(
        Future.value(
          ByteData.sublistView(
            File('test/fonts/roboto-regular.ttf').readAsBytesSync(),
          ),
        ),
      );
    await font.load();

    final icons = FontLoader('MaterialIcons')
      ..addFont(
        Future.value(
          ByteData.sublistView(
            File('test/fonts/materialicons-regular.otf').readAsBytesSync(),
          ),
        ),
      );
    await icons.load();

    await tester.pumpWidget(const InstagramLabApp());
    await tester.pumpAndSettle();
  });
}