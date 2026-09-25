import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_dark_lab/app.dart';

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
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const InstagramLabApp());
    await tester.runAsync(() async {
      final context = tester.element(find.byType(Scaffold));
      await precacheImage(
        const AssetImage('assets/images/instagram_icon.png'),
        context,
      );
    });
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(Scaffold),
      matchesGoldenFile('previews/sign_in.png'),
    );
    await tester.tap(find.text('Create new account'));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(Scaffold),
      matchesGoldenFile('previews/sign_up.png'),
    );
  });
}
