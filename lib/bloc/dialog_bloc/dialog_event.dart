part of 'dialog_bloc.dart';

abstract class DialogEvent {
  const DialogEvent();
}

@immutable
final class DialogOpenEvent extends DialogEvent {
  const DialogOpenEvent();
}

final class DialogCloseEvent extends DialogEvent {
  const DialogCloseEvent();
}
