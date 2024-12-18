import '../data/bmi_data.dart';

class UnitsCalculatorService {
  // type here the ratio of values
  // example: 1 imperial foot = 0.3048 meters
  // 1 old polish pound = 0.4052 kg
  static const imperialHeightRatio = 0.3048;
  static const imperialWeightRatio = 0.4535;
  static const oldPolishHeightRatio = 0.5955;
  static const oldPolishWeightRatio = 0.4052;
  static double recalculateHeight(
      UnitsSystem oldUnit, UnitsSystem newUnit, double value) {
    if (oldUnit == newUnit) {
      return value;
    }

    switch (oldUnit) {
      case UnitsSystem.imperial:
        value = value * imperialHeightRatio;
        break;
      case UnitsSystem.oldPolish:
        value = value * oldPolishHeightRatio;
        break;
      default:
        break;
    }

    //then, convert to new unit
    switch (newUnit) {
      case UnitsSystem.imperial:
        value = value / imperialHeightRatio;
        break;
      case UnitsSystem.oldPolish:
        value = value / oldPolishHeightRatio;
        break;
      default:
        break;
    }
    return value;
  }

  static double recalculateWeight(
      UnitsSystem oldUnit, UnitsSystem newUnit, double value) {
    if (oldUnit == newUnit) {
      return value;
    }
    //convert to metric
    switch (oldUnit) {
      case UnitsSystem.metric:
        break;
      case UnitsSystem.imperial:
        value = value * imperialWeightRatio;
        break;
      case UnitsSystem.oldPolish:
        value = value * oldPolishWeightRatio;
        break;
    }

    //convert to new unit
    switch (newUnit) {
      case UnitsSystem.metric:
        break;
      case UnitsSystem.imperial:
        value = value / imperialWeightRatio;
        break;
      case UnitsSystem.oldPolish:
        value = value / oldPolishWeightRatio;
        break;
    }
    return value;
  }
}
