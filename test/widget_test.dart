import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resat/src/app.dart';


void main() {
  testWidgets('My test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());
  });
}