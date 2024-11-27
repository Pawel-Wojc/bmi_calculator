import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton(this._formKey,
      {super.key, required this.showCustomDialog(BuildContext context)});

  final GlobalKey<FormState> _formKey;
  final void Function(BuildContext context) showCustomDialog;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _formKey.currentState!.validate();
        if (_formKey.currentState!.validate()) {
          showCustomDialog(context);
        }
      },
      style: const ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFF412A9E)),
      ),
      child: const Text(
        "Calculate",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
