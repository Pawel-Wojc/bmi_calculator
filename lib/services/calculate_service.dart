import '../data/bmi_data.dart';

class CalculateService {
  Map<String, String> calculateBmi(String weightValue, String heightValue) {
    double? weight;
    double? height;
    weightValue = weightValue.replaceAll(",", ".");
    heightValue = heightValue.replaceAll(",", ".");

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

  String getBmiCategory(double bmiValue) {
    for (var bmiRange in bmiRanges.entries) {
      if (bmiValue >= bmiRange.value[0] && bmiValue <= bmiRange.value[1]) {
        return bmiRange.key;
      }
    }
    return 'Unknown';
  }
}
