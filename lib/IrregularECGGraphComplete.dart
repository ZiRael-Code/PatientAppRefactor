import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(IrregularECGGraphComplete());
}

class IrregularECGGraphComplete extends StatefulWidget {
  IrregularECGGraphComplete({super.key});
  @override
  _IrregularECGGraphCompleteScreen createState() => _IrregularECGGraphCompleteScreen();
}

class _IrregularECGGraphCompleteScreen extends  State<IrregularECGGraphComplete> {
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
        body: SingleChildScrollView(
          child:
        Container(
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
            Align(
              child:
              Column(
                children: [
                  SizedBox(height: getFontSize(30, context)),
                       Column(
                          children: [
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
                                              color: Color(0xffFF618F),
                                            ),
                                            width: getFontSize(46, context),
                                            height: getFontSize(46, context),
                                            padding: EdgeInsets.all(8),
                                            child: SvgPicture.asset('assets/images/hearth.svg'),
                                          ),

                                        ],
                                      ),
                                      SizedBox(height: getFontSize(15, context),),
                                      SvgPicture.asset('assets/images/line.svg'),
                                      SizedBox(height: getFontSize(15, context),),
                                      Row(
                                        children: [
                                          Icon(Icons.info),
                                          SizedBox(width: getFontSize(10, context),),
                                          Text('Irregular ECG'),
                                        ],
                                      )
                                    ]
                                )
                            ),
                            SizedBox(height: getFontSize(15, context),),


                          ]
                      ),
                  SizedBox(height: getFontSize(25, context),),
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
                  SizedBox(height: getFontSize(15, context),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    width: MediaQuery.of(context).size.width * 0.75,
                    child:
                    Text("Due to the sporadic and transient nature of ECG events,it is normal for each measurement result to be different. It is recommended that you increase the frequency of monitoring and capture incidents in a timely manner."),
                  ),
                  ]
              ),
                  SizedBox(height: getFontSize(20, context),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    width: MediaQuery.of(context).size.width * 0.75,
                    child:
                    Text("The results of this analysis are only for reference in daily heart health monitoring, they cannot replace the medical diagnosisEx results, and cannot used for clinical diagnosisEx and treatment."),
                  ),
                  ]
              )

            ]))))));
  }
}