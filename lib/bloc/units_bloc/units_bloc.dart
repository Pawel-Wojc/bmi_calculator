import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/bmi_data.dart';

part 'units_event.dart';
part 'units_state.dart';

class UnitsBloc extends Bloc<UnitsEvent, UnitsState> {
  UnitsBloc() : super(UnitsInitial(UnitsSystem.metric, 'kilograms', 'meters')) {
    on<ChangeUnitsEvent>((event, emit) {
      emit(UnitsState(
          event.unit, getWeightLabel(event.unit), getHeightLabel(event.unit)));
    });
  }

  String getHeightLabel(UnitsSystem unit) {
    for (var label in heightLabels.entries) {
      if (unit == label.key) {
        return label.value;
      }
    }
    return '';
  }

  String getWeightLabel(UnitsSystem unit) {
    for (var label in weightLabels.entries) {
      if (unit == label.key) {
        return label.value;
      }
    }
    return '';
  }
}
