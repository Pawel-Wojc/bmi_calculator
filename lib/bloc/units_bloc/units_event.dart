part of 'units_bloc.dart';

abstract class UnitsEvent {}

class ChangeUnitsEvent extends UnitsEvent {
  final UnitsSystem unit;

  ChangeUnitsEvent(this.unit);
}
