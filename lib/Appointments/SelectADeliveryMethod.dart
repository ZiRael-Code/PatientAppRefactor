import '../Main/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(SelectADeliveryMethod());
}

class SelectADeliveryMethod extends StatefulWidget{
  @override
  _SelectADeliveryMethodState createState() => _SelectADeliveryMethodState();
}

class _SelectADeliveryMethodState extends State<SelectADeliveryMethod> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
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
                Text(
                  'Select delivery method',
                  style: TextStyle(
                      fontSize: getFontSize(20, context),
                      fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Spacer(),

            ],
          ),
        ),
        body: Column(
          children: [
           fundMethod(text: "Select  a delivery address",
          imagePath: Icon(Icons.home, color: Colors.blue,),
          icon:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue,)
           ),
            fundMethod(text: "Use a pickup location",
                imagePath: Icon(Icons.location_pin, color: Colors.blue,),
               icon:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue,)
           ),
          ],
      ),
    );
  }

fundMethod (
{

required String text,
  required Icon imagePath,
required Icon icon,
}){
    return Padding(padding: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(12),
      width: double.infinity,
      height: getFontSize(74, context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFE5E5E5),
          width: getFontSize(0.5, context),
        ),
      ),
        child: Row(children: [
          Container(
            width: getFontSize(42, context),
            height: getFontSize(42, context),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFE2EDFF),
              shape: BoxShape.circle,
            ),
            child: imagePath,
          ),
      SizedBox(width: getFontSize(25, context),),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF2E2E42),
              fontSize: getFontSize(16, context),
              fontWeight: FontWeight.bold,
            ),
          ),
        Spacer(),
         icon

        ],),
    ),
    );
  }
  }