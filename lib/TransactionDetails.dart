import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(TransactionDetails());
}

class TransactionDetails extends StatefulWidget {
  TransactionDetails({super.key});
  @override
  _TransactionDetailsScreen createState() => _TransactionDetailsScreen();
}

class _TransactionDetailsScreen extends  State<TransactionDetails> {
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
                  'Appointment details',
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
          padding: EdgeInsets.only(top: getFontSize(12, context), bottom: getFontSize(12, context), left: getFontSize(16, context), right: getFontSize(16, context)),
          decoration: BoxDecoration(
            color: Color(0xffE5E5E5),
            borderRadius: BorderRadius.circular(50)
          ),
          child: Text('Appointment', style: TextStyle(fontSize: getFontSize(16, context)),),
        ),
        SizedBox(height: getFontSize(20, context)),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: getFontSize(103, context),
                  child: Row(
                    children: [
                      Container(
                        width: getFontSize(56, context),
                        height: getFontSize(56, context),
                     child:
                     CircleAvatar(
                          backgroundImage: AssetImage('assets/images/doc.png'),
                          radius: 50
                      ),
                      ),

                      SizedBox(width: getFontSize(10, context)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text("Dr. Muiz Sanni", style: TextStyle(fontSize: getFontSize(20, context), color: Colors.black, fontWeight: FontWeight.bold),)),
                          SizedBox(height: getFontSize(5, context),),
                          Center(child: Text("Cardiovascular surgeon", style: TextStyle(color: Colors.grey),),),
                        ],
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color:  Colors.black.withOpacity(0.1)),
                  ),
                ),

                SizedBox(height: getFontSize(45, context),),

                Row(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Time:", style: TextStyle(color: Color(0xFF2E2E42)),),
                          Text("12:00pm",  style: TextStyle(color: Colors.black,fontSize: getFontSize(14, context), fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Spacer(),

                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                            Text("12th July 2022",  style: TextStyle(fontSize: getFontSize(14, context),color: Colors.black, fontWeight: FontWeight.bold))
                          ]
                      ),
                    )
                  ],
                ),
                SizedBox(height: getFontSize(25, context),),
                Row(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Appointment Type:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                          Text("Online", style: TextStyle(fontSize: getFontSize(14, context),color: Colors.black, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Spacer(),

                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Consultation fee:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                            Text("N20,000",  style: TextStyle(fontSize: getFontSize(28, context),color: Colors.blue, fontWeight: FontWeight.bold))
                          ]
                      ),
                    )
                  ],
                ),


              ],
            )

    )])) ));
  }
}