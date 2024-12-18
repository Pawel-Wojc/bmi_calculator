import 'package:bmi_app/bloc/input_bloc/input_bloc.dart';
import 'package:bmi_app/bloc/units_bloc/units_bloc.dart';
import 'package:bmi_app/data/bmi_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UnitsButton extends StatelessWidget {
  const UnitsButton();

  @override
  Widget build(BuildContext maincontext) {
    return BlocBuilder<UnitsBloc, UnitsState>(
      builder: (context, state) {
        return ToggleButtons(
          isSelected: [
            state.units == UnitsSystem.metric,
            state.units == UnitsSystem.imperial,
            state.units == UnitsSystem.oldPolish,
          ],
          onPressed: (index) {
            UnitsSystem unit;
            if (index == 0) {
              unit = UnitsSystem.metric;
            } else if (index == 1) {
              unit = UnitsSystem.imperial;
            } else {
              unit = UnitsSystem.oldPolish;
            }
            maincontext
                .read<InputBloc>()
                .add(RecalculateValues(state.units, unit));
            context.read<UnitsBloc>().add(ChangeUnitsEvent(unit));
          },
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 90.0,
          ),
          selectedColor: Colors.white,
          fillColor: const Color(0xFF412A9E),
          children: [
            Text(
              'Metric',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              'Imperial',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              'OldPolish',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        );
      },
    );
  }
}
