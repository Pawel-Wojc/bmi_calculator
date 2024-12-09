import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.validate,
    required this.maxCharacters,
    this.onChanged,
  });

  final Function(String)? onChanged;

  final String label;
  final int maxCharacters;
  final Function(String?) validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChanged!(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return validate(value);
      },
      maxLength: maxCharacters,
      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
      decoration: const InputDecoration(
        labelStyle: TextStyle(
            color: Color(0xFFA3A3A3),
            fontSize: 12,
            fontWeight: FontWeight.w400),
        counterText: "",
        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        filled: true,
        fillColor: Color(0xFFD9D9D9),
        errorStyle: TextStyle(fontSize: 0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.red, width: 2), // Error border
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
