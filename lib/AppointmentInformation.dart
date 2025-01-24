import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Appointments/AppointmentPaymentSummary.dart';
import 'Main/Dashboard.dart';

void main(){
  runApp(AppointmentInformation());
}

class AppointmentInformation extends StatefulWidget {
  @override
  AppointmentInformationState createState() => AppointmentInformationState();
}

class AppointmentInformationState extends  State<AppointmentInformation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(child: Text('Appointment Information')),
      ),
      backgroundColor: Colors.white,
      body:
        Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
        width: MediaQuery.of(context).size.width,
        height: getFontSize(103, context),
        child: Row(
          children: [
            Image.asset('assets/images/dr_profile.png',
              width: getFontSize(56, context),
              height: getFontSize(56, context),
            ),
            SizedBox(width: getFontSize(10, context)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("Dr. Muiz Sanni", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                SizedBox(height: getFontSize(10, context),),
                Center(child: Text("Cardiovascular surgeon", style: TextStyle(color: Colors.grey),),),
              ],
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color:  Colors.black.withOpacity(0.1)),
        ),
        ),

            Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text("Time:", style: TextStyle(color: Color(0xFF2E2E42)),),
                      Text("12:00pm",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Spacer(),

          Container(
            child: Column(
              children: [
                Text("Date:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                Text("12th July 2022",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                ]
            ),
          )
              ],
            ),
          SizedBox(height: getFontSize(25, context),),
                Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text("Appointment Type:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                      Text("Online", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Spacer(),

          Container(
            child: Column(
              children: [
                Text("Consultation fee:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                Text("N20,000",  style: TextStyle(fontSize: getFontSize(28, context),color: Colors.blue, fontWeight: FontWeight.bold))
                ]
            ),
          )
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width), // Button width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                  side: BorderSide(
                    color: Color(0xFFFF6161),
                    width: getFontSize(0.5, context),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Text(
                  'Cancel appointment',
                  style: TextStyle(
                    color: Color(0xFFFF6161), // Text color
                    fontSize: getFontSize(16, context),
                  ),
                ),
              ),
            )

          ],
        )
      )
    )
    );
  }

}