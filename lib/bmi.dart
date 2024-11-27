import 'package:bmi_app/calculator_screen.dart';
import 'package:flutter/material.dart';

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFFF2F2F2), body: CalculatorScreen()),
    );
  }
}
