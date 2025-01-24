import '../Main/Dashboard.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../MainManvigator.dart';


void main() {
  runApp(CreditDebitCardViewCard());
}

class CreditDebitCardViewCard extends StatefulWidget{
  CreditDebitCardViewCard({super.key});

  @override
  _CreditDebitCardViewCardState createState() => _CreditDebitCardViewCardState();
}

class  _CreditDebitCardViewCardState extends State<CreditDebitCardViewCard> {
  bool isSwitched = false;

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
                  'Credit/Debit Cards',
                  style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getFontSize(15, context),),
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: getFontSize(184, context),
                  child: SvgPicture.asset(
                    'assets/images/atm.svg', fit: BoxFit.fill,),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: getFontSize(184, context),
                  alignment: Alignment.centerLeft,
                  child:
                  Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  right: getFontSize(15, context), left: getFontSize(15, context), bottom: getFontSize(7, context), top: getFontSize(7, context)),
                              decoration: BoxDecoration(
                                color: Color(0x29000000).withOpacity(0.16),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("CARD 1", style: TextStyle(
                                  fontSize: getFontSize(11, context),
                                  color: Colors.white
                              ),),
                            ),
                            Spacer(),
                            SvgPicture.asset("assets/images/cardicon.svg")
                          ],),

                        SizedBox(height: getFontSize(20.0, context)),
                        Container(
                          alignment: Alignment.centerLeft,
                          child:
                          Text(
                            '1111 2222 3333 4444',
                            style: TextStyle(
                              fontSize: getFontSize(23.0, context),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: getFontSize(15.0, context)),

                        Row(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Card holder',
                                    style: TextStyle(
                                      fontSize: getFontSize(9.0, context),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: getFontSize(7.0, context)),
                                Align(alignment: Alignment.centerLeft,
                                  child: Text(
                                    'JONATHAN ALEXANDER DOE',
                                    style: TextStyle(
                                      fontSize: getFontSize(12.0, context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: getFontSize(60, context),),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Expiry',
                                    style: TextStyle(
                                      fontSize: getFontSize(9.0, context),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: getFontSize(7.0, context)),
                                Align(alignment: Alignment.centerLeft,
                                  child: Text(
                                    '01/23',
                                    style: TextStyle(
                                      fontSize: getFontSize(12.0, context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],)

                      ]),
                ),
              ],),

              SizedBox(height: getFontSize(25.0, context)),
              textField(
                  textHeader: 'Cardholder full name',
                  textHint: "JONATHAN ALEXANDER DOE",
                  containerWight: MediaQuery
                      .of(context)
                      .size
                      .width
              ),

              SizedBox(height: getFontSize(25.0, context)),
              textField(
                  textHeader: 'Card number',
                  textHint: "1111 2222 3333 4444",
                  containerWight: MediaQuery
                      .of(context)
                      .size
                      .width
              ),
              SizedBox(height: getFontSize(25.0, context)),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textField(
                      textHeader: 'Expiry date',
                      textHint: "01/23",
                      containerWight: 157
                  ),
                  Spacer(),

                  textField(
                      textHeader: 'CVV',
                      textHint: "***",
                      containerWight: 157
                  ),

                ],),


              Row(
                children: [
                  Text(
                    "Make this card the default card",
                    style: TextStyle(
                      fontSize: getFontSize(14.0, context),
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ],
              ),


              Spacer(),
              Container(
                width: double.infinity,
                height: getFontSize(54, context),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  child: Text(
                    'Delete card',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: getFontSize(16, context),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }


  Widget textField({
    required String textHeader,
    required String textHint,
    required double containerWight
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(alignment: Alignment.centerLeft, child:
        Text(
          textHeader,
          style: TextStyle(
            color: Colors.black,
            fontSize: getFontSize(16.0, context),
          ),
          textAlign: TextAlign.start,
        ),
        ),
        SizedBox(height: getFontSize(15.0, context)),
        Container(
          width: containerWight,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: getFontSize(15.0, context),
            horizontal: getFontSize(10.0, context),
          ),
          child: Text(
            textHint,
            style: TextStyle(
              color: Colors.black,
              fontSize: getFontSize(16.0, context),
            ),
          ),
        ),
      ],);
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Are you sure you want to delete this card?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: getFontSize(20, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (builder) => MainNavigator(index: 3,)), // Navigate to Login screen
                              (Route<dynamic> route) => false, // Remove all previous routes
                        );
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(
                            0.15),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}