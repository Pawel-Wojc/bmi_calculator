import 'package:bloc_test/bloc_test.dart';
import 'package:bmi_app/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Dialog bloc test", () {
    late DialogBloc dialogBloc;

    setUp(() {
      dialogBloc = DialogBloc();
    });

    tearDown(() {
      dialogBloc.close();
    });

    test("Initial state is correct", () {
      expect(dialogBloc.state.isOpen, DialogInitial(false).isOpen);
    });
    blocTest<DialogBloc, DialogState>('Check after open, dialog is open',
        build: () => dialogBloc,
        act: (bloc) => bloc.add(const DialogOpenEvent()),
        expect: () => [
              isA<DialogOpen>().having((state) => state.isOpen, 'isOpen', true)
            ]);
  });
}
