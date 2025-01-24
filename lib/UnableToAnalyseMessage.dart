import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(UnableToAnalyseMessage());
}

class UnableToAnalyseMessage extends StatefulWidget {
  UnableToAnalyseMessage({super.key});
  @override
  _UnableToAnalyseMessageScreen createState() => _UnableToAnalyseMessageScreen();
}

class _UnableToAnalyseMessageScreen extends  State<UnableToAnalyseMessage> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        Container(
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: getFontSize(90, context)),

        Align(
          alignment: Alignment.centerRight,
          child:
        SvgPicture.asset('assets/images/battery.svg'),
        ),
        SizedBox(height: getFontSize(35, context),),
        SvgPicture.asset('assets/images/bulb.svg'),
        SizedBox(height: getFontSize(35, context),),
        Container(
          width: MediaQuery.of(context).size.width * 0.72,
          child: Text('Measurement not completed, Unable to analyse', textAlign: TextAlign.center, style: TextStyle(fontSize: getFontSize(20, context)),),
        ),
         SizedBox(height: getFontSize(10, context),),
        Text('(minimum continuous measurement for 30s)'),
        SizedBox(height: getFontSize(90, context),),

        Container(
          width: MediaQuery.of(context).size.width * 0.54,
          child: Text(textAlign: TextAlign.center, '*press START/STOP button to start or stop measuring'),
        )
      ],
    ),
    ))));
  }
}