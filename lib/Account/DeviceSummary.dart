import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'DeviceOrderedSuccess.dart';


void main(){
  runApp(DeviceSummary());
}

class DeviceSummary extends StatefulWidget {
  DeviceSummary({super.key});
  @override
  _DeviceSummaryScreen createState() => _DeviceSummaryScreen();
}

class _DeviceSummaryScreen extends  State<DeviceSummary> {
  String? _selectedValue;

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
                  'Summary',
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
            SizedBox(height: getFontSize(45, context),),
            Container(alignment: Alignment.center,child:
            SvgPicture.asset('assets/images/dev.svg', height: getFontSize(117, context), width: getFontSize(195, context),),
            ),
            SizedBox(height: getFontSize(70, context),),

              Center(child:
              Text(
              'Wellue Bp2 Connect device',
              style: TextStyle(color: Colors.black, fontSize: getFontSize(16, context)),
            ),
            ),

            SizedBox(height: getFontSize(10, context)),
            // Summary

              Align(
                alignment: Alignment.center,
                child:
              SizedBox(
                width: getFontSize(150, context),
              child:
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(width: getFontSize(0.05, context)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'PRICE: ',
                    style: TextStyle(color: Colors.grey, fontSize: getFontSize(14, context)),
                  ),
                  SizedBox(width: getFontSize(5, context)),
                  Text( 
                    'N25,000.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: getFontSize(16, context),
                    ),
                  ),
                ],
              ),
            ),
            ),
            ),


            SizedBox(height: getFontSize(25, context),),

            Wrap(
              direction: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Text("Arrival date:"),
                    Spacer(),
                    Text("9th August 2022"),
                  ],
                ) ,
                SizedBox(height: getFontSize(40, context)),
                Row(
                  children: [
                    Text("Price:"),
                    Spacer(),
                    Text("N25,000.00"),
                  ],
                ),
                SizedBox(height: getFontSize(40, context)),
                Row(
                  children: [
                    Text("Quantity:"),
                    Spacer(),
                    Text("1"),
                  ],
                ),
                SizedBox(height: getFontSize(40, context)),
                Row(
                  children: [
                    Text("Delivery fee:"),
                    Spacer(),
                    Text("N1,500.00"),
                  ],
                ),
                SizedBox(height: getFontSize(40, context)),
                Row(
                  children: [
                    Text("TOTAL:", style: TextStyle(fontWeight: FontWeight.bold),),
                    Spacer(),
                    Text("N26,550.00"),
                  ],
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
                      builder: (context) => DeviceOrderSuccess(),
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
                  'Proceed with online payment',
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