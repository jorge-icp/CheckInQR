// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chechinqr/main.dart';

void main() {
  testWidgets('App shows loading message and refresh button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app shows the initial loading text.
    expect(find.text('Cargando ubicación...'), findsOneWidget);
    expect(find.text('Lat:'), findsNothing);

    // Verify that the refresh button is present.
    expect(find.byIcon(Icons.refresh), findsOneWidget);

    // You could add more tests here, for example, to mock the geolocator
    // and test the successful location retrieval and QR code display.
  });
}
