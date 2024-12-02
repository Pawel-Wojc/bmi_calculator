import 'package:bmi_app/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:bmi_app/bloc/input_bloc/input_bloc.dart';
import 'package:bmi_app/bmi_results.dart';
import 'package:bmi_app/custom_alert_dialog.dart';
import 'package:bmi_app/custom_text_form_field.dart';
import 'package:bmi_app/services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calculate_button.dart';

class CalculatorScreen extends StatelessWidget {
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
          MultiBlocProvider(
            providers: [
              BlocProvider<DialogBloc>(create: (_) => DialogBloc()),
              BlocProvider<InputBloc>(create: (_) => InputBloc())
            ],
            child: Calculator(),
          ),
        ],
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final String _heightUnit = 'meters';
  final String _weightUnit = 'kilograms';
  String? emailAddress;
  final _formKey = GlobalKey<FormState>();

  void setEmail(String email) {
    // setState(() {
    // emailAddress = email;
    //});
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
            //calculateBmi: calculateBmi()['category'] ?? "Unknown",
            calculateBmi: "Normal",
            setEmail: setEmail);
      },
    );
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
                                  onChanged: (value) {
                                    context
                                        .read<InputBloc>()
                                        .add(HeightChanged(value));
                                  },
                                  //validate: validateHeight,
                                  validate: (value) =>
                                      ValidationService.validateWeight(value),
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
                                  onChanged: (value) {
                                    context
                                        .read<InputBloc>()
                                        .add(WeightChanged(value));
                                  },
                                  //  validate: validateWeight,
                                  validate: (value) {
                                    if (context.read<InputBloc>().state
                                        is WeightValidState) {
                                      return null;
                                    } else
                                      "Enter valid state";
                                  },
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
          BlocListener<DialogBloc, DialogState>(
            listener: (context, state) {
              if (state.isOpen) {
                showCustomDialog(context);
              }
            },
            child: Container(),
          ),
          CalculateButton(() {
            if (_formKey.currentState!.validate()) {
              context.read<DialogBloc>().add(const DialogOpenEvent());
            }
          }),
          if (emailAddress != null)
            const BmiResults(
                //bmiValue: calculateBmi()['bmi'],
                //bmiCategory: calculateBmi()['category'],
                bmiValue: "20",
                bmiCategory: "Normal")
        ],
      ),
    );
  }
}
