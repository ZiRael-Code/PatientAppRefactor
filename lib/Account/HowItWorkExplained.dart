import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(HowItWorkExplained());
}

class HowItWorkExplained extends StatefulWidget {
  HowItWorkExplained({super.key});
  @override
  HowItWorkExplainedState createState() => HowItWorkExplainedState();
}

class HowItWorkExplainedState extends  State<HowItWorkExplained> {
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
              Container(
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 color: Colors.black
                ),
                child: Center(child:  Container(

                  width: getFontSize(59, context),
                  height: getFontSize(59, context),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05)
                  ),
                  child: Center(child: Icon(Icons.play_arrow, color: Colors.white)),
                ),
                ),
              ),
              SizedBox(height: getFontSize(25, context),),
              Container(
                  width: getFontSize(280, context),
                  child: 
              Text("How to take vital readings with your device", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getFontSize(20, context),
              ),)),
              SizedBox(height: getFontSize(15, context),),
              Text("""1.) Remove your device from the box and turn it on

2.) Connect it with the app via bluetooth

3.) Touch the sensors as shown above

4.) Wait for about 30seconds - 1 minute and the readings show on your phone. """, style: TextStyle(
                fontSize: getFontSize(14, context),
                color: Color(0xff2E2E42)
              ),)
          ]
            ),


    ));
  }

}