import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'HowItWorkExplained.dart';

void main(){
  runApp(HowItWorks());
}

class HowItWorks extends StatefulWidget {
  HowItWorks({super.key});
  @override
  HowItWorksState createState() => HowItWorksState();
}

class HowItWorksState extends  State<HowItWorks> {
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
                  'How It Work',
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
            padding: EdgeInsets.all(15),
            child: Column(children: [
              how(
                text: "How to take vital readings with your device",
              ),

              how(
                text: "How to book an appointment",
              ),

              how(
                text: "How to take vital readings with your device",
              ),

              how(
                text: "How to become an interpreter for others",
              ),

              how(
                text: "How to book an appointment",
              ),

              how(
                text: "How to become an interpreter for others",
              ),

          ]
            ),


    ));
  }

  how({
    required String text
  }) {
    return  GestureDetector(
        onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>  HowItWorkExplained())),
    child:  Column(children: [
      Row(children: [
      Container(
        width: getFontSize(240, context),
        child: Text(text, style: TextStyle(
          fontSize: getFontSize(16, context),
        ),),
      ),
      Spacer(),
      Icon(Icons.arrow_forward_ios_rounded),
    ],),
      SizedBox(height: getFontSize(12, context),),
      SvgPicture.asset("assets/images/line.svg"),
      SizedBox(height: getFontSize(20, context))
    ]
    )
    );
  }
}