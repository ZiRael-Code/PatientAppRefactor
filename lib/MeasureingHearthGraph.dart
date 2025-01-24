import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureingHearthGraph());
}

class MeasureingHearthGraph extends StatefulWidget {
  MeasureingHearthGraph({super.key});
  @override
  _MeasureingHearthGraphScreen createState() => _MeasureingHearthGraphScreen();
}

class _MeasureingHearthGraphScreen extends  State<MeasureingHearthGraph> {
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
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                  SvgPicture.asset('assets/images/graph2.svg'),
                  SizedBox(height: MediaQuery.of(context).size.height*0.020),

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