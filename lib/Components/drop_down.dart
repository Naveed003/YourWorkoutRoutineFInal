import 'package:flutter/material.dart';

class MyDropDownMenu extends StatefulWidget {
  final TextEditingController controller;
  final double width;

  const MyDropDownMenu(
      {super.key, required this.controller, required this.width});

  @override
  State<MyDropDownMenu> createState() => _MyDropDownMenuState();
}

class _MyDropDownMenuState extends State<MyDropDownMenu> {
  String val = 'Male';

  @override
  Widget build(BuildContext context) {
    final double WIDTH = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: widget.width,
        height: 60,
        child: DropdownButtonFormField(
          value: widget.controller.text,
          icon: Icon(Icons.arrow_drop_down),
          items: const [
            DropdownMenuItem(
              value: 'Male',
              child: Text('Male'),
            ),
            DropdownMenuItem(
              value: 'Female',
              child: Text('Female'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              widget.controller.text = value.toString();
              val = value.toString();
            });
          },
          decoration: InputDecoration(
            icon: const Icon(Icons.male_outlined), //icon of text field
            labelText: 'SEX',
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true, //label text of field
          ),
        ),
      ),
    );
    // return DropdownButton(
    //   hint: Text('Sex'),
    //   // isExpanded: true,
    //   icon: Icon(Icons.arrow_drop_down),
    //   items: widget.listItems.map((valueItem) {
    //     return DropdownMenuItem(
    //       value: valueItem,
    //       child: Text(valueItem),
    //     );
    //   }).toList(),
    //   onChanged: (newValue) {
    //     setState(() {
    //       widget.controller.text = newValue.toString();
    //     });
    //   },
    // );
  }
}
