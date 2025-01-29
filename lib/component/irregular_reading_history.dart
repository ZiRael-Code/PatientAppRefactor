import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Main/Dashboard.dart';

class IrregularReadingHistory extends StatelessWidget {
  final String text;
  final String date;
  final Color stackColor;

  const IrregularReadingHistory({
    Key? key,
    required this.text,
    required this.date,
    required this.stackColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getFontSize(85, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(right: getFontSize(10, context)),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              "assets/images/irr.svg",
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(width: getFontSize(16, context)),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(18, context),
                      ),
                    ),
                    SizedBox(height: getFontSize(5, context)),
                    Text(
                      date,
                      style: TextStyle(fontSize: getFontSize(10, context)),
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: getFontSize(16, context),
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
