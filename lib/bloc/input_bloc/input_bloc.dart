import 'package:bloc/bloc.dart';
import 'package:bmi_app/services/validation_service.dart';
import 'package:meta/meta.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  InputBloc() : super(InputInitialState()) {
    on<InputEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  @override
  Stream<InputState> mapEventToState(InputEvent event) async* {
    if (event is WeightChanged) {
      if (event.weight.isNotEmpty) {
        if (ValidationService.validateWeight(event.weight) == null) {
          yield WeightValidState();
        } else {
          yield WeightInvalidState();
        }
      } else {
        yield WeightInvalidState();
      }
    } else if (event is HeightChanged) {
      if (event.height.isNotEmpty) {
        if (ValidationService.validateHeight(event.height) == null) {
          yield HeightValidState();
        } else {
          yield HeightInvalidState();
        }
      } else {
        yield HeightInvalidState();
      }
    } else if (event is EmailChanged) {
      if (event.email.isNotEmpty) {
        if (ValidationService.validateEmail(event.email) == null) {
          yield EmailValidState();
        } else {
          yield EmailInvalidState();
        }
      } else {
        yield EmailInvalidState();
      }
    }
  }
}
