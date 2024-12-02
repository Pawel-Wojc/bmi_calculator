part of 'input_bloc.dart';

@immutable
sealed class InputState {}

class InputInitialState extends InputState {}

class WeightValidState extends InputState {}

class WeightInvalidState extends InputState {}

class HeightValidState extends InputState {}

class HeightInvalidState extends InputState {}

class EmailValidState extends InputState {}

class EmailInvalidState extends InputState {}

class FormValidState extends InputState {}

class FormInvalidState extends InputState {}
