import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceOrderedMessage.dart';
import 'package:flutter_svg/svg.dart';

class DeviceOrderPayment extends StatelessWidget {
  DeviceOrderPayment({super.key});

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
                  'Payment',
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
      Spacer(),
      Container(
        width: getFontSize(288, context),
        child:
      Text(style: TextStyle(fontSize: getFontSize(16, context)) ,textAlign: TextAlign.center,"This opens up a webpage that leads to paystack where the user can  make payment directly. After the whole process, they are redirected to the app and the flow continues in the next screen.")
      ),
      Spacer(),
      Spacer(),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => Deviceorderedmessage()));
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
            'Continue',
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