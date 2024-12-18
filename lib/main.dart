import 'package:bmi_app/services/calculate_service.dart';
import 'package:bmi_app/services/validation_service.dart';
import 'package:bmi_app/view_properties.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'calculator.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      Provider(create: (_) => CalculateService()),
      Provider(create: (_) => ValidationService())
    ], child: const Bmi()),
  );
}

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const Scaffold(
          backgroundColor: Color(ViewProperties.mainColor),
          body: CalculatorScreen()),
    );
  }
}
