import 'components/colors/colours.dart';
import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceConnectedSuccess.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';


void main(){
  runApp(DeviceConnected());
}

class DeviceConnected extends StatefulWidget {
  DeviceConnected({super.key});
  @override
  _DeviceConnectedScreen createState() => _DeviceConnectedScreen();
}

class _DeviceConnectedScreen extends  State<DeviceConnected> {
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

        Align(child: Text("Device connected", textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getFontSize(28, context),
            fontWeight: FontWeight.bold
          ),
        ),
        ),
        SizedBox(height: getFontSize(30, context)),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("The device was connected  to your phone successfully.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

        SizedBox(height: getFontSize(60, context)),

        Spacer(),


        ElevatedButton(
          onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> DeviceConnectedSuccess()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue[700],
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Finish',
              style: TextStyle(color: AppColors.gray[100], fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    )));
  }
}