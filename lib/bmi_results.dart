import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiResults extends StatelessWidget {
  const BmiResults(
      {super.key, required this.bmiValue, required this.bmiCategory});

  final bmiValue;
  final bmiCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Your BMI is: $bmiValue",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold)),
          Text("You are in the $bmiCategory category",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
