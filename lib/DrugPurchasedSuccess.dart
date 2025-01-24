import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewDrugs.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';


void main(){
  runApp(DrugPurchasedSuccess());
}

class DrugPurchasedSuccess extends StatefulWidget {
  DrugPurchasedSuccess({super.key});
  @override
  _DrugPurchasedSuccessScreen createState() => _DrugPurchasedSuccessScreen();
}

class _DrugPurchasedSuccessScreen extends  State<DrugPurchasedSuccess> {
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
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.78,
              child: Text('Success', style: TextStyle(fontWeight: FontWeight.bold ),),
          ),
            SizedBox(height: getFontSize(10, context),),
            Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("Your drugs have been purchased, you’ll be notified when they’ve been delivered.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

        Spacer(),
        Container(
          height: getFontSize(50, context),
          width: MediaQuery.of(context).size.width * 0.40,
          decoration: BoxDecoration(
            color: Color(0xFFE2EDFF),
            borderRadius: BorderRadius.circular(9),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<String>(
            value: _selectedValue,
            hint: Text(
              'See details',
              style: TextStyle(
                color: Color(0xFF3C8AFF),
              ),
            ),
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(
              fontSize: getFontSize(16, context),
              color: Color(0xFF3C8AFF),
            ),
            icon: Icon(Icons.keyboard_arrow_down),
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
            items: <String>['10:00 AM', '12:00 PM', '02:00 PM', '04:00 PM']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: getFontSize(15, context),),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> NewDrugs()));
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
              'Finish',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    ))));
  }
}