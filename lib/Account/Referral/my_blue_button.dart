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
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: getFontSize(16, context)),
        ),
      ),
    );
  }
}