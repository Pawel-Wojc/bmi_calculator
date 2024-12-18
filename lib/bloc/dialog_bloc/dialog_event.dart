part of 'dialog_bloc.dart';

sealed class DialogEvent {
  const DialogEvent();
}

@immutable
final class DialogOpenEvent extends DialogEvent {
  const DialogOpenEvent();
}

final class DialogCloseEvent extends DialogEvent {
  const DialogCloseEvent();
}
