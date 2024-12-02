import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text_form_field.dart';

class CustomAlertDialog extends StatefulWidget {
  CustomAlertDialog({
    super.key,
    required this.calculateBmi,
    required this.setEmail,
  });

  final String calculateBmi;
  final void Function(String email) setEmail;
  @override
  State<CustomAlertDialog> createState() {
    return _CustomAlertDialogState();
  }
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final _dialogFormKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); //clean form after close dialog
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 300,
        height: 250,
        child: Form(
          key: _dialogFormKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text("You are in: ${widget.calculateBmi} category",
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
                  validate: (value) {
                    return null;
                  },
                  maxCharacters: 90,
                  controller: _controller),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('Cancel',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600)),
        ),
        TextButton(
          onPressed: () {
            if (_dialogFormKey.currentState != null) {
              if (_dialogFormKey.currentState!.validate()) {
                Navigator.pop(context, true);
                widget.setEmail(_controller.text);
              }
            }
          },
          child: Text('Check BMI',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
