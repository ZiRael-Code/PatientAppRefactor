import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/OrderForADevice.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';


void main(){
  runApp(IsNotSupported());
}

class IsNotSupported extends StatefulWidget {
  IsNotSupported({super.key});
  @override
  _IsNotSupportedScreen createState() => _IsNotSupportedScreen();
}

class _IsNotSupportedScreen extends  State<IsNotSupported> {
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
          child: Text(textAlign: TextAlign.center,'Your device is not supported!',style: TextStyle(fontSize: getFontSize(28, context), fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: getFontSize(15, context),),
        Container(
          width: getFontSize(284, context),
          child: Text(textAlign: TextAlign.center,'The device you have is not compatible with myvitalz. You might need to get a new device so you can sync your vital readings with myvitals',style: TextStyle(fontSize: getFontSize(14, context),),),
        ),

        Spacer(),
        SvgPicture.asset('assets/images/lieingbulb.svg'),
        Spacer(),

        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> OrderForADevice()));
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
              'Get a device now',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
        SizedBox(height: getFontSize(15, context),),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Login()));
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              side: BorderSide(width: getFontSize(1, context), color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              textStyle: TextStyle(color: Colors.blue)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'I’ll do this later',
              style: TextStyle(color: Colors.blue, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    )));
  }

}