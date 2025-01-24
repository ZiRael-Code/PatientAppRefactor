import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(PrescriptionInformation());
}

class PrescriptionInformation extends StatefulWidget {
  PrescriptionInformation({super.key});
  @override
  _PrescriptionInformationScreen createState() => _PrescriptionInformationScreen();
}

class _PrescriptionInformationScreen extends  State<PrescriptionInformation> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Prescription information',
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
        SizedBox(height: getFontSize(30, context)),

        drug(
          name: 'Ibuprofen',
          price: "15,000",
          pills: "15 pills"
        ),

        drug(
          name: 'Cough Syrup',
          price: "3,250",
          pills: "200ml"
        ),

        drug(
          name: 'Paracetamol',
          price: "650",
          pills: "35 pills"
        ),

        Spacer(),
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
              'Continue',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
        SizedBox(height: getFontSize(10, context),),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            side: BorderSide(
              color: Colors.blue
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Close',
              style: TextStyle(color: Colors.blue, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    ))));
  }

  drug({required String name,
    required String price,
    required String pills}) {
    return Container(
      margin: EdgeInsets.only(bottom: getFontSize(20, context)),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(14),
  border: Border.all(width: getFontSize(1, context),
      color: Colors.black.withOpacity(0.070))
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(name, style: TextStyle(fontSize: getFontSize(14, context)),),
            SizedBox(height: getFontSize(10, context),),
            Text(pills, style: TextStyle(fontSize: getFontSize(12, context), color: Color(0xff000000).withOpacity(0.60)),),
          ],),
          Spacer(),
          Text("N"+price,  style: TextStyle(fontSize: getFontSize(16, context),fontWeight: FontWeight.bold, color: Colors.blue))
        ],
      ),
    );
  }
}