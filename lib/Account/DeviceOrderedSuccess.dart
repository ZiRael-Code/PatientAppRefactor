import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainManvigator.dart';

void main(){
  runApp(DeviceOrderSuccess());
}

class DeviceOrderSuccess extends StatefulWidget {
  DeviceOrderSuccess({super.key});
  @override
  _SuccessScreen createState() => _SuccessScreen();
}

class _SuccessScreen extends  State<DeviceOrderSuccess> {
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
                  'Success!',
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
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("You have successfully ordered for a device. You will be notified when it’s ready for pickup or delivery.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

        Spacer(),
        Container(
          height: getFontSize(50, context),
          width: MediaQuery.of(context).size.width * 0.40,
          decoration: BoxDecoration(
            color: Color(0xFFE2EDFF),
            borderRadius: BorderRadius.circular(9),
          ),
          padding: EdgeInsets.symmetric(horizontal: getFontSize(16.0, context)),
          child: DropdownButton<String>(
            value: _selectedValue,
            hint: Text(
              'See details',
              style: TextStyle(
                color: Color(0xFF3C8AFF),
              ),
            ),
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(
              fontSize: getFontSize(16, context),
              color: Color(0xFF3C8AFF),
            ),
            icon: Icon(Icons.keyboard_arrow_down),
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
            items: <String>['10:00 AM', '12:00 PM', '02:00 PM', '04:00 PM']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: getFontSize(15, context),),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (builder) => MainNavigator(index: 3,)), // Navigate to Login screen
                  (Route<dynamic> route) => false, // Remove all previous routes
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: getFontSize(12.0, context), horizontal: getFontSize(24.0, context)),
            child: Text(
              'Done',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    )));
  }
}