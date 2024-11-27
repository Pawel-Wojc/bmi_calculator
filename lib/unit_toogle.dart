import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UnitToggle extends StatefulWidget {
  const UnitToggle({super.key, required this.onToggle});

  final void Function(bool) onToggle;

  @override
  State<UnitToggle> createState() {
    return _UnitToggleState();
  }
}

class _UnitToggleState extends State<UnitToggle> {
  int initialLabelIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      initialLabelIndex: initialLabelIndex,
      minWidth: 80.0,
      minHeight: 30.0,
      cornerRadius: 20.0,
      activeBgColors: [
        [Colors.green[800]!],
        [Colors.green[800]!]
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: ['Metric', 'Imperial'],
      radiusStyle: true,
      onToggle: (index) {
        setState(() {
          initialLabelIndex = index!;
        });
        widget.onToggle(initialLabelIndex == 0);
      },
    );
  }
}
