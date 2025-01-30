import 'package:flutter_app/Capture/MeasureHearthRateAutomatically/HearthRateReadingResult.dart';

import '../../components/colors/colours.dart';
import '../../../Main/Dashboard.dart';
import '../../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(HearthRateReadingInterface());
}

class HearthRateReadingInterface extends StatefulWidget {
  HearthRateReadingInterface({super.key});
  @override
  _OngoingMeasuringHearthRateGraphScreen createState() => _OngoingMeasuringHearthRateGraphScreen();
}

class _OngoingMeasuringHearthRateGraphScreen extends  State<HearthRateReadingInterface> {
  String? _selectedValue;
  @override
  void initState() {
    // TODO: implement initState
      Future.delayed(Duration(milliseconds: 2000), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  HearthRateReadingResult()),
        );
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        Container(
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: getFontSize(90, context)),

        Align(
          alignment: Alignment.centerRight,
          child:
              Row(
                children: [
                  SvgPicture.asset('assets/images/battery.svg'),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFF618F),
                    ),
                    width: getFontSize(46, context),
                    height: getFontSize(46, context),
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset('assets/images/hearth.svg'),
                  ),
                ],
              )
        ),
        SizedBox(height: getFontSize(16, context)),
        Image.asset('assets/images/graph1.png'),
        SizedBox(height: getFontSize(15, context),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Stack(
          children: [
            Align(alignment: Alignment.center, child: Icon(Icons.fiber_manual_record_outlined, size: getFontSize(39, context), color: Color(0xffFF6161),)),
           

           Container(margin: EdgeInsets.only(top: getFontSize(7, context), left: getFontSize(7, context)),alignment: Alignment.center, child: Icon(Icons.fiber_manual_record, color: Color(0xffFF6161),)),

          ],
        )   ,
          SizedBox(width: getFontSize(5, context),),
            Text('00:03', style: TextStyle(fontWeight: FontWeight.bold, fontSize: getFontSize(16, context)),)
          ],
        ),
        SizedBox(height: getFontSize(10, context),),
        Text('Hold the device for 30s', style: TextStyle(fontSize: getFontSize(16, context)))

      ],
    ),
    ))));
  }
}