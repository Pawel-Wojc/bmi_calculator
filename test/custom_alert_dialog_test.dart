import 'package:bmi_app/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:bmi_app/bloc/input_bloc/input_bloc.dart';
import 'package:bmi_app/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockDialogBloc extends Mock implements DialogBloc {}

class MockInputBloc extends Mock implements InputBloc {}

void main() {
  testWidgets("Check category showing correctly", (tester) async {
    final mockInputBloc = MockInputBloc();
    final mockDialogBloc = MockDialogBloc();

    when(mockInputBloc.state).thenReturn(InputState(
      null,
      '',
      null,
      2.0,
      null,
      34.0,
      true,
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<InputBloc>.value(value: mockInputBloc),
          Provider<DialogBloc>.value(value: mockDialogBloc),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => const Scaffold(
              body: CustomAlertDialog(
                calculatedBmiCategory: 'Big',
              ),
            ),
          ),
        ),
      ),
    );

    final category = find.text("You are in: Big category");
    final buttons = find.byType(TextButton);
    final inputField = find.byType(TextField);

    expect(inputField, findsOneWidget);
    expect(category, findsOneWidget);
    expect(buttons, findsNWidgets(2));
  });

  testWidgets("onChanged should trigger EmailChanged event", (tester) async {
    final mockInputBloc = MockInputBloc();
    final mockDialogBloc = MockDialogBloc();

    when(mockInputBloc.state).thenReturn(InputState(
      null,
      '',
      null,
      2.0,
      null,
      34.0,
      true,
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<InputBloc>.value(value: mockInputBloc),
          Provider<DialogBloc>.value(value: mockDialogBloc),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => const Scaffold(
              body: CustomAlertDialog(
                calculatedBmiCategory: 'Big',
              ),
            ),
          ),
        ),
      ),
    );

    final inputField = find.byType(TextField);
    await tester.enterText(inputField, 'test@example.com');
    await tester.pumpAndSettle();

    verify(mockInputBloc.add(EmailChanged('test@example.com'))).called(1);
  });

  testWidgets("validate should show error message", (tester) async {
    final mockInputBloc = MockInputBloc();
    final mockDialogBloc = MockDialogBloc();

    when(mockInputBloc.state).thenReturn(InputState(
      'Invalid email',
      '',
      null,
      2.0,
      null,
      34.0,
      true,
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<InputBloc>.value(value: mockInputBloc),
          Provider<DialogBloc>.value(value: mockDialogBloc),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => const Scaffold(
              body: CustomAlertDialog(
                calculatedBmiCategory: 'Big',
              ),
            ),
          ),
        ),
      ),
    );

    final inputField = find.byType(TextField);
    await tester.enterText(inputField, 'invalid email');
    await tester.pumpAndSettle();

    expect(find.text('Invalid email'), findsOneWidget);
  });

  testWidgets("onPressed should close dialog and trigger events",
      (tester) async {
    final mockInputBloc = MockInputBloc();
    final mockDialogBloc = MockDialogBloc();

    when(mockInputBloc.state).thenReturn(InputState(
      null,
      '',
      null,
      2.0,
      null,
      34.0,
      true,
    ));

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<InputBloc>.value(value: mockInputBloc),
          Provider<DialogBloc>.value(value: mockDialogBloc),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => const Scaffold(
              body: CustomAlertDialog(
                calculatedBmiCategory: 'Big',
              ),
            ),
          ),
        ),
      ),
    );

    final checkBmiButton = find.text('Check BMI');
    await tester.tap(checkBmiButton);
    await tester.pumpAndSettle();

    verify(mockDialogBloc.add(const DialogCloseEvent())).called(1);
    expect(find.byType(AlertDialog), findsNothing);
  });
}
