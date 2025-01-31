
import '../components/colors/colours.dart';
import '../Main/Dashboard.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'CreditDebitCardAddCard.dart';
import 'CreditDebitCardViewCard.dart';

void main() {
  runApp(CreditDebitCardAvailableCard());
}

class CreditDebitCardAvailableCard extends StatefulWidget{
  CreditDebitCardAvailableCard({super.key});

  @override
  CreditDebitCardAvailableCardState createState() => CreditDebitCardAvailableCardState();
}

class  CreditDebitCardAvailableCardState extends State<CreditDebitCardAvailableCard>{
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
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
                GestureDetector(
                  onTap: () {
                    available_card_sheet();
                  },
                  child:
                Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: getFontSize(184, context),
                  child: SvgPicture.asset('assets/images/atm.svg', fit: BoxFit.fill,),
                ),
              Container(
                padding: EdgeInsets.all( 20),
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
                  padding: EdgeInsets.only(right: getFontSize(15, context), left: getFontSize(15, context), bottom: getFontSize(7, context), top: getFontSize(7, context)),
                  decoration: BoxDecoration(
                    color: Color(0x29000000).withOpacity(0.16),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("CARD 1", style: TextStyle(
                    fontSize: getFontSize(11, context),
                    color: AppColors.gray[100]
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
                      color: AppColors.gray[100],
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
                                  color: AppColors.gray[100],
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
                                  color: AppColors.gray[100],
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
                                  color: AppColors.gray[100],
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
                                  color: AppColors.gray[100],
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),

                        ],)

      ]),
              ),
                ],)),
              Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreditDebitCardAddCard(),
                      ),
                    );
                  },
                  child:
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: getFontSize(54, context),
                  decoration: BoxDecoration(
                    color: Color(0xFF3C8AFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child:  Text(
                      'Add new card',
                      style: TextStyle(
                        color: AppColors.gray[100],
                        fontSize: getFontSize(16, context),
                      ),
                    ),
                  ),
                ),
                ),
                SizedBox(height: getFontSize(25, context),),

              ],
            ),
          ),

      );

  }




  Widget textField({
    required TextInputType textType,
    required String textHeader,
    required String textHint,
    required double containerWight
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

        Container(
        width: containerWight,
        child: TextField(
        decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(
        color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.grey[300],
        contentPadding: EdgeInsets.symmetric(
        vertical: getFontSize(15.0, context), // Adjust padding to control height
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
    )

    ],
    );
  }

  void available_card_sheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.gray[100],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: getFontSize(20, context),),
                  Center(child: Text("Available cards", style: TextStyle(fontSize: getFontSize(20, context)),),),
                  SizedBox(height: getFontSize(20, context),),
                  card(),
                  SizedBox(height: getFontSize(15, context),),
                  card(),
                ],
              )
          );
        }
    );
  }

  card(){
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreditDebitCardViewCard(),
            ),
          );
        },
        child:
        Stack(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            width: MediaQuery.of(context).size.width,
            height: getFontSize(184, context),
            child: SvgPicture.asset('assets/images/atm.svg', fit: BoxFit.fill,),
          ),
          Container(
            padding: EdgeInsets.all( 20),
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
                        padding: EdgeInsets.only(right: getFontSize(15, context), left: getFontSize(15, context), bottom: getFontSize(7, context), top: getFontSize(7, context)),
                        decoration: BoxDecoration(
                          color: Color(0x29000000).withOpacity(0.16),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("CARD 1", style: TextStyle(
                            fontSize: getFontSize(11, context),
                            color: AppColors.gray[100]
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
                        color: AppColors.gray[100],
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
                                color: AppColors.gray[100],
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
                                color: AppColors.gray[100],
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
                                color: AppColors.gray[100],
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
                                color: AppColors.gray[100],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],)

                ]),
          ),
        ],));
  }

  }