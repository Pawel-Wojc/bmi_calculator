import '../data/bmi_data.dart';

class UnitsCalculatorService {
  // type here the ratio of values
  // example: 1 imperial foot = 0.3048 meters
  // 1 old polish pound = 0.4052 kg
  static const imperialHeightRatio = 0.3048;
  static const imperialWeightRatio = 0.4535;
  static const oldPolishHeightRatio = 0.5955;
  static const oldPolishWeightRatio = 0.4052;
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

    //first, convert to metric from any unit
    switch (oldUnit) {
      case UnitsSystem.imperial:
        newValue = newValue * imperialHeightRatio;
        break;
      case UnitsSystem.oldPolish:
        newValue = newValue * oldPolishHeightRatio;
        break;
      default:
        break;
    }

    //then, convert to new unit
    switch (newUnit) {
      case UnitsSystem.imperial:
        newValue = newValue / imperialHeightRatio;
        break;
      case UnitsSystem.oldPolish:
        newValue = newValue / oldPolishHeightRatio;
        break;
      default:
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
        break;
      case UnitsSystem.imperial:
        newValue = newValue * imperialWeightRatio;
        break;
      case UnitsSystem.oldPolish:
        newValue = newValue * oldPolishWeightRatio;
        break;
    }

    //convert to new unit
    switch (newUnit) {
      case UnitsSystem.metric:
        break;
      case UnitsSystem.imperial:
        newValue = newValue / imperialWeightRatio;
        break;
      case UnitsSystem.oldPolish:
        newValue = newValue / oldPolishWeightRatio;
        break;
    }
    return newValue.toStringAsFixed(2);
  }
}
