import 'package:flutter/material.dart';

import '../Main/Dashboard.dart';

class reading_history extends StatelessWidget {
  final String mmhg;
  final String bpm;
  final String date;
  final Color bulletColor;

  const reading_history({
    Key? key,
    required this.mmhg,
    required this.bpm,
    required this.date,
    required this.bulletColor,
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
      padding: EdgeInsets.symmetric(horizontal: getFontSize(10, context)),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: getFontSize(28, context)),
              width: getFontSize(11, context),
              height: getFontSize(11, context),
              decoration: BoxDecoration(
                color: bulletColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: getFontSize(16, context)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      mmhg,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(18, context),
                      ),
                    ),
                    SizedBox(width: getFontSize(4, context)),
                    Text(
                      'mmHg',
                      style: TextStyle(fontSize: getFontSize(10, context)),
                    ),
                    SizedBox(width: getFontSize(16, context)),
                    Text(
                      bpm,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(18, context),
                      ),
                    ),
                    SizedBox(width: getFontSize(4, context)),
                    Text(
                      'BPM',
                      style: TextStyle(fontSize: getFontSize(10, context)),
                    ),
                  ],
                ),
                SizedBox(height: getFontSize(4, context)),
                Text(
                  date,
                  style: TextStyle(fontSize: getFontSize(10, context)),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: getFontSize(16, context),
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}
