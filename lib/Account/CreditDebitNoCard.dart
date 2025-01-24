import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'CreditDebitCardAddCard.dart';

void main() {
  runApp(CreditDebitNoCard());
}

class CreditDebitNoCard extends StatefulWidget {
  CreditDebitNoCard({super.key});

  @override
  _CreditDebitNoCardScreen createState() => _CreditDebitNoCardScreen();
}

class _CreditDebitNoCardScreen extends State<CreditDebitNoCard> {
  String? _selectedValue;
  bool isSelected = false;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(
          automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Container(
                    width: getFontSize(35, context),
                    height: getFontSize(35, context),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFFE5E5E5),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/back.svg',
                      width: getFontSize(8.0, context),
                      height: getFontSize(15, context),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Withdraw funds',
                      style: TextStyle(
                          fontSize: getFontSize(20, context),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            body: Container(
                padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
                child: Align(
                  child: Column(
                    children: [
                      SizedBox(height: getFontSize(130, context)),

                      SvgPicture.asset("assets/images/wallecuatet.svg"),
                      SizedBox(height: getFontSize(140, context)),
                      Center(child: Text(
                        'You have no cards yet.',
                        style: TextStyle(
                          fontSize: getFontSize(18.0, context),
                          color: Colors.black,
                        ),
                        ),
                      ),
                      SizedBox(height: getFontSize(20, context)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreditDebitCardAddCard(),
                            ),
                          );
                        },
                        child:
                      Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        height: getFontSize(54, context),
                        decoration: BoxDecoration(
                          color: Color(0xFF3C8AFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child:  Text(
                            'Add new card',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getFontSize(18, context),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
  }

}