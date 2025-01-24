import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(PrescriptionInfoMessage());
}

class PrescriptionInfoMessage extends StatefulWidget {
  PrescriptionInfoMessage({super.key});
  @override
  _PrescriptionInfoMessageScreen createState() => _PrescriptionInfoMessageScreen();
}

class _PrescriptionInfoMessageScreen extends  State<PrescriptionInfoMessage> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Prescription Information',
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
        Align(child: Text("When you start using these prescriptions, make sure you mark them as used in the medications page.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),
        SizedBox(height: getFontSize(45, context),),
        SvgPicture.asset('assets/images/presphone.png'),

        Spacer(),

        ElevatedButton(
          onPressed: () {},
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
              'Go to medications page',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    ))));
  }
}