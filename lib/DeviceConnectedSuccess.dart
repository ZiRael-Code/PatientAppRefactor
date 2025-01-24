import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';



void main(){
  runApp(DeviceConnectedSuccess());
}

class DeviceConnectedSuccess extends StatefulWidget {
  DeviceConnectedSuccess({super.key});
  @override
  _DeviceConnectedSuccessScreen createState() => _DeviceConnectedSuccessScreen();
}

class _DeviceConnectedSuccessScreen extends  State<DeviceConnectedSuccess> {
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

        Align(child: Text("Success!", textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getFontSize(28, context),
            fontWeight: FontWeight.bold
          ),
        ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("Your account has been created successfully", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

        SizedBox(height: getFontSize(60, context)),
          Container(
            width: getFontSize(185, context),
            height: getFontSize(185, context),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xffE2EDFF).withOpacity(0.30),
                shape: BoxShape.circle
            ),
            child:
            SvgPicture.asset('assets/images/successphone.svg'),
          ),
        Spacer(),

        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Login()));
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
              'Continue to login',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    )));
  }
}