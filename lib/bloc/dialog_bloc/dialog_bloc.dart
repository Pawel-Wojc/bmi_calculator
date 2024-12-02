import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dialog_event.dart';
part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  DialogBloc() : super(DialogInitial(false)) {
    on<DialogOpenEvent>((event, emit) {
      emit(DialogOpen(true));
    });
    on<DialogCloseEvent>((event, emit) {
      emit(DialogClose(false));
    });
  }
}
