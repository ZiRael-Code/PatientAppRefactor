import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/IsNotSupported.dart';
import 'package:flutter_app/IsSupported.dart';
import 'package:flutter_svg/svg.dart';

import 'QrCodeScan.dart';


void main(){
  runApp(WhatTypeDevice());
}

class WhatTypeDevice extends StatefulWidget {
  WhatTypeDevice({super.key});
  @override
  _WhatTypeDeviceScreen createState() => _WhatTypeDeviceScreen();
}

class _WhatTypeDeviceScreen extends  State<WhatTypeDevice> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          width: getFontSize(234, context),
          child: Text(textAlign: TextAlign.center,'What type is your device?',style: TextStyle(fontSize: getFontSize(28, context), fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: getFontSize(15, context),),
        Container(
          width: getFontSize(284, context),
          child: Text(textAlign: TextAlign.center,'Upload your device details here to see if it is supported by myvitalz or not.',style: TextStyle(fontSize: getFontSize(14, context),),),
        ),
        SizedBox(height: getFontSize(45, context),),
        input_field(
          label: 'Model / Name of device',
          hint: "e.g Wellue"
        ),
        input_field(
          label: 'Serial number',
          hint: "e.g 1H96F7AWGBVSFYSER8OGA"
        ),


        Spacer(),

        GestureDetector(
          onTap: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (context) => QrCodeScan()))
          },
          child:
        Container(
          padding: EdgeInsets.only(left: getFontSize(16, context), right: getFontSize(16, context), top: getFontSize(10, context), bottom: getFontSize(10, context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffE2EDFF)
          ),
          child: Text(style: TextStyle(fontSize: getFontSize(16, context), color: Colors.blue),'Scan with QR code instead'),
        ),
        ),
        SizedBox(height: getFontSize(25, context),),
        ElevatedButton(
          onPressed: () {
             var page = [IsSupported(), IsNotSupported()];
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> page[Random.secure().nextInt(2)]));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Check device',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    )));
  }

  input_field({
    required String label,
    required String hint}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              fontSize: getFontSize(16, context),
            ),
          ),
        ),
        SizedBox(height: getFontSize(8.0, context)),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Color(0xFFf0f0f0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: getFontSize(15, context),)
      ],
    );
  }


}