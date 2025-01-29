import 'package:flutter/material.dart';

import '../Main/Dashboard.dart';
import '../components/colors/colours.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final bool hasBorder;

  const ActionButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: hasBorder ? Border.all(color: AppColors.blue[700]!) : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: getFontSize(16, context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
