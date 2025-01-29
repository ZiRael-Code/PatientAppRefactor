import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Main/Dashboard.dart';
import '../components/colors/colours.dart';

class DeviceItem extends StatelessWidget {
  final String name;
  final String imagePath;

  const DeviceItem({
    Key? key,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: getFontSize(143, context),
          height: getFontSize(143, context),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: getFontSize(1, context),
              color: AppColors.gray[700].withOpacity(0.2),
            ),
          ),
          child: Center(
            child: SvgPicture.asset(imagePath),
          ),
        ),
        SizedBox(height: getFontSize(10, context)),
        Text(
          name,
          style: TextStyle(
            fontSize: getFontSize(16, context),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: getFontSize(20, context)),
      ],
    );
  }
}
