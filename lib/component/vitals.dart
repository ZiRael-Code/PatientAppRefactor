import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Main/Dashboard.dart';
import '../components/colors/colours.dart';

class vital extends StatelessWidget {
  final Color themeColor;
  final String vitalIcon;
  final String vitalRead;
  final String subcriptOrnot;
  final bool isSubscript;
  final String vitalType;
  final String dateAdded;
  final String vitalsReadMessage;
  final BuildContext context; // If needed for getFontSize

  const vital({
    Key? key,
    required this.themeColor,
    required this.vitalIcon,
    required this.vitalRead,
    required this.subcriptOrnot,
    required this.isSubscript,
    required this.vitalType,
    required this.dateAdded,
    required this.vitalsReadMessage,
    required this.context, // If getFontSize requires context
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getFontSize(3, context)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: themeColor.withOpacity(0.1),
                width: getFontSize(1.5, context),
              ),
            ),
            height: getFontSize(186, context),
            width: getFontSize(156, context),
            margin: EdgeInsets.only(bottom: getFontSize(10, context)),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset('assets/images/vt.svg', color: themeColor),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getFontSize(15, context), vertical: getFontSize(15, context)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: getFontSize(45, context),
                          height: getFontSize(45, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: themeColor,
                          ),
                          child: Center(child: SvgPicture.asset(vitalIcon)),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            vitalRead,
                            style: TextStyle(
                              fontSize: getFontSize(37.0, context),
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),
                          ),
                          Text(
                            subcriptOrnot,
                            style: TextStyle(
                              fontSize: getFontSize(10.0, context),
                              color: themeColor,
                              fontWeight: isSubscript ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getFontSize(30, context)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          vitalType,
                          style: TextStyle(
                            fontSize: getFontSize(14.0, context),
                            color: AppColors.gray[100],
                          ),
                        ),
                      ),
                      SizedBox(height: getFontSize(2, context)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          dateAdded,
                          style: TextStyle(
                            fontSize: getFontSize(9.0, context),
                            color: AppColors.gray[100],
                          ),
                        ),
                      ),
                    ],
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
