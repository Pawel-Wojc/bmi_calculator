import 'package:bmi_app/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:bmi_app/bloc/input_bloc/input_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text_form_field.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.calculatedBmiCategory,
    required this.contextFromCalculator,
  });

  final BuildContext contextFromCalculator;
  final String calculatedBmiCategory;

  @override
  Widget build(context) {
    return AlertDialog(
        content: SizedBox(
          width: 300,
          height: 250,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text("You are in: $calculatedBmiCategory category",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(height: 10),
              Text('To see full information please enter your email',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: "E-mail",
                onChanged: (value) {
                  contextFromCalculator
                      .read<InputBloc>()
                      .add(EmailChanged(value));
                },
                validate: (value) {
                  return contextFromCalculator
                      .read<InputBloc>()
                      .state
                      .emailError;
                },
                maxCharacters: 90,
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              contextFromCalculator.read<InputBloc>().add(EmailChanged(''));
              contextFromCalculator
                  .read<DialogBloc>()
                  .add(const DialogCloseEvent());
              Navigator.pop(context, false);
            },
            child: Text('Cancel',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          TextButton(
            onPressed: () {
              contextFromCalculator
                  .read<DialogBloc>()
                  .add(const DialogCloseEvent());
              if (contextFromCalculator.read<InputBloc>().state.emailError ==
                  null) {
                Navigator.pop(context, true);
              }
            },
            child: Text('Check BMI',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ]);
  }
}
