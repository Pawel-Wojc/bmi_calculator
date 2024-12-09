import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiResults extends StatelessWidget {
  const BmiResults(
      {super.key, required this.bmiValue, required this.bmiCategory});

  final String bmiValue;
  final String bmiCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text("Your BMI: $bmiValue",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Text("You are in the $bmiCategory category",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
