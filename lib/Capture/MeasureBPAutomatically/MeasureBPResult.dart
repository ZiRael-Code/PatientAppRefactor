import 'package:flutter_app/component/build_action_button.dart';

import '../../components/colors/colours.dart';
import '../../../Main/Dashboard.dart';
import '../../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureBPResult());
}

class MeasureBPResult extends StatefulWidget {
  MeasureBPResult({super.key});
  @override
  _MeasureBPScreen createState() => _MeasureBPScreen();
}

class _MeasureBPScreen extends  State<MeasureBPResult> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
          onTap: () => popMultipleTimes(context, 2),
          child: 
              Container(
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),),
              ),
              ),

              Spacer(),
              Container(
                alignment: Alignment.center,
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: Center(child: Icon(Icons.share)),
              ),

            ],
          ),
          centerTitle: true,
        ),
        body:
        Container(
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: getFontSize(30, context)),

        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: getFontSize(0.1, context))
          ),
           child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SYS/DA text at the top
                // Adding some space between the rows

                // Row with main value and container
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Main value (107/60)
                      Text(
                        '107/60',
                        style: TextStyle(
                          fontSize: getFontSize(38, context),
                          fontWeight: FontWeight.bold,
                          color: AppColors.gray[700],
                        ),
                      ),

                      // Container with background and icon
                      Container(
                        width: getFontSize(46, context),
                        padding: EdgeInsets.all(8),
                        height: getFontSize(46, context),
                        decoration: BoxDecoration(
                          color: Color(0xFFA64FFE),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/bloodpressure.svg",  // Replace with your preferred icon
                        ),
                      ),
                    ],
                  ),

                  Row(children: [
                    Text(
                      'SYS/DA',
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: getFontSize(9, context),),
                    Text(
                      'mmHg',
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],),
                ],),

                SizedBox(height: getFontSize(20, context)),
                SvgPicture.asset('assets/images/line.svg'),
                SizedBox(height: getFontSize(20, context)),

                Row(
                  children: [
                reading(
                    header: 'Pulse rate',
                    value: "83",
                    script: "/min"
                ),
                    SizedBox(width: getFontSize(15, context)), // Spacer between the columns

                    // Column 2: Additional value with subscript
                    reading(
                        header: 'MAP',
                        value: "91",
                        script: "/mmHg"
                    ),


                SizedBox(width: getFontSize(60, context)), // Space before the next element

                    reading(
                      header: 'Blood Pressure',
                      value: "48",
                      script: "/mmHg"
                    ),
              ],

            )
              ],
           ),

        ),
        SizedBox(height: getFontSize(20, context),),
        SvgPicture.asset('assets/images/readingchat.svg'),
        SizedBox(height: getFontSize(20, context)),
        Container(
          margin: EdgeInsets.only(top: getFontSize(20, context)),
          child: TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Note',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: getFontSize(1, context)), // Border properties
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.blue[700], width: getFontSize(2, context)), // Focused border color
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.transparent, width: getFontSize(1, context)), // Enabled border color
              ),
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          child:
        ActionButton(text: "Back to readings", backgroundColor: AppColors.blue[700], textColor: AppColors.gray[100]),
          onTap: ()=> popMultipleTimes(context, 2),
        )

      ],
    ),
    ))));
  }
  void popMultipleTimes(BuildContext context, int count) {
    for (int i = 0; i < count; i++) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }
  }
  reading({required String header,
    required String value,
    required String script}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header, // Label
              style: TextStyle(fontSize: getFontSize(14, context)),
            ),
            SizedBox(height: getFontSize(10, context),),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: value, // Main value (e.g., 48)
                    style: TextStyle(
                      fontSize: getFontSize(18, context),
                      color: AppColors.gray[700],
                    ),
                  ),
                  WidgetSpan(
                    child: Transform.translate(
                      offset: Offset(1, 4),
                      child: Text(
                        script, // Subscript text
                        style: TextStyle(
                          fontSize: getFontSize(12, context),
                          color: AppColors.gray[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}