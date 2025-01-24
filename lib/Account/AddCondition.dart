import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../MainManvigator.dart';



void main(){
  runApp(AddCondition());
}

class AddCondition extends StatefulWidget {
  AddCondition({super.key});
  @override
  _AddConditionScreen createState() => _AddConditionScreen();
}

class _AddConditionScreen extends  State<AddCondition> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
          onTap: () => Navigator.pop(context),
          child: 
              InkWell(
          onTap: () => Navigator.pop(context),
          child: 
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

              ),

              ),

              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Add a  Condition',
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
        SizedBox(height: getFontSize(30, context),),
        textField(textType: TextInputType.text,
            textHeader: "Name of condition",
            textHint: "Input Name"),

        textField(textType: TextInputType.text,
            textHeader: "How long have you had this",
            textHint: "Duration"),

        textField(textType: TextInputType.text,
            textHeader: "Current medication (if any)",
            textHint: "Medication"),

        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (builder) => MainNavigator(index: 3,)), // Navigate to Login screen
                  (Route<dynamic> route) => false, // Remove all previous routes
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: getFontSize(12.0, context), horizontal: getFontSize(24.0, context)),
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    ))) ;
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
              vertical: getFontSize(15.0, context), // Height of 50 (including padding)
              horizontal: getFontSize(10.0, context),
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
        SizedBox(height: getFontSize(22, context),)
      ],);
  }
}