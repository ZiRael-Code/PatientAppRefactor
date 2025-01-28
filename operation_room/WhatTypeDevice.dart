import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/IsNotSupported.dart';
import 'package:flutter_app/IsSupported.dart';
import 'package:flutter_app/Main/Dashboard.dart';
import 'package:flutter_app/QrCodeScan.dart';
import 'package:flutter_svg/svg.dart';



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
                width: 35,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: 8.0,
                  height: 15,),
              ),
              ),

              Spacer(),

            ],
          ),
          centerTitle: true,
        ),
        body:
        Container(
            padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: 30),
        Container(
          width: 234,
          child: Text(textAlign: TextAlign.center,'What type is your device?',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 15,),
        Container(
          width: 284,
          child: Text(textAlign: TextAlign.center,'Upload your device details here to see if it is supported by myvitalz or not.',style: TextStyle(fontSize: 14,),),
        ),
        SizedBox(height: 45,),
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
          padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffE2EDFF)
          ),
          child: Text(style: TextStyle(fontSize: 16, color: Colors.blue),'Scan with QR code instead'),
        ),
        ),
        SizedBox(height: 25,),
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
              style: TextStyle(color: Colors.white, fontSize: 18),
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
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 8.0),
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
        SizedBox(height: 15,)
      ],
    );
  }


}