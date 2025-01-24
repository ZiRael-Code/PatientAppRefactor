import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureingSquareGraphComplete());
}

class MeasureingSquareGraphComplete extends StatefulWidget {
  MeasureingSquareGraphComplete({super.key});
  @override
  _MeasureingSquareGraphCompleteScreen createState() => _MeasureingSquareGraphCompleteScreen();
}

class _MeasureingSquareGraphCompleteScreen extends  State<MeasureingSquareGraphComplete> {
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
            width: getFontSize(35, context),
            height: getFontSize(35, context),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFE5E5E5),
            ),
            child: Icon(Icons.share),
            ),

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
                    decoration: BoxDecoration(
                      border: Border.all(width: getFontSize(1, context), color: Colors.black.withOpacity(0.15)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                      margin: EdgeInsets.only(left: getFontSize(15, context)),
                      padding: EdgeInsets.all(15),
                      child: Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                children: [
                                  // Spacer(),
                                Column(
                                  children: [
                                    Text('107/60', style: TextStyle(fontWeight: FontWeight.bold,fontSize: getFontSize(26, context)),),
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
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.purple,
                                  ),
                                  width: getFontSize(46, context),
                                  height: getFontSize(46, context),
                                  padding: EdgeInsets.all(8),
                                  child: SvgPicture.asset('assets/images/si.svg'),
                                ),

                              ],
                            ),
                            SizedBox(height: getFontSize(15, context),),
                            SvgPicture.asset('assets/images/line.svg'),
                            SizedBox(height: getFontSize(15, context),),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Pulse rate', style: TextStyle(fontSize: getFontSize(10, context)),),
                                    Row(
                                      children: [
                                        Text('83  ', style: TextStyle(fontSize: getFontSize(10, context)),),
                                        Text('/min', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: getFontSize(10, context)),)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(width: getFontSize(55, context),),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('MAP', style: TextStyle(fontSize: getFontSize(10, context)),),
                                    Row(
                                      children: [
                                        Text('91  ', style: TextStyle(fontSize: getFontSize(10, context)),),
                                        Text('mmHg', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: getFontSize(10, context)),)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(width: getFontSize(55, context),),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Blood pressure', style: TextStyle(fontSize: getFontSize(10, context)),),
                                    Row(
                                      children: [
                                        Text('48  ', style: TextStyle(fontSize: getFontSize(10, context)),),
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
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                  SvgPicture.asset('assets/images/colorgraph.svg'),
                  SizedBox(height: MediaQuery.of(context).size.height*0.020),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.54,
                    child: Text(textAlign: TextAlign.center, '*press START/STOP button to start or stop measuring'),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.06),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                  // Account Number TextField
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Note',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0, // Height of 50 (including padding)
                        horizontal: 10.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: getFontSize(16.0, context),
                    ),
                  ),
                )
                ],
              ),
            ])))));
  }
}