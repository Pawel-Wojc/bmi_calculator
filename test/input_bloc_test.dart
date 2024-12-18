import 'package:bloc_test/bloc_test.dart';
import 'package:bmi_app/bloc/input_bloc/input_bloc.dart';
import 'package:bmi_app/bloc/units_bloc/units_bloc.dart';
import 'package:bmi_app/data/bmi_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Input bloc test group", () {
    late InputBloc inputBloc;
    late UnitsBloc unitsBloc;
    setUp(() {
      unitsBloc = UnitsBloc();
      inputBloc = InputBloc(unitsBloc);
    });

    tearDown(() {
      inputBloc.close();
      unitsBloc.close();
    });

    test("Initial state is correct", () {
      expect(inputBloc.state.email, '');
      expect(inputBloc.state.emailError, '');
      expect(inputBloc.state.height, null);
      expect(inputBloc.state.heightError, '');
      expect(inputBloc.state.weight, null);
      expect(inputBloc.state.weightError, '');
      expect(inputBloc.state.isWeightAndHeightValid, false);
    });

    blocTest<InputBloc, InputState>(
        'Check after change only weight fields, state is correct',
        build: () => inputBloc,
        act: (bloc) => bloc.add(WeightChanged(72)),
        expect: () => [
              isA<InputState>()
                  .having((state) => state.weight, 'weight', 72)
                  .having((state) => state.weightError, 'weightError', null)
                  .having((state) => state.isWeightAndHeightValid,
                      'isWeightAndHeightValid', false)
            ]);
    blocTest<InputBloc, InputState>(
        'Check after change only height fields, state is correct',
        build: () => inputBloc,
        act: (bloc) => bloc.add(HeightChanged(2)),
        expect: () => [
              isA<InputState>()
                  .having((state) => state.height, 'height', 2)
                  .having((state) => state.heightError, 'heightError', null)
                  .having((state) => state.isWeightAndHeightValid,
                      'isWeightAndHeightValid', false)
            ]);

    blocTest<InputBloc, InputState>(
        'Check after change only email fields, state is correct',
        build: () => inputBloc,
        act: (bloc) => bloc.add(EmailChanged('email@email.com')),
        expect: () => [
              isA<InputState>()
                  .having((state) => state.email, 'email', 'email@email.com')
                  .having((state) => state.emailError, 'emailError', null)
                  .having((state) => state.isWeightAndHeightValid,
                      'isWeightAndHeightValid', false)
            ]);

    blocTest('Check after change weight and height',
        build: () => inputBloc,
        act: (bloc) {
          bloc.add(WeightChanged(73));
          bloc.add(HeightChanged(1));
        },
        expect: () => [
              isA<InputState>()
                  .having((state) => state.weight, 'weight', 73)
                  .having((state) => state.weightError, 'weightError', null)
                  .having((state) => state.isWeightAndHeightValid,
                      'isWeightAndHeightValid', false),
              isA<InputState>()
                  .having((state) => state.height, 'height', 1)
                  .having((state) => state.heightError, 'heightError', null)
                  .having((state) => state.isWeightAndHeightValid,
                      'isWeightAndHeightValid', true)
            ]);

    blocTest('Check units change',
        build: () => inputBloc,
        act: (bloc) {
          bloc.add(WeightChanged(100));
          bloc.add(HeightChanged(1));
          bloc.add(RecalculateValues(UnitsSystem.metric, UnitsSystem.imperial));
        },
        expect: () => [
              isA<InputState>()
                  .having((state) => state.weight, 'weight', 100)
                  .having((state) => state.weightError, 'weightError', null)
                  .having((state) => state.isWeightAndHeightValid,
                      'isWeightAndHeightValid', false),
              isA<InputState>()
                  .having((state) => state.height, 'height', 1)
                  .having((state) => state.heightError, 'heightError', null)
                  .having((state) => state.isWeightAndHeightValid,
                      'isWeightAndHeightValid', true),
              isA<InputState>()
                  .having((state) => state.weight, 'weight',
                      220.5071664829107) //3,28  220,51
                  .having((state) => state.weightError, 'weightError', null)
                  .having((state) => state.height, 'height', 3.280839895013123)
                  .having((state) => state.heightError, 'heightError', null)
                  .having((state) => state.isWeightAndHeightValid,
                      'isWeightAndHeightValid', true)
            ]);
  });
}
