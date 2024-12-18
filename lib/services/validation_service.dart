import 'package:bmi_app/services/units_calculator_service.dart';

import '../data/bmi_data.dart';

class ValidationService {
  static final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  String? validateWeight(double? value, UnitsSystem units) {
    if (value == null) {
      return 'Weight cant be null/empty';
    }

    value = UnitsCalculatorService.recalculateWeight(
        units, UnitsSystem.metric, value);
    if (value > maxMetricValues['weight']!) {
      return 'Weight to big';
    } else if (value < minMetricValues['weight']!) {
      return 'Weight to small';
    }
    return null;
  }

  String? validateHeight(double? value, UnitsSystem units) {
    if (value == null) {
      return 'Value cant be null';
    }

    value = UnitsCalculatorService.recalculateHeight(
        units, UnitsSystem.metric, value);

    if ((value > maxMetricValues['height']!)) {
      return 'Value to big';
    } else if (value < minMetricValues['height']!) {
      return 'Value to small';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cant be empty';
    }

    if (!(emailRegex.hasMatch(value))) {
      return 'Email not match regex';
    }
    return null;
  }
}
