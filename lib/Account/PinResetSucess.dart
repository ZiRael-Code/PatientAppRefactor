import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainManvigator.dart';

void main(){
  runApp(PinResetSucess());
}

class PinResetSucess extends StatefulWidget {
  PinResetSucess({super.key});
  @override
  _PinResetSucessScreen createState() => _PinResetSucessScreen();
}

class _PinResetSucessScreen extends  State<PinResetSucess> {
  String? _selectedValue;
  List<String> pin = [];

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
                  'PIN Settings',
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
                    Align(child: Text("You have successfully reset your PIN!", textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                      ),
                    ),
                    ),
                  ),

                  Spacer(),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (builder) => MainNavigator(index: 3,)), // Navigate to Login screen
                            (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: getFontSize(12.0, context), horizontal: getFontSize(24.0, context)),
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}