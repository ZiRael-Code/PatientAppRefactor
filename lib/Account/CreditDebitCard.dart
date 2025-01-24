import '../Main/Dashboard.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'FundWallet.dart';
import 'PaymentHistory.dart';
import 'TransactionDetails.dart';
import 'WithdrawFunds.dart';

void main() {
  runApp(CreditDebitCard());
}

class CreditDebitCard extends StatefulWidget {
  @override
  _CreditDebitCardState createState() => _CreditDebitCardState();
}

class _CreditDebitCardState extends State<CreditDebitCard>{
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
                      'Wallet',
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
                  width: MediaQuery.of(context).size.width,
                  height: getFontSize(90, context),
                  child: SvgPicture.asset('assets/images/card.svg', fit: BoxFit.fill,),
                ),
              Container(
                padding: EdgeInsets.only(left: getFontSize(20, context)),
                width: double.infinity,
                  height: getFontSize(90, context),
                  alignment: Alignment.centerLeft,
                  child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  'Wallet Balance',
                  style: TextStyle(
                    fontSize: getFontSize(10, context),
                    color: Colors.white
                  ),
                ),
                Text(
                  'N35,500',
                  style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),

              ],))

                ],),
                SizedBox(height: getFontSize(20, context),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child:
                  quickAction(
                      iconPath: 'assets/images/icons/dashboard/electric.png',
                      actionText: 'Fund wallet'
                  ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FundWallet(),
                  ),
                );
              }
                  ),
                  SizedBox(width: getFontSize(15, context),),
                  GestureDetector(
                    child:
                  quickAction(
                      iconPath: 'assets/images/icons/dashboard/device.png',
                      actionText: 'Withdraw fund'
                  ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WithdrawFunds(),
                        ),
                      );
                    },
                  ),
                ],),
                SizedBox(height: getFontSize(30, context),),
                Container(child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Recent transactions",
                      style: TextStyle(fontSize: getFontSize(20, context),
                          color: Colors.black,
                          fontWeight: FontWeight.bold),),
                    Spacer(),
                    ElevatedButton(
                      onPressed: (){
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent

                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => PaymentHistory(),
                          ));
                        },
                        child: Text('See all',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getFontSize(14, context),
                          color: Color(0xFF3C8AFF),
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                SizedBox(height: getFontSize(20, context),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               transactionHistories(
                 date: "'16/08/2022'",
                 name: "DR KELVIN APPOINTMENT",
                 type: "Appointment",
                 price: "N20,000",
               ),
                transactionHistories(
                 date: "16/08/2022",
                 name: "HYPERTENSION MEDICATION",
                 type: "Medications",
                 price: "N13,000",
               ),
                transactionHistories(
                 date: "16/08/2022",
                 name: "WELLUE BP2 CONNECT",
                 type: "Device",
                 price: "N8,500",
               ),
                transactionHistories(
                 date: "16/08/2022",
                 name: "HYPERTENSION MEDICATION",
                 type: "Medications",
                 price: "N13,000",
               ),
                transactionHistories(
                 date: "16/08/2022",
                 name: "WELLUE BP2 CONNECT",
                 type: "Device",
                 price: "N13,000",
               ),
            ],),
              ],
            ),
          ),
      );

  }




  Widget quickAction({
    required String iconPath,
    required String actionText,
  }){
    return Container(
      width: getFontSize(150, context),
      height: getFontSize(51, context),
      padding: EdgeInsets.only(top: getFontSize(12, context), left: getFontSize(10.0, context), bottom: getFontSize(12, context), right: getFontSize(10, context)),
      decoration: BoxDecoration(
        color: Color(0xFFC4DCFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          children: [
            Center(
              child: Container(
                width: getFontSize(27, context),
                height: getFontSize(27, context),
                decoration: BoxDecoration(
                  color: Color(0xFF3C8AFF),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Image.asset(
                    iconPath,
                    width: getFontSize(11, context),
                    height: getFontSize(14, context),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(width: getFontSize(10.0, context)),
            Text(actionText,
              style: TextStyle(
                  fontSize: getFontSize(10.0, context),
                  color: Color(0xFF3C8AFF),
              ),),
          ],
        ),
      ),
    );
  }

  transactionHistories({
    required String date,
    required String name,
    required String type,
    required String price
  }) {
    return GestureDetector(
        onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransactionDetails(),
        ),
      );
    },
    child:  Container(
      child:
      Column(
        children: [
          Row(children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: getFontSize(12, context),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: getFontSize(10, context),),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: getFontSize(12, context),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: getFontSize(16, context),
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getFontSize(10, context),),
              Text(
                date,
                style: TextStyle(
                  fontSize: getFontSize(12, context),
                ),
              ),

            ],),
          ],),
          SizedBox(height: getFontSize(10, context),),
          Container(
            width: getFontSize(313, context),
            height: getFontSize(2, context),
            decoration: BoxDecoration(
              color: Color(0x1A2E2E42),
            ),
          ),
          SizedBox(height: getFontSize(15, context),)
        ],
      ),
    )
    );
  }


}