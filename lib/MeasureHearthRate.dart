import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(MeasureHearthRate());
}

class MeasureHearthRate extends StatefulWidget {
  @override
  _MeasureHearthRateState createState() => _MeasureHearthRateState();
}

class _MeasureHearthRateState extends State<MeasureHearthRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            centerTitle: true,
            title: Row(
              children: [
                Container(
                  width: getFontSize(35, context),
                  height: getFontSize(35, context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFE5E5E5),
                  ),
                  child: Icon(Icons.arrow_back_ios_new_rounded,),
                  // color: Colors.black,
                  // width: getFontSize(8.0, context),
                  // height: getFontSize(15, context),),
                ),
                Container(
                  margin: EdgeInsets.only(left: getFontSize(35, context)),
                  alignment: Alignment.center,
                  child:
                  Center(child: Text(
                    'Measure hearth rate',
                    style: TextStyle(
                        fontSize: getFontSize(20, context),
                        fontStyle: FontStyle.normal
                    ),
                  ),
                  ),
                ),
              ],
            )
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: [
              Container(
                width: double.infinity,
                height: getFontSize(150, context),

                decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(15)),
              ),
              SizedBox(height: getFontSize(20, context),),
              Row(children: [
                Container(
                  width: getFontSize(20, context),
                  height: getFontSize(20, context),
                  margin: EdgeInsets.only(right: getFontSize(7, context)),
                  child: Center(child: Text('1', style: TextStyle(color: Color(
                      0xFF2E2E42)),),),
                  decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2).withOpacity(0.5),
                      shape: BoxShape.circle
                  ),

                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  child:
                  Text(
                      "Touch the electrodes in one of the ways shown in the pictures above."),
                ),
              ],),
              SizedBox(height: getFontSize(10, context),),

              Row(children: [
                Container(
                  width: getFontSize(20, context),
                  height: getFontSize(20, context),
                  margin: EdgeInsets.only(right: getFontSize(7, context)),
                  child: Center(child: Text('2', style: TextStyle(color: Color(
                      0xFF2E2E42)),),),
                  decoration: BoxDecoration(
                      color: Color(0xFFF2F2F2).withOpacity(0.5),
                      shape: BoxShape.circle
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.63,
                  child:
                  Text(
                    "Click Start/Stop button on the device to start measuring.",),
                )
              ],),
              SizedBox(height: getFontSize(20, context),),

              Row(
                children: [
                  Text(""),
                  Text(""),
                ],
              ),
              SizedBox(height: getFontSize(15, context),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getFontSize(19, context),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                    ),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(child: Column(
                      children: [
                        history(
                            date: "Today . 12:00 am",
                            text: "Regular ECG",
                            stackColor: Color(0xFF1BE43B)
                        ),
                        history(
                            date: "14 Jul 2022 . 12:00 am",
                            text: "Irregular ECG",
                            stackColor: Color(0xFFFAB400)
                        ),
                        history(
                            date: "14 Jul 2022 . 12:00 am",
                            text: "Abnormal ECG",
                            stackColor: Color(0xFFFF6161)
                        ),
                        SizedBox(height: getFontSize(10, context),),
                      ]),)
              ),

            ],)
        )
    );
  }


 history({
    required text,
    required date,
    required stackColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: getFontSize(14, context)),
      height: getFontSize(85, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only( right: getFontSize(10, context)),
      child: Row(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child:
              SvgPicture.asset("assets/images/irr.svg", fit: BoxFit.fitHeight, color: stackColor,)
          ),
          SizedBox(width: getFontSize(16, context)),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getFontSize(18, context),
                        ),
                      ),
                      SizedBox(height: getFontSize(5, context),),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: getFontSize(10, context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getFontSize(4, context)),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: getFontSize(16, context),
                    color: Colors.black,
                  ),
                ),




              ],),

          )],
      ),
    );
  }


}