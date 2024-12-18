import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/bmi_data.dart';

part 'units_event.dart';
part 'units_state.dart';

class UnitsBloc extends Bloc<UnitsEvent, UnitsState> {
  UnitsBloc()
      : super(const UnitsInitial(UnitsSystem.metric, 'kilograms', 'meters')) {
    on<ChangeUnitsEvent>((event, emit) {
      emit(UnitsChanged(
          event.unit, event.unit.weightLabels, event.unit.heightLabels));
    });
  }
}
