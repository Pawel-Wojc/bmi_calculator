import 'package:bmi_app/data/bmi_data.dart';
import 'package:bmi_app/services/calculate_service.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator service', () {
    test('check the bmi is calculated properly in every unit', () {
      for (var height = 0.0; height < 2.4; height += 0.01) {
        for (var weight = 0.0; weight < 10; weight += 0.01) {
          var result =
              CalculateService.calculateBmi(weight, height, UnitsSystem.metric);
          expect(
              result['bmi'], (weight / (height * height)).toStringAsFixed(2));
        }
      }
    });

    test('check all bmi value return category', () {
      for (var bmiValue = 0.00; bmiValue < 42; bmiValue += 0.01) {
        final category = CalculateService.getBmiCategory(bmiValue.toDouble());
        expect(category, isNot('Unknown'));
      }
    });
  });
}
