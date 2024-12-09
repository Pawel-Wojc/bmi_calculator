import 'package:bloc/bloc.dart';
import 'package:bmi_app/services/validation_service.dart';
import 'package:meta/meta.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  InputBloc() : super(InputInitial('', '', '', '', '', '', false)) {
    on<WeightChanged>((event, emit) {
      final weightError = ValidationService.validateWeight(event.weight);
      var isWeightAndHeightValid =
          weightError == null && state.heightError == null;
      emit(ChangeState(state.emailError, state.email, state.heightError,
          state.height, weightError, event.weight, isWeightAndHeightValid));
    });

    on<HeightChanged>((event, emit) {
      final heightError = ValidationService.validateHeight(event.height);
      var isWeightAndHeightValid =
          heightError == null && state.weightError == null;
      emit(ChangeState(state.emailError, state.email, heightError, event.height,
          state.weightError, state.weight, isWeightAndHeightValid));
    });

    on<EmailChanged>((event, emit) {
      final emailError = ValidationService.validateEmail(event.email);
      var isWeightAndHeightValid =
          state.weightError == null && state.heightError == null;
      emit(ChangeState(emailError, event.email, state.heightError, state.height,
          state.weightError, state.weight, isWeightAndHeightValid));
    });
  }
}
