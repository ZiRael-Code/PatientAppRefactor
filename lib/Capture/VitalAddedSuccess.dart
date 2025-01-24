import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Capture/VitalsReading.dart';
import 'package:flutter_svg/svg.dart';

import '../Main/MeasuringVitals.dart';


void main(){
  runApp(VitalAddedSuccess());
}

class VitalAddedSuccess extends StatefulWidget {
  VitalAddedSuccess({super.key});
  @override
  _VitalAddedSuccessScreen createState() => _VitalAddedSuccessScreen();
}

class _VitalAddedSuccessScreen extends  State<VitalAddedSuccess> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        Align(child: Text("Success!.", textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getFontSize(18, context),
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
        SizedBox(height: getFontSize(20, context),),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("You have successfully added vital readings manually. You can find them under the readings history of the capture section.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

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
              'See all readings',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
        SizedBox(height: getFontSize(15, context),),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MeasuringVitals ()));// TODO fix
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(
              color: Colors.blue,
              width: getFontSize(1, context)
            ),
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Back to capture page',
              style: TextStyle(color: Colors.blue, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    )));
  }
}