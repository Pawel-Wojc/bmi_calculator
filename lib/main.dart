import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calculator.dart';

void main() {
  runApp(const Bmi());
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
          backgroundColor: Color(0xFFF2F2F2), body: CalculatorScreen()),
    );
  }
}
