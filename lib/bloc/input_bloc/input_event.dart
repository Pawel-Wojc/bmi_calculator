part of 'input_bloc.dart';

@immutable
sealed class InputEvent {}

class WeightChanged extends InputEvent {
  final double? weight;
  WeightChanged.fromString(String weight)
      : weight = double.tryParse(weight.replaceAll(',', '.'));
  WeightChanged(double this.weight);
}

class HeightChanged extends InputEvent {
  final double? height;
  HeightChanged.fromString(String height)
      : height = double.tryParse(height.replaceAll(',', '.'));

  HeightChanged(double this.height);
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
