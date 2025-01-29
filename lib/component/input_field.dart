import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final double fontSize;
  final String hintText;
  final Color hintTextColor;
  final Color fillColor;
  final double borderRadius;
  final TextEditingController? controller;
  final int? maxLines;


  const InputField({
    Key? key,
    required this.labelText,
    required this.fontSize,
    required this.hintText,
    this.hintTextColor = Colors.grey,
    this.fillColor = const Color(0xFFf0f0f0),
    this.borderRadius = 15.0,
    this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ),
        SizedBox(height: fontSize / 2),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: hintTextColor),
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}