import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(QrCodeScan());
}

class QrCodeScan extends StatefulWidget {
  QrCodeScan({super.key});
  @override
  _QrCodeScanScreen createState() => _QrCodeScanScreen();
}

class _QrCodeScanScreen extends  State<QrCodeScan> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        Container(
          width: getFontSize(234, context),
          child: Text(textAlign: TextAlign.center,'QR Code scan',style: TextStyle(fontSize: getFontSize(28, context), fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: getFontSize(15, context),),
        Container(
          width: getFontSize(284, context),
          child: Text(textAlign: TextAlign.center,'Scan the code on the device box to check it’s compatibility with the app',style: TextStyle(fontSize: getFontSize(14, context),),),
        ),

        Spacer(),
        SvgPicture.asset('assets/images/qrcode.svg'),
        Spacer(),

        SizedBox(height: getFontSize(25, context),),
        ElevatedButton(
          onPressed: () {},
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
              'Scan QR code',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    ))));
  }

}