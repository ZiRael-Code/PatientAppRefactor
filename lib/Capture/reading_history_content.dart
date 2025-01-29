import 'package:flutter/material.dart';
import 'package:flutter_app/component/irregular_reading_history.dart';

import '../Main/Dashboard.dart';
import '../MeasureBloodPresure.dart';
import '../MeasureHearthRate.dart';
import '../component/reading_history.dart';
import '../component/vitals_text_format.dart';
import '../components/colors/colours.dart';
import '../components/reading_history_icon.dart';

class HistoryContent extends StatelessWidget {
  const HistoryContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: getFontSize(30, context)),

            // Text Format Section
            TextFormat(
              text1: "Measure Readings",
              text2: 'Select what vitals you want to measure',
            ),

            SizedBox(height: getFontSize(20, context)),

            // Wrap for icons and readings
            Wrap(
              direction: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MeasureHearthRate()),
                    );
                  },
                  child: ReadingHistoryIcon(
                    icon: "assets/images/hearth2.svg",
                    themeColor: AppColors.pink[700],
                    name: "Heart rate",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MeasureBloodPresure()),
                    );
                  },
                  child: ReadingHistoryIcon(
                    icon: "assets/images/presure.svg",
                    themeColor: Color(0xFFA64FFE),
                    name: "Blood pressure",
                  ),
                ),
                ReadingHistoryIcon(
                  icon: "assets/images/oxy.svg",
                  themeColor: Color(0xFF2C68BF),
                  name: "Oxygen saturation",
                ),
                ReadingHistoryIcon(
                  icon: "assets/images/st.svg",
                  themeColor: Color(0xFFFF6161),
                  name: "Stress level",
                ),
                ReadingHistoryIcon(
                  icon: "assets/images/bg.svg",
                  themeColor: Color(0xFF3C8AFF),
                  name: "Blood glucose",
                ),
                ReadingHistoryIcon(
                  icon: "assets/images/bt.svg",
                  themeColor: Color(0xFFFF8E3C),
                  name: "Body Temperature",
                ),
              ],
            ),

            SizedBox(height: getFontSize(15, context)),

            // Readings History Header
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Readings History',
                style: TextStyle(
                  fontSize: getFontSize(18, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: getFontSize(10, context)),

            // Reading History List
            reading_history(
              mmhg: "107/60",
              bpm: "67",
              date: "Today, 12:00 am",
              bulletColor: Colors.lightGreenAccent,
            ),
            SizedBox(height: getFontSize(10, context)),
            reading_history(
              mmhg: "125/60",
              bpm: "88",
              date: "14 Jul 2022, 12:00 am",
              bulletColor: Color(0xFFFAB400),
            ),
            SizedBox(height: getFontSize(10, context)),

            IrregularReadingHistory(
              date: "14 Jul 2022, 12:00 am",
              text: "Irregular ECG",
              stackColor: Color(0xFFFAB400),
            ),
            SizedBox(height: getFontSize(10, context)),
            reading_history(
              mmhg: "125/68",
              bpm: "88",
              date: "14 Jul 2022, 12:00 am",
              bulletColor: Color(0xFFFF6161),
            ),
          ],
        ),
      ),
    );
  }
}
