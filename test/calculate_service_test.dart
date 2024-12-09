import 'package:bmi_app/services/calculate_service.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator service', () {
    test('check the bmi is calculated properly', () {
      for (var height = 0.0; height < 2.4; height += 0.01) {
        for (var weight = 0.0; weight < 10; weight += 0.01) {
          final finalWeight = weight.toString();
          final finalHeight = height.toString();
          final result =
              CalculateService.calculateBmi(finalWeight, finalHeight);

          expect(
              result['bmi'], (weight / (height * height)).toStringAsFixed(2));
        }
      }
    });

    test('check all bmi value return category', () {
      for (var bmiValue = 0.0; bmiValue < 42; bmiValue += 0.001) {
        final category = CalculateService.getBmiCategory(bmiValue.toDouble());
        expect(category, isNot('Unknown'));
      }
    });
  });
}
