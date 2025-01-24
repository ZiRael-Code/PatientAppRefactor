import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'WithdrawFunds.dart';

void main(){
  runApp(AddedAccountSucess());
}

class AddedAccountSucess extends StatefulWidget {
  AddedAccountSucess({super.key});
  @override
  AddedAccountSucessState createState() => AddedAccountSucessState();
}

class AddedAccountSucessState extends  State<AddedAccountSucess> {
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
                    Text(
                      'Success',
                      style: TextStyle(
                          fontSize: getFontSize(20, context),
                          fontStyle: FontStyle.normal
                      ),
                    ),
                  ),
                  Spacer(),

                ],
              ),
            ),
            body:
            Container(
                padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
                child:
                Align(
                  child:
                  Column(
                    children: [
                      SizedBox(height: getFontSize(50, context)),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.40,
                        child:

                        Align(child: Text("You have successfully added an account.", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getFontSize(16, context),
                          ),
                        ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(height: getFontSize(15, context),),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WithdrawFunds(),
                            ),
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
                            'Done',
                            style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}