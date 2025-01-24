import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MeasureVitalsManually.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureVitalsManuallyMenu());
}

class MeasureVitalsManuallyMenu extends StatefulWidget {
  MeasureVitalsManuallyMenu({super.key});
  @override
  _MeasureVitalsManuallyMenuScreen createState() => _MeasureVitalsManuallyMenuScreen();
}

class _MeasureVitalsManuallyMenuScreen extends  State<MeasureVitalsManuallyMenu> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child:
                Center(child: Text(
                  'Measure vitals manually',
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
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: getFontSize(65, context),),
        SvgPicture.asset('assets/images/machine.svg'),
        SizedBox(height: getFontSize(145, context),),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.69,
          child:
          Align(child: Text("You can still take records of your vitals’ readings even if you don’t have a device yet. Let a verified personnel take your readings and input the values here.", textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getFontSize(16, context),
            ),
          ),
          ),
        ),

        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MeasureVitalsManually()));
          },
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
              'Continue',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    )));
  }
}