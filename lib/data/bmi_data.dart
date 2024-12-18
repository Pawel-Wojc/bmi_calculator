// Map<String, List<double>> bmiRanges = {
//   'Underweight (Severe thinness)': [0, 15.9],
//   'Underweight (Moderate thinness)': [16.0, 16.9],
//   'Underweight (Mild thinness)': [17.0, 18.4],
//   'Normal': [18.5, 24.9],
//   'Overweight (Pre-obese)': [25, 29.9],
//   'Obese (Class I)': [30, 34.9],
//   'Obese (Class II)': [35, 39.9],
//   'Obese (Class III)': [40, double.infinity],
// };

Map<String, List<double>> bmiRangesNew = {
  'Underweight (Severe thinness)': [0, 16.0],
  'Underweight (Moderate thinness)': [16.0, 17.0],
  'Underweight (Mild thinness)': [17.0, 18.5],
  'Normal': [18.5, 25.0],
  'Overweight (Pre-obese)': [25.0, 30.0],
  'Obese (Class I)': [30.0, 35.0],
  'Obese (Class II)': [35.0, 40.0],
  'Obese (Class III)': [40, double.infinity],
};

enum UnitsSystem {
  metric,
  imperial,
  oldPolish;

  String get weightLabels {
    switch (this) {
      case UnitsSystem.metric:
        return 'kilogram';
      case UnitsSystem.imperial:
        return 'pound';
      case UnitsSystem.oldPolish:
        return 'pound';
    }
  }

  String get heightLabels {
    switch (this) {
      case UnitsSystem.metric:
        return 'meters';
      case UnitsSystem.imperial:
        return 'foot';
      case UnitsSystem.oldPolish:
        return 'elbow';
    }
  }
}

const Map<String, double> maxMetricValues = {
  'weight': 600,
  'height': 2.5,
};
const Map<String, double> minMetricValues = {
  'weight': 0.01,
  'height': 0.01,
};
