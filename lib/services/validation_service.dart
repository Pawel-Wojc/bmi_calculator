import 'package:bmi_app/services/units_calculator_service.dart';

import '../data/bmi_data.dart';

class ValidationService {
  static final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static String? validateWeight(String? value, UnitsSystem units) {
    if (value == null || value.isEmpty) {
      return 'Weight cant be null/empty';
    }
    value = value.replaceAll(',', '.');
    double? parsedValue;
    int index = value.indexOf('.');

    value = UnitsCalculatorService.recalculateWeight(
        units, UnitsSystem.metric, value);
    if (index != -1) {
      if (value.substring(index + 1).length > 2) {
        return 'To many digits in weight';
      }
    }
    try {
      parsedValue = double.parse(value);
    } catch (e) {
      return 'Cant parse weight';
    }
    if (parsedValue > maxMetricValues['weight']!) {
      return 'Weight to big';
    } else if (parsedValue < minMetricValues['weight']!) {
      return 'Weight to small';
    }
    return null;
  }

  static String? validateHeight(String? value, UnitsSystem units) {
    if (value == null || value.isEmpty) {
      return 'Value cant be null';
    }
    value = value.replaceAll(',', '.');
    double? parsedValue;

    value = UnitsCalculatorService.recalculateHeight(
        units, UnitsSystem.metric, value);

    try {
      parsedValue = double.parse(value);
    } catch (e) {
      return 'Cant parse value';
    }
    if ((parsedValue > maxMetricValues['height']!)) {
      return 'Value to big';
    } else if (parsedValue < minMetricValues['height']!) {
      return 'Value to small';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cant be empty';
    }

    if (!(emailRegex.hasMatch(value))) {
      return 'Email not match regex';
    }
    return null;
  }
}
