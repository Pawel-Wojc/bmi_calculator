part of 'units_bloc.dart';

sealed class UnitsState {
  final UnitsSystem units;
  final String weightUnit;
  final String heightUnit;
  const UnitsState(this.units, this.weightUnit, this.heightUnit);
}

final class UnitsInitial extends UnitsState {
  const UnitsInitial(super.units, super.weightUnit, super.heightUnit);
}

final class UnitsChanged extends UnitsState {
  const UnitsChanged(super.units, super.weightUnit, super.heightUnit);
}
