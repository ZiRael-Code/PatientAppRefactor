import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(MeasureBloodPresure());
}

class MeasureBloodPresure extends StatefulWidget {
  @override
  _MeasureBloodPresureState createState() => _MeasureBloodPresureState();
}

class _MeasureBloodPresureState extends State<MeasureBloodPresure> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  child: Icon(Icons.arrow_back_ios_new_rounded, ),
                    // color: Colors.black,
                    // width: getFontSize(8.0, context),
                    // height: getFontSize(15, context),),
                ),
                Container(
                  margin: EdgeInsets.only(left: getFontSize(35, context)),
                  alignment: Alignment.center,
                  child:
                  Center(child: Text(
                    'Measure blood presure',
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
                Text("Wear the device properly."),
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
                  width: MediaQuery.of(context).size.width * 0.63,
                  child:
                  Text("Click Start/Stop button on the device to start measuring.", ),
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
                    'Readings History',
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
                            mmhg: "107/60",
                            bpm: "67",
                            date: "Today, 12:00 am",
                            bulletColor: Colors.lightGreenAccent
                        ),
                        SizedBox(height: getFontSize(10, context),),
                        history(
                            mmhg: "125/60",
                            bpm: "88",
                            date: "14 Jul 2022. 12:00 am",
                            bulletColor: Color(0xFFFAB400)
                        ),

                        SizedBox(height: getFontSize(10, context),),
                        history(
                            mmhg: "107/60",
                            bpm: "67",
                            date: "20 Apr 2022. 10:14 am",
                            bulletColor: Color(0xFFFF6161)
                        ),
                      ]),)
              ),

            ],)
        )
    );
  }
  history({
  required mmhg,
    required bpm,
    required date,
    required bulletColor,
  }){
    return Container(
      height: getFontSize(85, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: getFontSize(10, context), right: getFontSize(10, context)),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: getFontSize(28, context)),
              width: getFontSize(11, context),
              height: getFontSize(11, context),
              decoration: BoxDecoration(
                color: bulletColor, // Lemon green color
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: getFontSize(16, context)), // Space between the circle and the texts
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      mmhg,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(18, context),
                      ),
                    ),
                    SizedBox(width: getFontSize(4, context)),
                    Text(
                      'mmHg',
                      style: TextStyle(
                        fontSize: getFontSize(10, context),
                      ),
                    ),
                    SizedBox(width: getFontSize(16, context)),
                    Text(
                      bpm,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(18, context),
                      ),
                    ),
                    SizedBox(width: getFontSize(4, context)),
                    Text(
                      'BPM',
                      style: TextStyle(
                        fontSize: getFontSize(10, context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getFontSize(4, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: getFontSize(10, context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: getFontSize(16, context),
            color: Colors.black,
          ),
        ],
      ),
    );


  }

  }