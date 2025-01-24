import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(SelectCountry());
}

class SelectCountry extends StatefulWidget {
  SelectCountry({super.key});
  @override
  _SelectCountryScreen createState() => _SelectCountryScreen();
}

class _SelectCountryScreen extends  State<SelectCountry> {
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
                  'Select country',
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
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("You can change which country you can see specialistists from",textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),
        SizedBox(height: getFontSize(25, context)),

        Container(
          padding: EdgeInsets.only(right: getFontSize(10, context)),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search country',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        SizedBox(height: getFontSize(20, context)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Afghanistan'),
            SizedBox(height: getFontSize(5, context)),
            SvgPicture.asset('assets/images/line.svg'),
            SizedBox(height: getFontSize(5, context)),
          ],
        )

      ],
    ),
    ))));
  }
}