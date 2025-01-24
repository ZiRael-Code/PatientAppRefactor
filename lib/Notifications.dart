import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(Notifications());
}

class Notifications extends StatefulWidget {
  Notifications({super.key});
  @override
  _NotificationsScreen createState() => _NotificationsScreen();
}

class _NotificationsScreen extends  State<Notifications> {
  String? _selectedValue;
  bool isPendingSelected = false;
  bool isCheckedSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
          onTap: () => Navigator.pop(context),
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
                child:
                Center(child: Text(
                  'Notifications',
                  style: TextStyle(
                      fontSize: getFontSize(20, context),
                      fontStyle: FontStyle.normal
                  ),
                ),
                ),
              ),
              Spacer(),

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
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: getFontSize(12, context),
                height: getFontSize(12, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.green, width: getFontSize(1, context)),
                ),
                child: Container(
                  width: getFontSize(7.5, context),
                  height: getFontSize(7.5, context),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(width: getFontSize(7, context)),
              Text('Pending', style: TextStyle(color: Color(0xff2E2E42)),),
              SizedBox(width: getFontSize(7, context)),
          Container(
            width: getFontSize(8, context),
            height: getFontSize(8, context),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        SizedBox(width: getFontSize(7, context)),
        Text('Checked', style: TextStyle(color: Color(0xff2E2E42)),),
      ],
          ),
        ),
        SizedBox(height: getFontSize(25, context),),
        Align(
          alignment: Alignment.centerLeft,
          child:
        Text('Today', style: TextStyle(fontSize: getFontSize(20, context),color: Colors.black, fontWeight: FontWeight.bold))),
        SizedBox(height: getFontSize(20, context),),
        notification(
          title: 'Message from Dr. Nelson',
          message: 'Good morning we’re yet to conclude about ...',
          time: '09:00 AM',
          buttonText: 'Reply',
          isChecked: false,
        ),
        notification(
          title: 'New prescription list',
          message: 'You have new drugs from Dr. Nelson',
          time: '09:00 AM',
          buttonText: 'View',
          isChecked: false,
        ),
        notification(
          title: 'Drugs are being delivered',
          message: 'Your drugs are goung to be delivered to you soon',
          time: '09:00 AM',
          buttonText: 'View',
          isChecked: false,
        ),
       notification(
          title: 'Drugs are being delivered',
          message: 'Your drugs are goung to be delivered to you soon',
          time: '09:00 AM',
          buttonText: 'View',
          isChecked: true,
        ),

      ],
    ),
    ))));
  }

  notification({
    required String title,
    required String message,
    required String time,
    required String buttonText,
    required bool isChecked}) {
    return Column(
        children: [
          Row(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: isChecked ?
        Container(
          width: getFontSize(12, context),
          height: getFontSize(12, context),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: getFontSize(1, context)),
              borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Container(
            width: getFontSize(7.5, context),
            height: getFontSize(7.5, context),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        )
        )
              :
          Container(
            width: getFontSize(8, context),
            height: getFontSize(8, context),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),

        ),
        SizedBox(width: getFontSize(7, context)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: getFontSize(5, context)),
            Container(
            width: getFontSize(224, context),
    child:
            Text(message, style: TextStyle(color: Color(0xff666666), fontSize: getFontSize(14, context))),)
            ,SizedBox(height: getFontSize(12, context)),
            Text(time, style: TextStyle(color: Colors.blue, fontSize: getFontSize(12, context))),
    ],
        ),
        Spacer(),
        Align(
          child: SizedBox(
            height: getFontSize(33, context),
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(buttonText, style: TextStyle(color: Colors.white),),
            )
          ),
        )
      ],
    ),
          SizedBox(height: getFontSize(10, context),),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(10, context),),
        ]
    );
  }
}