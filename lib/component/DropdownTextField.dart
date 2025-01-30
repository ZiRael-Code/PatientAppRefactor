import 'package:flutter/material.dart';

class DropdownTextField extends StatefulWidget {
  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  TextEditingController _controller = TextEditingController();
  final List<String> _options = ["Blood Pressure", "Heart Rate", "Temperature"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            suffixIcon: PopupMenuButton<String>(
              icon: Icon(Icons.keyboard_arrow_down),
              onSelected: (String value) {
                setState(() {
                  _controller.text = value;
                });
              },
              itemBuilder: (BuildContext context) {
                return _options.map((String option) {
                  return PopupMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList();
              },
            ),
            hintText: 'e.g blood pressure',
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            filled: true,
            fillColor: Colors.grey[300],
            contentPadding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 10.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
