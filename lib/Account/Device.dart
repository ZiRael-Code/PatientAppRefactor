import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'DeviceSummary.dart';

void main(){
  runApp(Device());
}

class Device extends StatefulWidget {
  Device({super.key});
  @override
  _DeviceScreen createState() => _DeviceScreen();
}

class _DeviceScreen extends  State<Device> {
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
                  'Device',
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
        SizedBox(height: getFontSize(25, context),),
        Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/images/dev.svg'),
               SizedBox(width: getFontSize(20, context),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('BP2 Connect 1368',style: TextStyle(fontSize: getFontSize(18, context))),
                  SizedBox(width: getFontSize(26, context),),
                 Align(alignment: Alignment.centerLeft,
                     child: Text('Connected', style: TextStyle(color: Colors.blue),))
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all( color: Colors.black.withOpacity(0.09))
          ),
        ),
        SizedBox(height: getFontSize(20, context),),

      Align(alignment: Alignment.centerLeft,
          child:
        Text('Device Reading', style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold))),
        SizedBox(height: getFontSize(20, context),),

        reading_history(
          mmhg: "107/60",
          bpm: "67",
          date: "Today, 12:00 am",
          bulletColor: Colors.lightGreenAccent,
        ),
        SizedBox(height: getFontSize(10, context),),
        reading_history(
          mmhg: "125/60",
          bpm: "88",
          date: "14 Jul 2022. 12:00 am",
          bulletColor: Color(0xFFFAB400),
        ),
        SizedBox(height: getFontSize(10, context),),
        reading_history(
          mmhg: "107/60",
          bpm: "67",
          date: "Today, 12:00 am",
          bulletColor: Colors.lightGreenAccent,
        ),
        SizedBox(height: getFontSize(10, context),),
        reading_history(
          mmhg: "125/60",
          bpm: "88",
          date: "14 Jul 2022. 12:00 am",
          bulletColor: Color(0xFFFAB400),
        ),
        SizedBox(height: getFontSize(10, context),),

        // irregular_reading_history(
        //     date: "14 Jul 2022 . 12:00 am",
        //     text: "Irregular ECG",
        //     stackColor:  Color(0xFFFAB400)
        // ),
        // SizedBox(height: getFontSize(10, context),),

    ])))));
  }


  reading_history({
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
                color: bulletColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: getFontSize(16, context)),
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
  irregular_reading_history({
    required text, 
    required date,
    required stackColor,
  }) {
    return Container(
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
              SvgPicture.asset("assets/images/irr.svg", fit: BoxFit.fitHeight,)
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