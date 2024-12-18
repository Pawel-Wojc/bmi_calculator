import 'package:bmi_app/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomTextFormField should accept input and validate it',
      (WidgetTester tester) async {
    final controller = TextEditingController();
    String? validationMessage;

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextFormField(
            controller: controller,
            maxCharacters: 100,
            validate: (value) {
              if (value == null || value.isEmpty) {
                validationMessage = 'Input cannot be empty';
                return validationMessage;
              }
              validationMessage = null;
              return null;
            },
            onChanged: (value) {},
          ),
        ),
      ),
    );

    // Find the CustomTextFormField widget
    final textField = find.byType(CustomTextFormField);

    // Simulate entering text
    const inputText = 'test@example.com';
    await tester.enterText(textField, inputText);
    await tester
        .pumpAndSettle(); // Ensure all animations and widget rebuilds settle

    // Verify the input text
    expect(controller.text, inputText);

    // Simulate entering empty text to trigger validation
    await tester.enterText(textField, '');
    await tester.pumpAndSettle();

    // Verify the validation message
    expect(validationMessage, 'Input cannot be empty');
  });
}
