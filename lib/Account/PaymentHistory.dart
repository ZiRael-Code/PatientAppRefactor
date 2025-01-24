import '../Main/Dashboard.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Monty.dart';
import 'TransactionDetails.dart';

void main() {
  runApp(PaymentHistory());
}

class PaymentHistory extends StatefulWidget {

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();

}



class _PaymentHistoryState extends State<PaymentHistory> {
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
                  'Payment history',
                  style: TextStyle(
                    fontSize: getFontSize(20, context),
                    fontWeight: FontWeight.bold,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                height: getFontSize(23, context),
                width: getFontSize(23, context),
                child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.blue, size: getFontSize(15, context),),),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.20),
                ),
              ),
              SizedBox(width: getFontSize(8, context),),
              InkWell(
                onTap: (){
                  showMonthySheet();
                },
                child:
                Text(
                'August',
                style: TextStyle(
                  fontSize: getFontSize(20, context),
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              SizedBox(width: getFontSize(8, context),),
              Container(
                height: getFontSize(23, context),
                width: getFontSize(23, context),
                child: Center(child:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue, size: getFontSize(15, context),),),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.20),
                ),
              ),


            ],),

              SizedBox(height: getFontSize(35, context),),
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
                  transactionHistories(
                    date: "16/08/2022",
                    name: "WELLUE BP2 CONNECT",
                    type: "Device",
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
        child: Container(
      child:
      Column(
        children: [
          Row(children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: getFontSize(14, context),
                      fontWeight: FontWeight.w500,
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
      ),
    );
  }

  void showMonthySheet() {
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
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Monty()
          );
        }
    );
  }
}