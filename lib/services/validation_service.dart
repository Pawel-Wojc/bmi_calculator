class ValidationService {
  static final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    value = value.replaceAll(',', '.');
    double? parsedValue;
    int index = value.indexOf('.');
    if (index != -1) {
      if (value.substring(index + 1).length > 2) {
        return '';
      }
    }
    try {
      parsedValue = double.parse(value);
    } catch (e) {
      return '';
    }
    if (parsedValue > 600 || parsedValue < 1) {
      return '';
    }
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
    if (parsedValue > 2.5 || parsedValue < 0.01) {
      return '';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    if (!(emailRegex.hasMatch(value))) {
      return '';
    }
    return null;
  }
}
