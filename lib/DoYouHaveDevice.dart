import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/WhatTypeDevice.dart';
import 'package:flutter_svg/svg.dart';

import 'OrderForADevice.dart';
import 'Main/Dashboard.dart';


void main(){
  runApp(DoYouHaveDevice());
}

class DoYouHaveDevice extends StatefulWidget{
  @override
  _DoYouHaveDevice createState() => _DoYouHaveDevice();
}

class  _DoYouHaveDevice extends State<DoYouHaveDevice>{
  List<bool> selectedList = [];

  @override
  void initState() {
    super.initState();
    selectedList = List.generate(16, (index) => false);  // Fills the list with 10 false values
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Padding(padding:
       EdgeInsets.only(top: getFontSize(45, context), bottom: getFontSize(30, context)),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           SizedBox(height: getFontSize(65, context),),

           Container(
             width: getFontSize(234, context),
             child: Text(textAlign: TextAlign.center,'Do you have a device? ',style: TextStyle(fontSize: getFontSize(28, context), fontWeight: FontWeight.bold),),
           ),
           SizedBox(height: getFontSize(15, context),),
           Container(
             width: getFontSize(284, context),
             child: Text(textAlign: TextAlign.center,'From your condition(s), there are devices that are essential for measuring your vitals to ensure proper health monitoring.',style: TextStyle(fontSize: getFontSize(14, context),),),
           ),
           SizedBox(height: getFontSize(45, context),),
           Container(
             alignment: Alignment.center,
             child: Stack(
               children: [
               Align(
               alignment: Alignment.center,
                child:  SvgPicture.asset('assets/images/1blob.svg',
                ),
               ),
                Container(
                  margin: EdgeInsets.only(top: getFontSize(40, context)),
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/images/dev.svg',
                    width: getFontSize(204, context),
                    height: getFontSize(132, context),
                  ),
                )
                 ,
               ],
             ),
           ),
           Spacer(),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               InkWell(
                 onTap: ()=>{
                 Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> WhatTypeDevice()))
                 },
                 child:
               button(
                 icon: Icons.check,
                 text: "I have a device"
               ),
               ),
               GestureDetector(
                 child:
               button(
                 icon: Icons.block,
                 text: "I don’t have a device"
               ),
                   onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> OrderForADevice()))

               ),
               GestureDetector(
                 child:
               button(
                 icon: Icons.access_time_rounded,
                 text: "I’ll get it later"
               ),
                 onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Login()))
               ),
             ]
           ),
           SizedBox(height: getFontSize(25, context),)
         ],
       ),
       ),
   );
  }

  button({
    required icon,
    required String text
  }) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: getFontSize(20, context)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: getFontSize(10, context)),
            width: getFontSize(81, context),
            height: getFontSize(81, context),
            decoration: BoxDecoration(
              color: Color(0xffE2EDFF),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, size: getFontSize(55, context), weight: 4, color: Colors.blue,),
          ),
          Container(
            margin: EdgeInsets.only(left: getFontSize(10, context)),
            alignment: Alignment.center,
            width: getFontSize(71, context),
            child: Text(text, textAlign: TextAlign.center,),
          )
          
        ],
      )
    );
  }

}