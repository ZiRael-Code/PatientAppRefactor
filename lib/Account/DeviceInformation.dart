import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'DeviceSummary.dart';


void main(){
  runApp(DeviceInformation());
}

class DeviceInformation extends StatefulWidget {
  DeviceInformation({super.key});
  @override
  _DeviceInformationScreen createState() => _DeviceInformationScreen();
}

class _DeviceInformationScreen extends  State<DeviceInformation> {
  String? _selectedValue;
int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
          onTap: () => Navigator.pop(context),
          child: 
              InkWell(
          onTap: () => Navigator.pop(context),
          child: 
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

              ),

              ),

              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Device Information',
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
              padding: EdgeInsets.all(25),
              child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(alignment: Alignment.center,child:
            SvgPicture.asset('assets/images/dev.svg', height: getFontSize(117, context), width: getFontSize(195, context),),
            ),
            SizedBox(height: getFontSize(30, context),),
            Text(
              'Name:',
              style: TextStyle(color: Colors.grey, fontSize: getFontSize(14, context)),
            ),
            SizedBox(height: getFontSize(5, context)),
            Text(
              'Wellue Bp2 Connect device',
              style: TextStyle(color: Colors.black, fontSize: getFontSize(16, context)),
            ),


            SizedBox(height: getFontSize(15, context)),
            SvgPicture.asset('assets/images/line.svg'),

            SizedBox(height: getFontSize(20, context)),

            // Price
            Text(
              'Price:',
              style: TextStyle(color: Colors.grey, fontSize: getFontSize(14, context)),
            ),
            SizedBox(height: getFontSize(5, context)),
            Text(
              'N25,000.00',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: getFontSize(16, context)),
            ),

            SizedBox(height: getFontSize(15, context)),
            SvgPicture.asset('assets/images/line.svg'),

            SizedBox(height: getFontSize(20, context)),

            // Vitals measured
            Text(
              'Vitals measured:',
              style: TextStyle(color: Colors.grey, fontSize: getFontSize(14, context)),
            ),
            SizedBox(height: getFontSize(5, context)),
            Text(
              'Oxygen saturation, blood pressure, stress level, body temperature.',
              style: TextStyle(color: Colors.black, fontSize: getFontSize(16, context)),
            ),
            SizedBox(height: getFontSize(15, context)),
            SvgPicture.asset('assets/images/line.svg'),


            SizedBox(height: getFontSize(30, context)),

            // How many devices do you need?
           Center(child: Text(
              'How many devices do you need?',
              style: TextStyle(color: Colors.black, fontSize: getFontSize(18, context)),
            ),
            ),

            SizedBox(height: getFontSize(25, context)),

            // Row for quantity control
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrease button
                GestureDetector(
                  child:
                Container(
                  width: getFontSize(35, context),
                  height: getFontSize(35, context),
                  decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.remove, size: getFontSize(16, context),color: Colors.blue),
                ),
                  onTap: () {
                    setState(() {
                      if (number > 0) {
                        number--;
                      }
                    });
                    // Logic to decrease the number
                  },
                ),

                SizedBox(width: getFontSize(25, context)),

                // Display quantity
                Text(
                  number.toString(),
                  style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold, color: Colors.black),
                ),

                SizedBox(width: getFontSize(25, context)),
                // Increase button
    GestureDetector(
                  child:
                Container(
                  width: getFontSize(35, context),
                  height: getFontSize(35, context),
                  decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, size: getFontSize(16, context), color: Colors.blue),

                  ),
                    onTap: () {
                    setState(() {
                      number++;
                    });
    },
                ),
              ],
            ),

            Spacer(),

            // Place an Order button
            SizedBox(
              height: getFontSize(55, context),
              width: double.infinity, // Match screen width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceSummary(),
                    ),
                  );
                  // Logic for placing an order
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Border radius of 12
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Place an order',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: getFontSize(45, context),),
          ],
        )
        )

      );
  }
}