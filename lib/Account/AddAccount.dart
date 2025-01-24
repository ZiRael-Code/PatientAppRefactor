import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'ConfirmName.dart';

void main(){
  runApp(AddAccount());
}

class AddAccount extends StatefulWidget {
  AddAccount({super.key});
  @override
  _AddAccountScreen createState() => _AddAccountScreen();
}

class _AddAccountScreen extends  State<AddAccount> {
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
                    Text(
                      'Add Account',
                      style: TextStyle(
                          fontSize: getFontSize(20, context),
                          fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Spacer(),

                ],
              ),
            ),
            body:  Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getFontSize(20.0, context)),
                  textField(
                    textType: TextInputType.number,
                    textHeader: 'Account Number',
                    textHint: "Enter account number"
                  ),

                  SizedBox(height: getFontSize(25.0, context)),
                  textField(
                    textType: TextInputType.number,
                    textHeader: 'Bank name',
                    textHint: "Bank"
                  ),
              SizedBox(height: getFontSize(25, context),),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmName(),
                    ),
                  );
                },
                child:
                  Align(
                    child:
                      Container(
                    width: getFontSize(178, context),
                    height: getFontSize(54, context),
                    decoration: BoxDecoration(
                      color: Color(0xFFE2EDFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(
                        'Confirm name',
                        style: TextStyle(
                          color: Color(0xFF3C8AFF),
                          fontSize: getFontSize(16, context),
                        ),
                      ),
                    ),
                  ),
                  ),
                  ),

                ],
              ),
            ),
           ) ;
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
    ],);
  }
}