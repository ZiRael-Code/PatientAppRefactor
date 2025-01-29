import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Main/Dashboard.dart';

class ReadingHistoryIcon extends StatelessWidget {
  final String icon;
  final Color themeColor;
  final String name;

  const ReadingHistoryIcon({
    Key? key,
    required this.icon,
    required this.themeColor,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: getFontSize(86, context),
          height: getFontSize(86, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: themeColor,
          ),
          margin: EdgeInsets.only(right: getFontSize(20, context)),
          child: Center(child: SvgPicture.asset(icon)),
        ),
        SizedBox(height: getFontSize(2, context)),
        Container(
          width: getFontSize(86, context),
          margin: EdgeInsets.only(right: getFontSize(20, context)),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: getFontSize(14, context)),
          ),
        ),
        SizedBox(height: getFontSize(20, context)),
      ],
    );
  }
}
