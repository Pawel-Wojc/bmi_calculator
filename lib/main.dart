import 'package:flutter/material.dart';

import 'calculator.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFFF2F2F2), body: CalculatorScreen()),
    );
  }
}
