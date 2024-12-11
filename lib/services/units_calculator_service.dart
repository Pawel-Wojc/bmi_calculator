import '../data/bmi_data.dart';

class UnitsCalculatorService {
  static String recalculateHeight(
      UnitsSystem oldUnit, UnitsSystem newUnit, String value) {
    if (oldUnit == newUnit) {
      return value;
    }

    double newValue;
    try {
      newValue = double.parse(value);
    } catch (e) {
      return value;
    }

    //convert to metric
    switch (oldUnit) {
      case UnitsSystem.metric:
        newValue = newValue;
        break;
      case UnitsSystem.imperial:
        newValue = newValue * 0.3048;
        break;
      case UnitsSystem.oldPolish:
        newValue = newValue * 0.5955;
        break;
    }

    //convert to new unit
    switch (newUnit) {
      case UnitsSystem.metric:
        break;
      case UnitsSystem.imperial:
        newValue = newValue / 0.3048;
        break;
      case UnitsSystem.oldPolish:
        newValue = newValue / 0.5955;
        break;
    }
    return newValue.toStringAsFixed(2);
  }

  static String recalculateWeight(
      UnitsSystem oldUnit, UnitsSystem newUnit, String value) {
    if (oldUnit == newUnit) {
      return value;
    }
    double newValue;
    try {
      newValue = double.parse(value);
    } catch (e) {
      return value;
    }

    //convert to metric
    switch (oldUnit) {
      case UnitsSystem.metric:
        newValue = newValue;
        break;
      case UnitsSystem.imperial:
        newValue = newValue * 0.4052;
        break;
      case UnitsSystem.oldPolish:
        newValue = newValue * 0.4535;
        break;
    }

    //convert to new unit
    switch (newUnit) {
      case UnitsSystem.metric:
        break;
      case UnitsSystem.imperial:
        newValue = newValue / 0.4052;
        break;
      case UnitsSystem.oldPolish:
        newValue = newValue / 0.4535;
        break;
    }
    return newValue.toStringAsFixed(2);
  }
}
