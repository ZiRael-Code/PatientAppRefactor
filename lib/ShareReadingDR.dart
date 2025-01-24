import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(ShareReadingDR());
}

class ShareReadingDR extends StatefulWidget {
  ShareReadingDR({super.key});
  @override
  _ShareReadingDRScreen createState() => _ShareReadingDRScreen();
}

class _ShareReadingDRScreen extends  State<ShareReadingDR> {
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
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Share readings',
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
        Align(child: Text("You vital readings are being shared with your personal physician.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

        SizedBox(height: getFontSize(35, context)),

        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: getFontSize(80, context),
          child: Row(
            children: [
              Image.asset('assets/images/dr_profile.png',
                width: getFontSize(56, context),
                height: getFontSize(56, context),
              ),
              SizedBox(width: getFontSize(15, context),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Dr. Muiz Sanni", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                  SizedBox(height: getFontSize(5, context),),
                  Center(child: Text("Cardiovascular surgeon", style: TextStyle(color: Colors.grey),),),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color:  Colors.black.withOpacity(0.1)),
          ),
        ),


      ],
    ),
    ))));
  }
}