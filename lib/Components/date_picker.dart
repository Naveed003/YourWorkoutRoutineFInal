import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCustomeDatePicker extends StatefulWidget {
  final controller;
  final String label;
  final double width;
  const MyCustomeDatePicker({
    super.key,
    required this.controller,
    required this.label,
    required this.width,
  });

  @override
  State<MyCustomeDatePicker> createState() => _MyCustomeDatePickerState();
}

class _MyCustomeDatePickerState extends State<MyCustomeDatePicker> {
  @override
  Widget build(BuildContext context) {
    final double WIDTH = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: widget.width,
        height: 60,
        child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              icon: const Icon(Icons.calendar_today), //icon of text field
              labelText: widget.label,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400)),
              fillColor: Colors.grey.shade200,
              filled: true, //label text of field
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);

                setState(() {
                  widget.controller.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {}
            }),
      ),
    );
  }
}
