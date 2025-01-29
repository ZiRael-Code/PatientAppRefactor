
import 'package:flutter/material.dart';

import '../components/colors/colours.dart';

class BlueBackgroundButton extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;

  const BlueBackgroundButton({
    Key? key,
    required this.label,
    required this.fontSize,
    this.backgroundColor = const Color(0xFF3C8AFF),
    this.borderRadius = 15.0,
    this.padding = const EdgeInsets.symmetric(vertical: 15.0),
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.gray[100],
          fontSize: fontSize,
        ),
      ),
    );
  }
}