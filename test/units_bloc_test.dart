import 'package:bloc_test/bloc_test.dart';
import 'package:bmi_app/bloc/units_bloc/units_bloc.dart';
import 'package:bmi_app/data/bmi_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Units bloc test group", () {
    late UnitsBloc unitsBloc;
    setUp(() {
      unitsBloc = UnitsBloc();
    });

    tearDown(() {
      unitsBloc.close();
    });

    test("Initial state is correct", () {
      expect(unitsBloc.state.units, UnitsSystem.metric);
    });

    blocTest<UnitsBloc, UnitsState>(
        'Check after change to imperial, units are imperial',
        build: () => unitsBloc,
        act: (bloc) => bloc.add(ChangeUnitsEvent(UnitsSystem.imperial)),
        expect: () => [
              isA<UnitsState>()
                  .having((state) => state.units, 'units', UnitsSystem.imperial)
            ]);
  });
}
