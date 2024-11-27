import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calculator.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

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
