import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main(){
  runApp(QuickCheckup());
}

class QuickCheckup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
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

                Container(
                  margin: EdgeInsets.only(left: getFontSize(35, context)),
                  alignment: Alignment.center,
                  child:
                Text(
                  'Take a quick checkup',
                  style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontStyle: FontStyle.normal
                  ),
                ),

                ),

              ],
            )
        ),
        backgroundColor: Colors.white,
        body: QuickCheckupState(),
      ),
    );
  }
}

class QuickCheckupState extends StatelessWidget{
  QuickCheckupState({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: getFontSize(20, context), right: getFontSize(20, context)),
      child: Column(
        children: [
          SizedBox(height: getFontSize(50, context),),

          SizedBox(height: getFontSize(30, context),),
        Container(
          width: getFontSize(228, context),
          alignment: Alignment.center,
          child: Text(
            'You can take a quick medical checkup with your specialist.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getFontSize(14, context),
            ),
          ),
        ),

      SizedBox(height: getFontSize(20, context),),


      Container(
        height: getFontSize(96, context),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: getFontSize(45, context),
                height: getFontSize(45, context),
                child:
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/doc.png"),
              ),
              ),
              SizedBox(width: getFontSize(10, context)), // Add some space between the icon and the text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Muiz Sanni",
                      style: TextStyle(
                        fontSize: getFontSize(16, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Cardiologist surgeon . Freelance specialist"),
                  ],
                ),
            ],
          ),
        ),
      ),
      ],
      ),
    );
  }
}