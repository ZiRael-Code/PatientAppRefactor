import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Main/Dashboard.dart';
import '../component/device_item.dart';
import '../component/vitals_text_format.dart';
import '../components/colors/colours.dart';

class DevicesContent extends StatelessWidget {
  const DevicesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormat(
              text1: "Devices",
              text2: "View history of any vitals by directly tapping on their icons.",
            ),
            SizedBox(height: getFontSize(20, context)),
            Wrap(
              children: [
                DeviceItem(name: "BP2 Connect", imagePath: "assets/images/dev.svg"),
                SizedBox(width: getFontSize(20, context)),
                DeviceItem(name: "Device 2", imagePath: "assets/images/dev.svg"),
                DeviceItem(name: "Device 3", imagePath: "assets/images/dev.svg"),
                SizedBox(width: getFontSize(20, context)),
                Column(
                  children: [
                    Container(
                      width: getFontSize(73, context),
                      height: getFontSize(73, context),
                      decoration: BoxDecoration(
                        color: AppColors.blue[600],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.blue[700],
                        size: getFontSize(32, context),
                      ),
                    ),
                    Text('Order for a new device')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
