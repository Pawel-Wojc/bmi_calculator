import 'package:bmi_app/bmi_results.dart';
import 'package:bmi_app/custom_alert_dialog.dart';
import 'package:bmi_app/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calculate_button.dart';
import 'data/bmi_data.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final String _heightUnit = 'meters';
  final String _weightUnit = 'kilograms';
  String? emailAddress;
  final _formKey = GlobalKey<FormState>();

  void setEmail(String email) {
    setState(() {
      emailAddress = email;
    });
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
            calculateBmi: calculateBmi()['category'], setEmail: setEmail);
      },
    );
  }

  String getBmiCategory(double bmiValue) {
    for (var bmiRange in bmiRanges.entries) {
      if (bmiValue >= bmiRange.value[0] && bmiValue <= bmiRange.value[1]) {
        return bmiRange.key;
      }
    }
    return 'Unknown';
  }

  Map<String, String> calculateBmi() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text);
    double bmi = (weight / (height * height));
    return <String, String>{
      'bmi': bmi.toStringAsFixed(2),
      'category': getBmiCategory(bmi),
    };
  }

  String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    value = value.replaceAll(',', '.');
    double? parsedValue;
    try {
      parsedValue = double.parse(value);
    } catch (e) {
      return '';
    }
    if (parsedValue > 200 || parsedValue < 1) {
      return '';
    }
    //print(parsedValue);
    return null;
  }

  String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    value = value.replaceAll(',', '.');
    double? parsedValue;
    try {
      parsedValue = double.parse(value);
    } catch (e) {
      return '';
    }
    if (parsedValue > 2.5 || parsedValue < 0.5) {
      return '';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: 284,
            height: 173,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("Height:",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 20),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: 119,
                              height: 32,
                              child: CustomTextFormField(
                                  controller: _heightController,
                                  label: "($_heightUnit)",
                                  validate: validateHeight,
                                  maxCharacters: 4)),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "(meters)",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("Weight:",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 17),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: 119,
                              height: 32,
                              child: CustomTextFormField(
                                  controller: _weightController,
                                  label: "($_weightUnit)",
                                  validate: validateWeight,
                                  maxCharacters: 6)),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "(kilograms)",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // CalculateButton(_formKey)
          const SizedBox(height: 20),
          CalculateButton(_formKey, showCustomDialog: showCustomDialog),
          if (emailAddress != null)
            BmiResults(
              bmiValue: calculateBmi()['bmi'],
              bmiCategory: calculateBmi()['category'],
            )
        ],
      ),
    );
  }
}
