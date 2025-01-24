import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureingSquareGraph());
}

class MeasureingSquareGraph extends StatefulWidget {
  MeasureingSquareGraph({super.key});
  @override
  _MeasureingSquareGraphScreen createState() => _MeasureingSquareGraphScreen();
}

class _MeasureingSquareGraphScreen extends  State<MeasureingSquareGraph> {
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
          padding: EdgeInsets.only(left: getFontSize(15, context)),
          child: Column(
            children: [
        Row(
          children: [
            Column(
              children: [
                Text('107/60', style: TextStyle(fontSize: getFontSize(26, context)),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SYS/DIA  ', style: TextStyle(fontSize: getFontSize(10, context)),),
                    Text('mmHg', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: getFontSize(10, context)),)
                  ],
                )
              ],
            ),
            SizedBox(width: getFontSize(35, context),),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('67', style: TextStyle(fontSize: getFontSize(26, context)),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pulse rate  ', style: TextStyle(fontSize: getFontSize(10, context)),),
                    Text('/min', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: getFontSize(10, context)),)
                  ],
                )
              ],
            )
          ],
        ),
              SizedBox(height: getFontSize(15, context),),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('83', style: TextStyle(fontSize: getFontSize(18, context)),),
                Row(
                  children: [
                    Text('MAP  ', style: TextStyle(fontSize: getFontSize(10, context)),),
                    Text('mmHg', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: getFontSize(10, context)),)
                  ],
                )
              ],
            ),
            SizedBox(width: getFontSize(55, context),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('64', style: TextStyle(fontSize: getFontSize(26, context)),),
                Row(
                  children: [
                    Text('Pulse pressure  ', style: TextStyle(fontSize: getFontSize(10, context)),),
                    Text('mmHg', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: getFontSize(10, context)),)
                  ],
                )
              ],
            )
          ],
        ),
          ]
        )
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.07),
        SvgPicture.asset('assets/images/colorgraph.svg'),
        SizedBox(height: MediaQuery.of(context).size.height*0.032),
        Container(
          width: MediaQuery.of(context).size.width * 0.54,
          child: Text(textAlign: TextAlign.center, '*press START/STOP button to start or stop measuring'),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.12),
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
              'Back to readings',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    ))));
  }
}