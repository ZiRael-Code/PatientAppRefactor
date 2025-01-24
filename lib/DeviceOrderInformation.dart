import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(DeviceOrderInformation());
}

class DeviceOrderInformation extends StatefulWidget {
  DeviceOrderInformation({super.key});
  @override
  _DeviceOrderInformationScreen createState() => _DeviceOrderInformationScreen();
}

class _DeviceOrderInformationScreen extends  State<DeviceOrderInformation> {
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
                  'Order Information',
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
            SizedBox(height: getFontSize(35, context),),
            Container(alignment: Alignment.center,child:
            SvgPicture.asset('assets/images/dev.svg', height: getFontSize(117, context), width: getFontSize(195, context),),
            ),
            SizedBox(height: getFontSize(50, context),),

              Center(child:
              Text(
              'Wellue Bp2 Connect device',
              style: TextStyle(color: Colors.black, fontSize: getFontSize(16, context)),
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
                SizedBox(height: getFontSize(30, context)),
                Row(
                  children: [
                    Text("Price:"),
                    Spacer(),
                    Text("N25,000.00"),
                  ],
                ),
                SizedBox(height: getFontSize(30, context)),
                Row(
                  children: [
                    Text("Delivery fee:"),
                    Spacer(),
                    Text("N1,500.00"),
                  ],
                ),
                SizedBox(height: getFontSize(30, context)),
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
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: getFontSize(0.5, context)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for placing an order
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    'Cancel Order',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
            SizedBox(height: getFontSize(45, context)),
            SizedBox(height: getFontSize(45, context),),
          ],
        )
        )

      ));
  }
}