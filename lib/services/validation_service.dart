class ValidationService {
  static final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9]{2,}@[a-zA-Z0-9]{2,}\.[a-zA-Z]{2,}$');
  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    value = value.replaceAll(',', '.');
    double? parsedValue;
    try {
      parsedValue = double.parse(value);
    } catch (e) {
      return '';
    }
    if (parsedValue > 200 || parsedValue < 1) {
      return '';
    }
    //print(parsedValue);
    return null;
  }

  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    value = value.replaceAll(',', '.');
    double? parsedValue;
    try {
      parsedValue = double.parse(value);
    } catch (e) {
      return '';
    }
    if (parsedValue > 2.5 || parsedValue < 0.5) {
      return '';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    if (emailRegex.hasMatch(value)) {
      return '';
    }
    return null;
  }
}
