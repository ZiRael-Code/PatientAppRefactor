import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';
import 'Main/Dashboard.dart';


void main(){
  runApp(AddEntry());
}

class AddEntry extends StatefulWidget {
  AddEntry({super.key});
  @override
  _AddEntryScreen createState() => _AddEntryScreen();
}

class _AddEntryScreen extends  State<AddEntry> {
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
                child:
                Center(child: Text(
                  'Add Entry',
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

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child:
              Text(

                'Vital to measure',
                style: TextStyle(
                  fontSize: getFontSize(16.0, context),
                ),
              ),
            ),

            SizedBox(height: getFontSize(15.0, context)),

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
          ],),
        SizedBox(height: getFontSize(25.0, context)),

        textField(
            textType: TextInputType.number,
            textHeader: 'Vital to measure',
            textHint: "e.g blood pressure"
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
    ),
    ))));
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