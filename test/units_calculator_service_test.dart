import 'package:bmi_app/data/bmi_data.dart';
import 'package:bmi_app/services/units_calculator_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Units calculation service height', () {
    test('check conversion from metric to imperial', () {
      for (var height = 0.01; height < 2.4; height += 0.01) {
        final result = UnitsCalculatorService.recalculateHeight(
            UnitsSystem.metric, UnitsSystem.imperial, height.toString());
        final expected = (height / 0.3048).toStringAsFixed(2);
        expect(result, expected);
      }
    });

    test('check conversion from metric to old polish', () {
      for (var height = 0.01; height < 2.4; height += 0.01) {
        final result = UnitsCalculatorService.recalculateHeight(
            UnitsSystem.metric, UnitsSystem.oldPolish, height.toString());
        final expected = (height / 0.5955).toStringAsFixed(2);
        expect(result, expected);
      }
    });

    test('check conversion from imperial to  metric', () {
      for (var height = 0.01; height < 8.2; height += 0.01) {
        final result = UnitsCalculatorService.recalculateHeight(
            UnitsSystem.imperial, UnitsSystem.metric, height.toString());
        final expected = (height * 0.3048).toStringAsFixed(2);
        expect(result, expected);
      }
    });
    test('check conversion from imperial to old polish', () {
      for (var height = 0.03; height < 8.2; height += 0.01) {
        final result = UnitsCalculatorService.recalculateHeight(
            UnitsSystem.imperial, UnitsSystem.oldPolish, height.toString());

        //first convert to metric
        final expected = ((height * 0.3048) / 0.5955).toStringAsFixed(2);
        expect(result, expected);
      }
    });

    test('check conversion from old polish to metric', () {
      for (var height = 0.03; height < 4.2; height += 0.01) {
        final result = UnitsCalculatorService.recalculateHeight(
            UnitsSystem.oldPolish, UnitsSystem.metric, height.toString());
        final expected = (height * 0.5955).toStringAsFixed(2);
        expect(result, expected);
      }
    });
    test('check conversion from old polish to imperial', () {
      for (var height = 0.03; height < 4.2; height += 0.01) {
        final result = UnitsCalculatorService.recalculateHeight(
            UnitsSystem.oldPolish, UnitsSystem.imperial, height.toString());

        //first convert to metric
        final expected = ((height * 0.5955) / 0.3048).toStringAsFixed(2);
        expect(result, expected);
      }
    });
  });

  group("Units calculation service weight", () {
    test('check conversion from metric to imperial', () {
      for (var weight = 0.02; weight < 5; weight += 0.01) {
        final result = UnitsCalculatorService.recalculateWeight(
            UnitsSystem.metric, UnitsSystem.imperial, weight.toString());
        final expected = (weight / 0.4535).toStringAsFixed(2);
        expect(result, expected);
      }
    });
    test('check conversion from metric to old polish', () {
      for (var weight = 0.02; weight < 5; weight += 0.01) {
        final result = UnitsCalculatorService.recalculateWeight(
            UnitsSystem.metric, UnitsSystem.oldPolish, weight.toString());
        final expected = (weight / 0.4052).toStringAsFixed(2);
        expect(result, expected);
      }
    });
    test('check conversion from imperial to metric', () {
      for (var weight = 0.02; weight < 1324; weight += 0.01) {
        final result = UnitsCalculatorService.recalculateWeight(
            UnitsSystem.imperial, UnitsSystem.metric, weight.toString());
        final expected = (weight * 0.4535).toStringAsFixed(2);
        expect(result, expected);
      }
    });
    test('check conversion from imperial to old polish', () {
      for (var weight = 0.02; weight < 1324; weight += 0.01) {
        final result = UnitsCalculatorService.recalculateWeight(
            UnitsSystem.imperial, UnitsSystem.oldPolish, weight.toString());
        final expected = ((weight * 0.4535) / 0.4052).toStringAsFixed(2);
        expect(result, expected);
      }
    });
    test('check conversion from old polish to metric', () {
      for (var weight = 0.02; weight < 1480; weight += 0.01) {
        final result = UnitsCalculatorService.recalculateWeight(
            UnitsSystem.oldPolish, UnitsSystem.metric, weight.toString());
        final expected = (weight * 0.4052).toStringAsFixed(2);
        expect(result, expected);
      }
    });
    test('check conversion from old polish to imperial', () {
      for (var weight = 0.02; weight < 1480; weight += 0.01) {
        final result = UnitsCalculatorService.recalculateWeight(
            UnitsSystem.oldPolish, UnitsSystem.imperial, weight.toString());
        final expected = ((weight * 0.4052) / 0.4535).toStringAsFixed(2);
        expect(result, expected);
      }
    });
  });
}
