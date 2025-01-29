
import '../../components/colors/colours.dart';
import '../../Main/Dashboard.dart';




import 'package:flutter/material.dart';

class MyBlueButton extends StatelessWidget {
  final String text;
  MyBlueButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blue[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: AppColors.gray[100], fontWeight: FontWeight.bold, fontSize: getFontSize(16, context)),
        ),
      ),
    );
  }
}