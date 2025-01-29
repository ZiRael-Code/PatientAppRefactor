import 'package:flutter/material.dart';

import '../Main/Dashboard.dart';

class TextFormat extends StatelessWidget {
  final String text1;
  final String text2;

  const TextFormat({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getFontSize(18, context),
          ),
        ),
        SizedBox(height: getFontSize(10, context)),
        Container(
          width: getFontSize(263, context),
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: getFontSize(16, context)),
          ),
        ),
        SizedBox(height: getFontSize(25, context)),
      ],
    );
  }
}
