part of 'input_bloc.dart';

sealed class InputState {
  String? emailError; //errors for input fields
  String? heightError;
  String? weightError;
  String? email;
  double? height;
  double? weight;
  bool isWeightAndHeightValid; //state to block or not opening dialog bloc

  InputState(this.emailError, this.email, this.heightError, this.height,
      this.weightError, this.weight, this.isWeightAndHeightValid);
}

final class InputInitial extends InputState {
  InputInitial(super.emailError, super.email, super.heightError, super.height,
      super.weightError, super.weight, super.isWeightAndHeightValid);
}

final class ChangeState extends InputState {
  ChangeState(super.emailError, super.email, super.heightError, super.height,
      super.weightError, super.weight, super.isWeightAndHeightValid);
}
