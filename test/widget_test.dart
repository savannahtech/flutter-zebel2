// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:logintest/main.dart';

void main() {

  testWidgets('Login smoke test', (widgetTester) async {
    Widget testWidget = MediaQuery(
        data: const MediaQueryData(), child: MaterialApp(home: LoginScreen()));
    await widgetTester.pumpWidget(testWidget);
    // check when taps on login but password is empty
    await widgetTester.tap(find.byKey(const Key('btnLogin')));
    // add text to password textfield
    await widgetTester.enterText(find.bySemanticsLabel('Password'), 'pass1234');
    // check when taps on login after tenter text in password field
    await widgetTester.tap(find.byKey(const Key('btnLogin')));

    await widgetTester.pump();

  });
}
