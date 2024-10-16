import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro/main.dart' as main_app; // Use a prefix for main.dart

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const main_app.MyApp()); // Use the prefix to call MyApp

    // Add your widget test assertions here
    // For example:
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Your widget interaction
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
