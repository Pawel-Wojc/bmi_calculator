import 'package:bmi_app/data/bmi_data.dart';

class BmiCategory {
  String getBmiCategory(double bmiValue) {
    for (var entry in bmiRanges.entries) {
      if (bmiValue >= entry.value[0] && bmiValue <= entry.value[1]) {
        return entry.key;
      }
    }
    return 'Unknown';
  }
}
