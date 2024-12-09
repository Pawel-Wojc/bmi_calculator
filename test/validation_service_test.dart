import 'package:bmi_app/services/validation_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validation service', () {
    test('check valid emails', () {
      final List<String> validEmails = [
        'email@wp.pl',
        'email@kolejny.pl',
        'ema@asd.dsa',
        'bardzodlugiemail@zdlugadomena.eu',
        'as@wd.dl'
      ];
      for (var email in validEmails) {
        var result = ValidationService.validateEmail(email);
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
        var result = ValidationService.validateEmail(email);
        expect(result, isA<String>());
      }
    });
  });
}
