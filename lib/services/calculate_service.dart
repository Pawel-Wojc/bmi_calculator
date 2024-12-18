import 'package:bmi_app/services/units_calculator_service.dart';

import '../data/bmi_data.dart';

class CalculateService {
  static Map<String, String> calculateBmi(
      double weightValue, double heightValue, UnitsSystem units) {
    weightValue = UnitsCalculatorService.recalculateWeight(
        units, UnitsSystem.metric, weightValue);
    heightValue = UnitsCalculatorService.recalculateHeight(
        units, UnitsSystem.metric, heightValue);

    double bmi = (weightValue / (heightValue * heightValue));
    return <String, String>{
      'bmi': bmi.toStringAsFixed(2),
      'category': getBmiCategory(bmi),
    };
  }

  static String getBmiCategory(double bmiValue) {
    //for (var bmiRange in bmiRanges.entries) {
    for (var bmiRange in bmiRangesNew.entries) {
      if (bmiValue >= bmiRange.value[0] && bmiValue <= bmiRange.value[1]) {
        return bmiRange.key;
      }
    }
    return 'Unknown';
  }
}
