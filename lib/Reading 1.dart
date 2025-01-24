import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(Reading());
}

class Reading extends StatefulWidget {
  Reading({super.key});
  @override
  _ReadingScreen createState() => _ReadingScreen();
}

class _ReadingScreen extends  State<Reading> {
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
              Text('Reading 1', style: TextStyle(fontSize: getFontSize(20, context))),
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
                                Text('Irregular ECG'),
                                Spacer(),
                                Icon(Icons.info),
                                Container(
                                  color: Color(0xff1BE43B).withOpacity(0.15),
                                  child: Text('Normal', style: TextStyle(color: Color(0xff1BE43B)),),
                                )
                              ],
                            )
                          ]
                      )
                  ),

                  SizedBox(height: getFontSize(25, context)),
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                        color: Color(0xffE2EDFF)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline, color: Colors.blue,),
                        SizedBox(width: getFontSize(7, context)),
                        Text('Edit entry', style: TextStyle(fontSize: getFontSize(16, context), color: Colors.blue),),
                      ],
                    ),
                  )

                ],
              ),
            ))));
  }
  edit_entry(){
    return Column(
      children: [
        Text('Edit Entry', style: TextStyle(fontSize: getFontSize(18, context))),
        SizedBox(height: getFontSize(20, context),),
        Text(

          'Vital to measure',
          style: TextStyle(
            fontSize: getFontSize(16.0, context),
          ),
    ),


          // Account Number TextField
          TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              hintText: 'e.g blood pressure',
              hintStyle: TextStyle(
                color: Color(0xffF2F2F2),
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
    SizedBox(height: getFontSize(25.0, context)),

    textField(
    textType: TextInputType.number,
    textHeader: 'Measurement reading',
    textHint: "79 mmHg "
    ),
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
              'Save entry',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    );
  }

  textField({
    required TextInputType textType,
    required String textHeader,
    required String textHint
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child:
          Text(

            textHeader,
            style: TextStyle(
              fontSize: getFontSize(16.0, context),
            ),
          ),
        ),

        SizedBox(height: getFontSize(15.0, context)),

        // Account Number TextField
        TextField(
          decoration: InputDecoration(
            hintText: textHint,
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
          keyboardType: textType,
          style: TextStyle(
            fontSize: getFontSize(16.0, context),
          ),
        ),
      ],);
  }
}