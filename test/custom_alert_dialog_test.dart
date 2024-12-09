import 'package:bmi_app/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Check category showing correctly", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: CustomAlertDialog(
            calculatedBmiCategory: 'Big',
            contextFromCalculator: context,
          ),
        ),
      ),
    ));

    final category = find.text("You are in: Big category");
    final buttons = find.byType(TextButton);

    expect(category, findsOneWidget);
    expect(buttons, findsNWidgets(2));
  });
}
