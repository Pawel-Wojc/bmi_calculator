import 'package:bmi_app/services/units_calculator_service.dart';

import '../data/bmi_data.dart';

class CalculateService {
  static Map<String, String> calculateBmi(
      String weightValue, String heightValue, UnitsSystem units) {
    double? weight;
    double? height;
    weightValue = weightValue.replaceAll(",", ".");
    heightValue = heightValue.replaceAll(",", ".");
    weightValue = UnitsCalculatorService.recalculateWeight(
        units, UnitsSystem.metric, weightValue);
    heightValue = UnitsCalculatorService.recalculateHeight(
        units, UnitsSystem.metric, heightValue);

    try {
      weight = double.parse(weightValue);
      height = double.parse(heightValue);
    } catch (e) {
      return <String, String>{
        'bmi': '0',
        'category': 'Unknown',
      };
    }
    double bmi = (weight / (height * height));
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
