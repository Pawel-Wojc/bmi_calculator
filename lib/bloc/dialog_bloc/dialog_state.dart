part of 'dialog_bloc.dart';

sealed class DialogState {
  bool isOpen;
  DialogState(this.isOpen);
}

final class DialogInitial extends DialogState {
  DialogInitial(super.isOpen);
}

final class DialogOpen extends DialogState {
  DialogOpen(super.isOpen);
}

final class DialogClose extends DialogState {
  DialogClose(super.isOpen);
}
