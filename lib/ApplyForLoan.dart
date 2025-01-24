import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'LoanDetails.dart';

class Applyforloan extends StatelessWidget {
  Applyforloan({super.key});

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
      SizedBox(height: getFontSize(50, context),),
      Text("Apply for a loan", style: TextStyle(fontSize: getFontSize(36, context), fontWeight: FontWeight.bold),),
      SizedBox(height: getFontSize(10, context),),
      Container(
          width: getFontSize(256, context),
          child:
          Text(style: TextStyle(fontSize: getFontSize(18, context))
              ,textAlign: TextAlign.center,"You can easily apply for a short loan if you currently don’t have enough money to buy a device.")
      ),
      Spacer(),
      SvgPicture.asset("assets/images/money.svg"),
      Spacer(),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => LoanDetails()));
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
            'Apply for loan',
            style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
          ),
        ),
      ),


    ]
    )
    )
    )
    );
  }
}