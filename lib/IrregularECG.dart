import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';



void main(){
  runApp(IrregularECG());
}

class IrregularECG extends StatefulWidget {
  IrregularECG({super.key});
  @override
  _IrregularECGScreen createState() => _IrregularECGScreen();
}

class _IrregularECGScreen extends  State<IrregularECG> {
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
                alignment: Alignment.center,
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: Center(child: Icon(Icons.share)),
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

           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SYS/DA text at the top
                // Adding some space between the rows

                // Row with main value and container
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Main value (107/60)
                      Text(
                        '79',
                        style: TextStyle(
                          fontSize: getFontSize(38, context),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      // Container with background and icon
                      Container(
                        width: getFontSize(46, context),
                        height: getFontSize(46, context),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF618F),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,  // Replace with your preferred icon
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  Row(children: [
                    Text(
                      'SYS/DA',
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: getFontSize(9, context),),
                    Text(
                      'mmHg',
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],),
                ],),

                SizedBox(height: getFontSize(20, context)),
                SvgPicture.asset('assets/images/line.svg'),
                SizedBox(height: getFontSize(20, context)),

                Row(
                  children: [
                    Icon(Icons.info, color: Colors.grey.withOpacity(0.70),),
                    SizedBox(width: getFontSize(10, context),),
                    Text(
                      'Irregular ECG',
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                        color: Colors.red
                      )
                    )
              ],

            )
              ],
           ),
        SizedBox(height: getFontSize(60, context),),
        Container(
          width: double.infinity,
          height: getFontSize(299, context),
          child: Image.asset('assets/images/graph.png'),
          decoration: BoxDecoration(
            
          ),
        ),
        SizedBox(height: getFontSize(60, context)),
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

  reading({required String header,
    required String value,
    required String script}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header, // Label
              style: TextStyle(fontSize: getFontSize(14, context)),
            ),
            SizedBox(height: getFontSize(10, context),),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: value, // Main value (e.g., 48)
                    style: TextStyle(
                      fontSize: getFontSize(18, context),
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(
                    child: Transform.translate(
                      offset: Offset(1, 4),
                      child: Text(
                        script, // Subscript text
                        style: TextStyle(
                          fontSize: getFontSize(12, context),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}