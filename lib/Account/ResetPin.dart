import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'EmailOtp.dart';
import 'PhoneNumberOtp.dart';

class ResetPin extends StatefulWidget {
  ResetPin({super.key});

  @override
  State<ResetPin> createState() => _ResetPinState();
}

class _ResetPinState extends State<ResetPin> {
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
                  'Reset PIN',
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
                        width: MediaQuery.of(context).size.width * 0.68,
                        child:
                        Align(child: Text("To reset your PIN, an OTP will be sent to your phone or email", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getFontSize(14, context),
                          ),
                        ),
                        ),
                      ),
                      SizedBox(height: getFontSize(55, context),),
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  PhoneNumberOtp())),
                    child:
                    OPTION(label: "Phone number",
                          name: "0801 222 3334"),),

                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  EmailOtp())),
                    child:
                      OPTION(label: "Email Address",
                          name: "jonathandoe@gmail.com")),
                    ]
                )
            )
        )
    );
  }

  OPTION({
    required String label,
    required String name,
}){
return Column(
    children: [
      Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: getFontSize(14, context), color: Colors.black38),),
        SizedBox(height: getFontSize(10, context),),
        Text(name, style: TextStyle(fontSize: getFontSize(16, context), color: Colors.black),)
      ],
    ),
    Spacer(),
    Icon(Icons.arrow_forward_ios, color: Colors.blue,),
  ],
      ),
      SizedBox(height: getFontSize(20, context),),
      SvgPicture.asset("assets/images/line.svg"),
      SizedBox(height: getFontSize(25, context),),
    ],
);
}

}