import 'components/colors/colours.dart';
import 'package:dio/dio.dart';

import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/SelectCondition.dart';
import 'package:flutter_svg/svg.dart';

class SetupComplete extends StatelessWidget{
  SetupComplete({super.key });
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

        ),
        body: Padding(
            padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getFontSize(25, context),),
              Text('Success!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: getFontSize(28, context)),)
              ,
              SizedBox(height: getFontSize(15, context),),
              Container(
                width: getFontSize(226, context),
                child: Text(textAlign: TextAlign.center, 'You’ve setup the basics for your account. Click continue to tailor the app experience to you.', style: TextStyle(fontSize: getFontSize(14, context)),),
              ),
              Spacer(),
              SvgPicture.asset('assets/images/woman.svg'),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SelectCondition()));
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
                    'Continue',
                    style: TextStyle(color: AppColors.gray[100], fontSize: getFontSize(18, context)),
                  ),
                ),
              ),
              SizedBox(height: getFontSize(15, context),),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (builder) => Login()), // Navigate to Login screen
                        (Route<dynamic> route) => false, // Remove all previous routes
                  );
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    side: BorderSide(width: getFontSize(1, context), color: AppColors.blue[700]),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    textStyle: TextStyle(color: AppColors.blue[700])
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Login to app instead',
                    style: TextStyle(color: AppColors.blue[700], fontSize: getFontSize(18, context)),
                  ),
                ),
              ),
              SizedBox(height: getFontSize(25, context),)

            ]
        ),
        ),
    );
  }
}