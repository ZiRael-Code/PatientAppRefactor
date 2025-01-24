import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MainManvigator.dart';
import 'package:flutter_svg/svg.dart';

import 'CancelSuccess.dart';

void main(){
  runApp(ConfirmCalcellation());
}

class ConfirmCalcellation extends StatefulWidget {
  ConfirmCalcellation({super.key});
  @override
  _ConfirmCalcellationScreen createState() => _ConfirmCalcellationScreen();
}

class _ConfirmCalcellationScreen extends  State<ConfirmCalcellation> {
  String? _selectedValue;

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
                  'Cancel Appointment',
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
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: getFontSize(70, context)),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.48,
          child:
        Align(child: Text("Your money will be refunded to within 24hours", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),
          SizedBox(height: getFontSize(40, context)),

          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              border: Border.all(width: getFontSize(1, context), color: Colors.black.withOpacity(0.05))
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: getFontSize(56, context),
                height: getFontSize(5, context),
                decoration: BoxDecoration(
                  color: Color(0xffE5E5E5),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
          SizedBox(height: getFontSize(25, context),),
          Align(child: Text("Appointment information", textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getFontSize(20, context),
            ),
          ),
          ),
      SizedBox(height: getFontSize(45, context),),
      //
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
              SizedBox(height: getFontSize(40, context),),
              Container(
                width: getFontSize(150, context),
                height: getFontSize(56, context),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Center( child: Text("FEE: ", style: TextStyle(fontSize: getFontSize(16, context),color: Colors.black),),),Center( child: Text("N25,000", style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold, color: Colors.blue),),),]),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color:  Colors.black.withOpacity(0.1)),
                ),
              ),
              SizedBox(height: getFontSize(20, context),),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Text("Time:"),
                      Spacer(),
                      Text("12:00pm"),
                    ],
                  ),
                  SizedBox(height: getFontSize(30, context)),
                  Row(
                    children: [
                      Text("Date:"),
                      Spacer(),
                      Text("12th July 2022"),
                    ],
                  ),
                  SizedBox(height: getFontSize(30, context)),
                  Row(
                    children: [
                      Text("Appointment type:"),
                      Spacer(),
                      Text("Online"),
                    ],
                  ),
                  SizedBox(height: getFontSize(30, context)),
                  Row(
                    children: [
                      Text("Consultation fee:"),
                      Spacer(),
                      Text("N25,000.00"),
                    ],
                  ),
                ],
              ),
      //             //
              SizedBox(height: getFontSize(50, context)),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=> CancelSuccess()));
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
                    'Confirm cancellation',
                    style: TextStyle(color: Colors.white, fontSize: getFontSize(16, context)),
                  ),
                ),
              ),

            ]
          )
          )

      ],
    ),
    )));
  }
}