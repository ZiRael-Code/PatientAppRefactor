import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'PinSettings.dart';

void main(){
  runApp(PhoneNumberOtp());
}

class PhoneNumberOtp extends StatefulWidget {
  PhoneNumberOtp({super.key});
  @override
  PhoneNumberOtpState createState() => PhoneNumberOtpState();
}

class PhoneNumberOtpState extends  State<PhoneNumberOtp> {
  String? _selectedValue;
  List<String> otp = List.filled(6, ""); // List to hold OTP digits
  List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());

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
          width: MediaQuery.of(context).size.width * 0.58,
          child:
        Align(child: Text("A 6 - digit OTP code has been sent to your phone. Type it in the field below", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

        SizedBox(height: getFontSize(35, context),),

        Align(
        alignment: Alignment.centerLeft,
        child:
          Text("OTP",
          style: TextStyle(fontSize: getFontSize(14, context)),),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return Container(
                width: getFontSize(50, context),
                height: getFontSize(66, context),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffe2e2e2)),
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: controllers[index],
                  keyboardType: TextInputType.number,
                  obscureText: true, // Mask input
                  obscuringCharacter: '*', // Display input as '*'
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.top, // Align text at the top
                  style: TextStyle(
                    fontSize: getFontSize(24, context),
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    counterText: "", // Hide character counter
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      otp[index] = value;
                    });

                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    }else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PinSettings()));
                    }
                  },
                ),
              );
            }),
          ),
          SizedBox(height: getFontSize(30, context),),
          Text("Resend OTP",
            style: TextStyle(fontSize: getFontSize(14, context),
                fontWeight: FontWeight.bold,
                color: Colors.blue),),
      ],
    ),
    )) );
  }
}