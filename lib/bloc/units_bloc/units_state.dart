part of 'units_bloc.dart';

@immutable
class UnitsState {
  UnitsSystem units;
  String weightUnit;
  String heightUnit;
  UnitsState(this.units, this.weightUnit, this.heightUnit);
}

final class UnitsInitial extends UnitsState {
  UnitsInitial(super.units, super.weightUnit, super.heightUnit);
}
