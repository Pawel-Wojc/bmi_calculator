import 'package:bmi_app/services/units_calculator_service.dart';

import '../data/bmi_data.dart';

class ValidationService {
  static final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static String? validateWeight(String? value, UnitsSystem units) {
    if (value == null || value.isEmpty) {
      return '';
    }
    value = value.replaceAll(',', '.');
    double? parsedValue;
    int index = value.indexOf('.');

    value = UnitsCalculatorService.recalculateWeight(
        units, UnitsSystem.metric, value);
    print('validation weight: $value');
    if (index != -1) {
      if (value.substring(index + 1).length > 2) {
        return '';
      }
    }
    try {
      parsedValue = double.parse(value);
    } catch (e) {
      return '';
    }
    if (parsedValue > 600 || parsedValue < 1) {
      return '';
    }
    return null;
  }

  static String? validateHeight(String? value, UnitsSystem units) {
    if (value == null || value.isEmpty) {
      return '';
    }
    value = value.replaceAll(',', '.');
    double? parsedValue;

    value = UnitsCalculatorService.recalculateHeight(
        units, UnitsSystem.metric, value);
    print('validation height: $value');
    try {
      parsedValue = double.parse(value);
    } catch (e) {
      return '';
    }
    if ((parsedValue > 2.5) || parsedValue < 0.01) {
      print(parsedValue);
      return '';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    if (!(emailRegex.hasMatch(value))) {
      return '';
    }
    return null;
  }
}
