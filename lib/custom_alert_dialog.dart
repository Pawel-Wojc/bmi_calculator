import 'package:bmi_app/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:bmi_app/bloc/input_bloc/input_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text_form_field.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.calculatedBmiCategory,
    this.dialogBloc,
    this.inputBloc,
  });

  final dialogBloc;
  final inputBloc;
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
                onChanged: (value) {
                  inputBloc.add(EmailChanged(value));
                },
                validate: (value) {
                  return inputBloc.state.emailError;
                },
                maxCharacters: 90,
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              inputBloc.add(EmailChanged(''));
              dialogBloc.add(const DialogCloseEvent());
              Navigator.pop(context, false);
            },
            child: Text('Cancel',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          TextButton(
            onPressed: () {
              dialogBloc.add(const DialogCloseEvent());
              if (inputBloc.state.emailError == null) {
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
