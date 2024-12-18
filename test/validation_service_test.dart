import 'package:bmi_app/data/bmi_data.dart';
import 'package:bmi_app/services/validation_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Weight validation", () {
    late ValidationService validationService;

    setUp(() {
      validationService = ValidationService();
    });

    test('check valid metric weights', () {
      final List<double> validWeights = [1.0, 1.0, 1.1, 1.01, 590.33];
      final List<double> invalidWeights = [0.0, -32.0, -0.01, 0.003];
      for (var weight in validWeights) {
        var result =
            validationService.validateWeight(weight, UnitsSystem.metric);
        expect(result, null);
      }
      for (var weight in invalidWeights) {
        var result =
            validationService.validateWeight(weight, UnitsSystem.metric);
        expect(result, isA<String>());
      }
    });
    test('check valid imperial weights', () {
      final List<double> validWeights = [1320.0, 1320.33];
      final List<double> invalidWeights = [1900.0];
      for (var weight in validWeights) {
        var result =
            validationService.validateWeight(weight, UnitsSystem.imperial);
        expect(result, null);
      }
      for (var weight in invalidWeights) {
        var result =
            validationService.validateWeight(weight, UnitsSystem.imperial);
        expect(result, isA<String>());
      }
    });
    test('check valid old polish weights', () {
      final List<double> validWeights = [1.0, 1.01, 1.1, 1.01, 1480.0];
      final List<double> invalidWeights = [0.0, -32.0, -0.01, 1490.0];
      for (var weight in validWeights) {
        var result =
            validationService.validateWeight(weight, UnitsSystem.oldPolish);
        expect(result, null);
      }
      for (var weight in invalidWeights) {
        var result =
            validationService.validateWeight(weight, UnitsSystem.oldPolish);
        expect(result, isA<String>());
      }
    });
  });

  group('Height validation ', () {
    late ValidationService validationService;

    setUp(() {
      validationService = ValidationService();
    });

    test('check valid metric heights', () {
      final List<double> validHeights = [1.0, 1.0, 1.1, 1.01, 2.5];
      final List<double> invalidHeights = [0.0, -32.0, -0.01, 0.003, 8.23];
      for (var height in validHeights) {
        var result =
            validationService.validateHeight(height, UnitsSystem.metric);
        expect(result, null);
      }
      for (var height in invalidHeights) {
        var result =
            validationService.validateHeight(height, UnitsSystem.metric);
        expect(result, isA<String>());
      }
    });
    test('check valid imperial heights', () {
      final List<double> validHeights = [0.1, 8.2, 3.45, 0.31, 4.20];
      final List<double> invalidHeights = [0.0, -32.0, -0.01, 0.003, 8.53];
      for (var height in validHeights) {
        var result =
            validationService.validateHeight(height, UnitsSystem.imperial);
        expect(result, null);
      }
      for (var height in invalidHeights) {
        var result =
            validationService.validateHeight(height, UnitsSystem.imperial);
        expect(result, isA<String>());
      }
    });
    test('check valid old polish heights', () {
      final List<double> validHeights = [1.0, 1.0, 1.1, 1.01, 2.5];
      final List<double> invalidHeights = [0.0, -32.0, -0.01, 0.003, 4.23];
      for (var height in validHeights) {
        var result =
            validationService.validateHeight(height, UnitsSystem.oldPolish);
        expect(result, null);
      }
      for (var height in invalidHeights) {
        var result =
            validationService.validateHeight(height, UnitsSystem.oldPolish);
        expect(result, isA<String>());
      }
    });
  });
  group('Email validation', () {
    late ValidationService validationService;

    setUp(() {
      validationService = ValidationService();
    });
    test('check valid emails', () {
      final List<String> validEmails = [
        'email@wp.pl',
        'email@kolejny.pl',
        'ema@asd.dsa',
        'bardzodlugiemail@zdlugadomena.eu',
        'as@wd.dl'
      ];
      for (var email in validEmails) {
        var result = validationService.validateEmail(email);
        expect(result, null);
      }
    });

    test('check invalid emails', () {
      final List<String> inValidEmails = [
        'email@wp',
        'email@wp.',
        'asd@wp.',
        'asd@@wp.pl',
        'asd@',
        'wtf@wp.pl@wp.pl',
        'wasdwdaswp.pl',
        '@wp.pl',
        'a@w.a',
      ];
      for (var email in inValidEmails) {
        var result = validationService.validateEmail(email);
        expect(result, isA<String>());
      }
    });
  });
}
