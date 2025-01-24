import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(Appointments1());
}

class Appointments1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Appointments1State(),
    );
  }
}

class Appointments1State extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'Appointments',
              style: TextStyle(
                fontSize: getFontSize(26, context),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Stack(
              children: [
                Icon(Icons.message, size: getFontSize(28, context)),
                Positioned(
                  right: getFontSize(0, context),
                  top: getFontSize(0, context),
                  child: Container(
                    width: getFontSize(8, context),
                    height: getFontSize(8, context),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appointment text and message icon with red dot
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                ],
              ),
              SizedBox(height: getFontSize(60, context)),

              // Image
              Center( child:
              SvgPicture.asset(
                  'assets/images/calender.svg',
              ),
              ),
              SizedBox(height: getFontSize(30, context)),

              // Descriptive Text
              Center(
                child: Text(
                  'If you want to book a physical or an online meeting with your specialist, you can do it here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: getFontSize(16, context)),
                ),
              ),
              SizedBox(height: getFontSize(25, context)),

              // Book Appointment Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                   fixedSize: Size.fromHeight(54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      'Book an appointment',
                      style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getFontSize(70, context)),

              // Pending Appointments Text
                Text(
                  'Pending Appointments',
                  style: TextStyle(fontSize: getFontSize(20, context), fontWeight: FontWeight.bold),
                ),
              SizedBox(height: getFontSize(20, context)),

              // Container with dashed border and semi-transparent background
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: getFontSize(128, context),
                        child:Column(
                          children: [
                            Text("Dr. Nelson Yang", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("9:00AM . 12th June 2022"),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0x262DB042).withOpacity(0.35)
                              ),
                              child: Center(child: Text("Online Appointment"),),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color:  Colors.black.withOpacity(0.1)),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: getFontSize(60, context)),
            ],
          ),
        ),
      ),
    );
  }
}