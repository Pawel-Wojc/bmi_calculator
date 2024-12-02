import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton(
    this.onPressed, {
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
