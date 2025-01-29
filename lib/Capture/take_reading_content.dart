import 'package:flutter/material.dart';

import '../Main/Dashboard.dart';
import '../Main/MeasureVitalsManuallyMenu.dart';
import '../component/build_action_button.dart';
import '../component/vitals.dart';
import '../component/vitals_text_format.dart';
import '../components/colors/colours.dart';

class TakeReadingsContent extends StatelessWidget {
  const TakeReadingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormat(
              text1: "Measure Readings",
              text2: 'Select what vitals you want to measure',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  vital(
                    themeColor: AppColors.pink[700],
                    vitalIcon: 'assets/images/hearth.svg',
                    vitalRead: '77',
                    subcriptOrnot: 'bpm',
                    isSubscript: true,
                    vitalType: 'Heart rate (ECG)',
                    dateAdded: 'Measured 10mins ago',
                    vitalsReadMessage: 'NORMAL',
                    context: context,
                  ),
                  vital(
                    themeColor: Colors.purple,
                    vitalIcon: 'assets/images/bloodpressure.svg',
                    vitalRead: '90/60',
                    subcriptOrnot: 'mmHg',
                    isSubscript: true,
                    vitalType: 'Blood pressure',
                    dateAdded: '5 days ago',
                    vitalsReadMessage: 'ABNORMAL',
                    context: context,
                  ),
                  vital(
                    themeColor: Colors.deepOrange,
                    vitalIcon: 'assets/images/tunder.svg',
                    vitalRead: '77',
                    subcriptOrnot: 'bpm',
                    isSubscript: true,
                    vitalType: 'Heart rate (ECG)',
                    dateAdded: 'Measured 10mins ago',
                    vitalsReadMessage: 'NORMAL',
                    context: context,

                  ),
                  vital(
                    themeColor: Color(0xFF2C68BF),
                    vitalIcon: 'assets/images/02.svg',
                    vitalRead: '95%',
                    subcriptOrnot: ' ',
                    isSubscript: false,
                    vitalType: 'Oxygen saturation',
                    dateAdded: '5 days ago',
                    vitalsReadMessage: 'ABNORMAL',
                    context: context,
                  ),
                ],
              ),
            ),
            SizedBox(height: getFontSize(20, context)),
            Text(
              "If you don't have the device, you can still measure by clicking the button below",
              style: TextStyle(fontSize: getFontSize(18, context)),
            ),
            SizedBox(height: getFontSize(20, context)),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MeasureVitalsManuallyMenu(),
                ));
              },
              child: ActionButton(text: 'Capture Manually', backgroundColor:  AppColors.blue[700], textColor:  AppColors.gray[100]),
            ),
            SizedBox(height: getFontSize(10, context)),
            ActionButton(text: 'Request for the Device', backgroundColor: Colors.transparent, textColor:  AppColors.blue[700], hasBorder: true),
            SizedBox(height: getFontSize(20, context)),
          ],
        ),
      ),
    );
  }
}
