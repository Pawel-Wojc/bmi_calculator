import 'package:bmi_app/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:bmi_app/bloc/input_bloc/input_bloc.dart';
import 'package:bmi_app/bloc/units_bloc/units_bloc.dart';
import 'package:bmi_app/custom_alert_dialog.dart';
import 'package:bmi_app/custom_text_form_field.dart';
import 'package:bmi_app/services/calculate_service.dart';
import 'package:bmi_app/units_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bmi_results.dart';
import 'calculate_button.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MultiBlocProvider(
      providers: [
        BlocProvider<DialogBloc>(create: (_) => DialogBloc()),
        BlocProvider<UnitsBloc>(create: (_) => UnitsBloc()),
        BlocProvider<InputBloc>(
            create: (context) => InputBloc(context.read<UnitsBloc>()))
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "BMI Calculator",
            style:
                GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          UnitsButton(),
          const SizedBox(height: 20),
          Calculator(),
        ],
      ),
    ));
  }
}

class Calculator extends StatelessWidget {
  final String _heightUnit = 'meters';
  final String _weightUnit = 'kilograms';
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  Calculator({super.key});

  @override
  Widget build(BuildContext calculatorContext) {
    return Column(
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
                            child: BlocListener<UnitsBloc, UnitsState>(
                              listener: (context, state) {
                                final inputState =
                                    context.read<InputBloc>().state;

                                _heightController.text = inputState.height!;
                              },
                              child: CustomTextFormField(
                                  controller: _heightController,
                                  onChanged: (value) {
                                    calculatorContext
                                        .read<InputBloc>()
                                        .add(HeightChanged(value));
                                  },
                                  validate: (value) {
                                    return calculatorContext
                                        .read<InputBloc>()
                                        .state
                                        .heightError;
                                  },
                                  maxCharacters: 4),
                            )),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerRight,
                          child: BlocBuilder<UnitsBloc, UnitsState>(
                            builder: (context, state) {
                              return Text(
                                "(${state.heightUnit})",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              );
                            },
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
                          child: BlocListener<UnitsBloc, UnitsState>(
                              listener: (context, unitsState) {
                                final inputState =
                                    context.read<InputBloc>().state;
                                _weightController.text = inputState.weight!;
                              },
                              child: CustomTextFormField(
                                  onChanged: (value) {
                                    calculatorContext
                                        .read<InputBloc>()
                                        .add(WeightChanged(value));
                                  },
                                  controller: _weightController,
                                  validate: (value) {
                                    return calculatorContext
                                        .read<InputBloc>()
                                        .state
                                        .weightError;
                                  },
                                  maxCharacters: 6)),
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerRight,
                          child: BlocBuilder<UnitsBloc, UnitsState>(
                            builder: (context, state) {
                              return Text(
                                "(${state.weightUnit})",
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              );
                            },
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
              if (state is DialogOpen) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      var bmiResults = CalculateService.calculateBmi(
                          calculatorContext.read<InputBloc>().state.weight!,
                          calculatorContext.read<InputBloc>().state.height!);
                      return CustomAlertDialog(
                        contextFromCalculator: calculatorContext,
                        calculatedBmiCategory: bmiResults['category']!,
                      );
                    });
              }
            },
            child: Container()),
        CalculateButton(() {
          if (calculatorContext
              .read<InputBloc>()
              .state
              .isWeightAndHeightValid) {
            calculatorContext.read<DialogBloc>().add(const DialogOpenEvent());
          }
        }),
        BlocBuilder<DialogBloc, DialogState>(
          builder: (context, state) {
            if (!state.isOpen &&
                calculatorContext.read<InputBloc>().state.emailError == null) {
              var bmiResults = CalculateService.calculateBmi(
                  calculatorContext.read<InputBloc>().state.weight!,
                  calculatorContext.read<InputBloc>().state.height!);
              return BmiResults(
                  bmiValue: bmiResults['bmi']!,
                  bmiCategory: bmiResults['category']!);
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
