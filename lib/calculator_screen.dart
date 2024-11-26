import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() {
    return _CalculatorScreen();
  }
}

class _CalculatorScreen extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "BMI Calculator",
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          const Calculator(),
        ],
      ),
    );
  }
}
