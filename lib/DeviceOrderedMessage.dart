import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceConnectedSuccess.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Deviceorderedmessage extends StatelessWidget {
  Deviceorderedmessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:  Align(
        alignment: Alignment.center,
        child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: getFontSize(50, context),),
            Text("Device Ordered", style: TextStyle(fontSize: getFontSize(36, context), fontWeight: FontWeight.bold),),
        SizedBox(height: getFontSize(10, context),),
        Container(
          width: getFontSize(258, context),
          child:
            Text(style: TextStyle(fontSize: getFontSize(18, context))
                ,textAlign: TextAlign.center,"Your device has been ordered and will soon get to you. You will be notified once it is available.")
        ),
            Spacer(),
            SvgPicture.asset("assets/images/drive.svg"),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => DeviceConnectedSuccess()));
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
                  'Finish',
                  style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                ),
              ),
            ),

          ],
        ),
      ),
      ),
      ),
    );
  }
}