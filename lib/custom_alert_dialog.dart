import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text_form_field.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    super.key,
    required Map<String, String> Function() this.calculateBmi,
    required this.setEmail,
  });

  final Function() calculateBmi;
  final void Function(String email) setEmail;
  @override
  State<CustomAlertDialog> createState() {
    return _CustomAlertDialogState();
  }
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final _anotherFormKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 300,
        height: 250,
        child: Form(
          key: _anotherFormKey,
          child: Column(
            children: <Widget>[
              Text('Your are in:',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              Text(widget.calculateBmi()['category'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              Text('Category',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              Text('To see full information please enter your email',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              CustomTextFormField(
                  label: "E-mail",
                  validate: validateEmail,
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
            if (_anotherFormKey.currentState != null) {
              if (_anotherFormKey.currentState!.validate()) {
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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      print("empty");
      return '';
    }
    if (!value.contains('@')) {
      print("no @");
      return '';
    }
    return null;
  }
}
