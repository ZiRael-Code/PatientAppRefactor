import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Device.dart';


void main(){
  runApp(DeviceOwned());
}

class DeviceOwned extends StatefulWidget {
  DeviceOwned({super.key});
  @override
  _DeviceOwnedScreen createState() => _DeviceOwnedScreen();
}

class _DeviceOwnedScreen extends  State<DeviceOwned> {
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
                  'Devices owned',
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
        body: SingleChildScrollView(
          child:
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
          width: MediaQuery.of(context).size.width * 0.58,
          child:
        Align(child: Text("View history of any vitals by directly tapping on their icons. ", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),SizedBox(height: getFontSize(20, context),),

        Wrap(children: [
          devices(
              name: "BP2 Connect",
              imagePath: "assets/images/dev.svg"
          ),
          SizedBox(width: getFontSize(20, context),),
          devices(
              name: "Device 2",
              imagePath: "assets/images/dev.svg"
          ),
          devices(
              name: "Device 3",
              imagePath: "assets/images/dev.svg"
          ),
        ],),

        ]))))
      ) ;
  }

  devices({
    required String name,
    required String imagePath
  }) {
    return  GestureDetector(
        onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Device(),
        ),
      );
    },
    child:  Container(
      child: Column(children: [
        Container(
          width: getFontSize(143, context),
          height: getFontSize(143, context),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: getFontSize(1, context), color: Colors.black.withOpacity(0.2))
          ),
          child:
          Center(child: SvgPicture.asset(imagePath),),
        ),
        SizedBox(height: getFontSize(10, context),),
        Text(name, style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold)),
        SizedBox(height: getFontSize(20, context), ),
      ],),),
    );
  }


}