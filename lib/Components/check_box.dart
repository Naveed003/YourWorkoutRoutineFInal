import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const MyCheckBox({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  Color getColor(Set<MaterialState> states) {
    // const Set<MaterialState> interactiveStates = <MaterialState>{
    //   MaterialState.pressed,
    //   MaterialState.hovered,
    //   MaterialState.focused,
    // };

    return Colors.brown.shade700;
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
            value: isChecked,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
                widget.controller.text = value.toString();
              });
            }),
        Text(widget.label),
      ],
    );
  }
}
