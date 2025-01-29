import '../components/colors/colours.dart';
 
import '../Main/Dashboard.dart';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Notifications.dart';
import 'package:flutter_app/Medication/OrderDeatils.dart';
import 'package:flutter_app/QuickCheckup.dart';
import 'package:flutter_app/Medication/RenewOrderSummary.dart';
import 'package:flutter_app/Medication/TakeAQuickCheckup.dart';
import 'package:flutter_svg/svg.dart';

import 'MedicationUsageConfirmation.dart';
import 'SelectMedicationToRenew.dart';

void main(){
  runApp(NoMedication());
}

class NoMedication extends StatefulWidget {
  NoMedication({super.key});
  @override
  _NoMedicationScreen createState() => _NoMedicationScreen();
}

class _NoMedicationScreen extends  State<NoMedication> {
  String? _selectedValue;
  late List<dynamic> sectionList = [orderNewDrugSection(), takeAQuickCheckupSection(), viewOrderSection()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: AppColors.gray[100],
            appBar: AppBar(
          automaticallyImplyLeading: false,
              title: Row(
                children: [
                Text(
                      'Medication',
                      style: TextStyle(
                        color: Color(0xFF2E2E42),
                        fontSize: getFontSize(26, context), // Font size
                        fontWeight: FontWeight.bold, // Bold text
                      ),
                    ),
                  Spacer(),
                  Row(
                    children: [
                       SvgPicture.asset('assets/images/eletric.svg'),
                      SizedBox(width: getFontSize(11, context),),
                      Stack(
                        children: [
                          SvgPicture.asset('assets/images/nots.svg'),
                          Positioned(
                            top: getFontSize(0, context),
                            right: getFontSize(0, context),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Notifications()));
                              },
                              child: Container(
                              width: getFontSize(10, context),
                              height: getFontSize(10, context),
                              decoration: BoxDecoration(
                                color: Color(0xffE40404),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: getFontSize(2, context), color: AppColors.gray[100]),
                              ),
                            ),
                            ),
                          ),
                        ],
                      )

                    ],
                  )


                ],
              ),
              centerTitle: true,
            ),
            body: Padding(padding: EdgeInsets.all(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap:  () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TakeAQuickCheckup()));
                  },
                  child:
                quickActionButtons(
                  text: "Take a quick checkup",
                  description: "You don’t have any medications as of now. quick session with a doctor/hospital.",
                  icon: "assets/images/box.svg",
                ),
                ),

                GestureDetector(
                  onTap:  () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicationUsageConfirmation()));
                  },
                  child:
                  quickActionButtons(
                  text: "Log today's Prescription",
                  description: "Check that  you have taken your drugs today",
                  icon: "assets/images/check.svg",
                ),
                ),

                GestureDetector(
                  onTap:  () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectMedicationToRenew()));
                  },
                  child:
                  quickActionButtons(
                  text: "Order new Medication",
                  description: "You previous prescriptions have been exhausted",
                  icon: "assets/images/drugs.svg",
                ),
                ),

                GestureDetector(
                  onTap:  () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDeatils()));
                  },
                  child:
                  quickActionButtons(
                  text: "Order history",
                  description: "Your order for new medication is processing",
                  icon: "assets/images/bikeman.svg",
                ),
                ),

                // randomMedicationChooser(),
                SizedBox(height: getFontSize(40, context),),

                Row(
                  children: [
                  Text('Prescription History', style: TextStyle(
                  color: Color(0xFF2E2E42),
                  fontSize: getFontSize(18, context), // Font size
                  fontWeight: FontWeight.bold, // Bold text
                ),
                  ),
                    Spacer(),

                    Text('See all', style: TextStyle(
                      color: Color(0xFF2E2E42),
                      fontSize: getFontSize(12, context),
                    ),),
                  ],
                ),
                SizedBox(height: getFontSize(20, context),),

                // noHistory(),
                Expanded(child: SingleChildScrollView(
                    child:
                Column(
                  children: [
                    history(
                        des: "Prescription by Dr. Chima",
                        date: '11th June - 11 July 2022'
                    ),

                    history(
                        des: "Prescription by Dr. Chima",
                        date: '11th June - 11 July 2022'
                    ),

                    history(
                        des: "Prescription by Dr. Chima",
                        date: '11th June - 11 July 2022'
                    ),

                    history(
                        des: "Prescription by Dr. Chima",
                        date: '11th June - 11 July 2022'
                    ),

                  ],
                )
                )
                )



              ],
            ),
            )
        )
    );
  }

   randomMedicationChooser(){
    return sectionList[Random.secure().nextInt(3)];
  }

  viewOrderSection(){
    return  Column(
        children: [
          SizedBox(height: getFontSize(40, context),),
          SvgPicture.asset('assets/images/bikeman.svg'),
          SizedBox(height: getFontSize(20, context),),
          Container(
            width: getFontSize(292, context),
            child: Text('Your order for new medications is processing. You will be notified when it’s ready.'),
          ),
          SizedBox(height: getFontSize(20, context),),
          SizedBox(
            width: getFontSize(242, context),
            child:  ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDeatils()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue[700],
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Text(
                  'View orders',
                  style: TextStyle(color: AppColors.gray[100], fontSize: getFontSize(16, context)),
                ),
              ),
            ),
          ),
        ]
    );
  }

  orderNewDrugSection(){
    return Column(
        children: [
          SizedBox(height: getFontSize(40, context),),
          SvgPicture.asset('assets/images/drugs.svg'),
          SizedBox(height: getFontSize(20, context),),
          Text('You prescriptions have been exhausted'),
          SizedBox(height: getFontSize(20, context),),
          SizedBox(
            // width: getFontSize(242, context),
            child:  ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RenewOrderSummary()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                child: Text(
                  'Order new medications',
                  style: TextStyle(color: AppColors.gray[100], fontSize: getFontSize(15, context)),
                ),
              ),
            ),
          ),
        ]
    );
  }

  takeAQuickCheckupSection() {
    return  DottedBorder(
      color:  Colors.grey.withOpacity(0.70),
      radius: Radius.circular(19),
      dashPattern: [8, 6],
      borderType: BorderType.RRect,
      strokeWidth: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: getFontSize(342, context),
        height: getFontSize(298, context),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset('assets/images/box.svg'),
            SizedBox(height: getFontSize(20, context),),
            Container(
              width: getFontSize(241, context),
              child:
            Text(textAlign: TextAlign.center,'You don’t have any medications as of now. Tap the button below for a quick session with a doctor/hospital/pharmacy.', style: TextStyle(fontSize: getFontSize(14.5, context),
                color: AppColors.gray[700].withOpacity(0.40)),),),
            SizedBox(height: getFontSize(12, context),),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to MedicationUsageConfirmation Screen
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TakeAQuickCheckup()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue[700],
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Take a quick checkup  ',
                    style: TextStyle(color: AppColors.gray[100], fontSize: getFontSize(16, context)),
                  ),
                ),
              ),
            ),

            Spacer(),

          ],
        ),


      ),
    );
  }

  noHistory() {
    return Column(children: [
      SizedBox(height: getFontSize(30, context),),
      // Spacer(),
      DottedBorder(
      color:  Colors.grey.withOpacity(0.70),
      radius: Radius.circular(19),
      dashPattern: [8, 6],
      borderType: BorderType.RRect,
      strokeWidth: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: getFontSize(342, context),
        height: getFontSize(146, context),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No medication history yet.', style: TextStyle(fontSize: getFontSize(16, context),
                color: AppColors.gray[700].withOpacity(0.40)),),
            ],
        ),


      ),
    ),
      // Spacer(),
    ]
    );
  }

  history({required String des,
    required String date}) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> MedicationUsageConfirmation()));
      },
        child: Container(
      padding: EdgeInsets.only(left: getFontSize(14, context),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(des, style: TextStyle(fontSize: getFontSize(18, context), color: AppColors.gray[700])),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.blue[600],
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.only(right: getFontSize(10, context), left: getFontSize(10, context), top: getFontSize(5, context), bottom: getFontSize(5, context)),
                child: Text('View details', style: TextStyle(fontSize: getFontSize(10, context), color: AppColors.blue[700])),
              ),
            ],
          ),
          SizedBox(height: getFontSize(5, context)),
          Text(date),
          SizedBox(height: getFontSize(20, context)),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(20, context)),
        ],
      ),
      ),
    );
  }

  quickActionButtons({
    required String text,
    required String description,
    required String icon
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.blue[600].withOpacity(0.30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: 30, height: 30,),
          SizedBox(width: getFontSize(8, context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(fontSize: getFontSize(18, context), color: AppColors.blue[700], fontWeight: FontWeight.w600)),
              SizedBox(height: getFontSize(3, context)),
             Container(
               width: 210,
                child: Text(
                  maxLines: 4,
                  description,
                  style: TextStyle(
                    fontSize: getFontSize(13, context),
                    color: AppColors.gray[500],
                  ),
                ),
              )

            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_outlined, color: AppColors.blue[700],)
        ],
      ),
    );
  }
}