import 'package:bloc/bloc.dart';

class ValidateBloc extends Bloc<String, String> {
  ValidateBloc() : super('') {
    on<String>(_heidhtValidationEvent);
  }

  void _heidhtValidationEvent(event, Emitter<String> emit) {
    if (event.isEmpty) {
      emit('Height cannot be empty');
    } else {
      emit('');
    }
  }
}
