import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceConnected.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';


void main(){
  runApp(ConfiguringDevice());
}

class ConfiguringDevice extends StatefulWidget {
  ConfiguringDevice({super.key});
  @override
  _ConfiguringDeviceScreen createState() => _ConfiguringDeviceScreen();
}

class _ConfiguringDeviceScreen extends  State<ConfiguringDevice> {
  String? _selectedValue;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=> DeviceConnected()));
    });
    // TODO: implement initState
    super.initState();
  }
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
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'BP2 Connect',
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
        SizedBox(height: getFontSize(60, context)),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("Configuring your device.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

       SizedBox(height: getFontSize(50, context),),
        Container(
          width: getFontSize(185, context),
          height: getFontSize(185, context),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xffE2EDFF).withOpacity(0.30),
            shape: BoxShape.circle
          ),
          child: SvgPicture.asset('assets/images/dev.svg'),
        ),
      ],
    ),
    )));
  }
}