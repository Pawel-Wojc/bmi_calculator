part of 'input_bloc.dart';

@immutable
sealed class InputEvent {}

class WeightChanged extends InputEvent {
  final String weight;
  WeightChanged(this.weight);
}

class HeightChanged extends InputEvent {
  final String height;
  HeightChanged(this.height);
}

class EmailChanged extends InputEvent {
  final String email;
  EmailChanged(this.email);
}

class RecalculateValues extends InputEvent {
  final UnitsSystem oldUnit;
  final UnitsSystem newUnit;
  RecalculateValues(this.oldUnit, this.newUnit);
}
