import 'package:bmi_app/calculator_screen.dart';
import 'package:flutter/material.dart';

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFFF2F2F2),
          body: Container(child: CalculatorScreen())),
    );
  }
}
