import 'package:bmi_app/services/validation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/bmi_data.dart';
import '../../services/units_calculator_service.dart';
import '../units_bloc/units_bloc.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  final UnitsBloc unitBloc;
  InputBloc(this.unitBloc)
      : super(InputInitial('', '', '', '', '', '', false)) {
    on<WeightChanged>((event, emit) {
      final weightError =
          ValidationService.validateWeight(event.weight, unitBloc.state.units);
      var isWeightAndHeightValid =
          weightError == null && state.heightError == null;

      emit(ChangeState(state.emailError, state.email, state.heightError,
          state.height, weightError, event.weight, isWeightAndHeightValid));
    });

    on<HeightChanged>((event, emit) {
      final heightError =
          ValidationService.validateHeight(event.height, unitBloc.state.units);
      var isWeightAndHeightValid =
          heightError == null && state.weightError == null;
      emit(ChangeState(state.emailError, state.email, heightError, event.height,
          state.weightError, state.weight, isWeightAndHeightValid));
    });

    on<EmailChanged>((event, emit) {
      final emailError = ValidationService.validateEmail(event.email);
      print('email changed');
      var isWeightAndHeightValid =
          state.weightError == null && state.heightError == null;
      emit(ChangeState(emailError, event.email, state.heightError, state.height,
          state.weightError, state.weight, isWeightAndHeightValid));
    });

    on<RecalculateValues>((event, emit) {
      final weightError =
          ValidationService.validateWeight(state.weight, event.oldUnit);
      final heightError =
          ValidationService.validateHeight(state.height, event.oldUnit);
      var isWeightAndHeightValid = weightError == null && heightError == null;

      String? newHeight;
      if (state.height != null) {
        newHeight = UnitsCalculatorService.recalculateHeight(
            event.oldUnit, event.newUnit, state.height!);
      }

      String? newWeight = state.weight;
      if (state.weight != null && heightError == null) {
        newWeight = UnitsCalculatorService.recalculateWeight(
            event.oldUnit, event.newUnit, state.weight!);
      }

      emit(ChangeState(state.emailError, state.email, heightError, newHeight,
          weightError, newWeight, isWeightAndHeightValid));
    });
  }
}
