import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'VitChatBot.dart';

void main(){
  runApp(CustomerCareOption());
}

class CustomerCareOption extends StatefulWidget {
  CustomerCareOption({super.key});
  @override
  _CustomerCareOptionScreen createState() => _CustomerCareOptionScreen();
}

class _CustomerCareOptionScreen extends  State<CustomerCareOption> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                  'Customer Care',
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
              padding: EdgeInsets.only(left: getFontSize(15, context), right: getFontSize(15, context)),
              child:
            Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VitChatBot()));
                      },
                    child:
          careOption(
            careName: Row(children: [
              Text(
                'Engage chatbot',
                style: TextStyle(
                  fontSize: getFontSize(18, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              // Blue forward arrow icon
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ],),
            careImgPath: "assets/images/careimgage.svg",
            description: "Talk with an automated responder to help you sort any little issues you may have with myvitalz."
          ),
          ),
              SizedBox(height: getFontSize(20, context),),
        careOption(
            careName: Row(children: [
              Text(
                'Send Mail',
                style: TextStyle(
                  fontSize: getFontSize(18, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              // Blue forward arrow icon
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ],),
            careImgPath: "assets/images/email.svg",
            description: "Send an email to our official email address myvitalzsupport@myvitalz.com if you need to communicate with us."
          ),

              SizedBox(height: getFontSize(20, context),),
              careOption(
            careName: Row(children: [
              Text(
                'Hotline',
                style: TextStyle(
                  fontSize: getFontSize(18, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              // Blue forward arrow icon
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ],),
            careImgPath: "assets/images/phone.svg",
            description: "You can call us directly on phone if you have pressing issues you need to fix."
          ),
    ]
            ),
      ));
  }

  careOption({
    required careName,
    required careImgPath,
    required description
  }) {
    // Column with text and row
    return Container(
      height: getFontSize(137, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFE5E5E5), width: getFontSize(1, context)),
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Circular container
          Container(
            width: getFontSize(59, context),
            height: getFontSize(59, context),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(0xFFE2EDFF),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(careImgPath),
          ),
          SizedBox(width: getFontSize(16, context)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               careName,
                SizedBox(height: getFontSize(15, context)),

              Container(
                padding: EdgeInsets.only(right: getFontSize(30, context)),
                child:
                Text(
                  description,
                  style: TextStyle(
                    color: Color(0xFF2E2E42),
                    fontSize: getFontSize(12, context),
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}