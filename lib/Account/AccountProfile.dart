import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/Account/ResetPin.dart';
import 'package:flutter_app/Account/CreditDebitCardViewCard.dart';
import 'package:flutter_svg/svg.dart';

import 'BlogAndAticles.dart';
import 'CreditDebitCard.dart';
import 'CreditDebitCardAvailableCard.dart';
import 'CreditDebitNoCard.dart';
import 'CustomerCareOption.dart';
import '../Main/Dashboard.dart';
import 'DeviceOrder.dart';
import 'DeviceOwned.dart';
import '../HealthStatistic.dart';
import '../PersonalHistoryRecords.dart';
import 'EditProfile.dart';
import 'FAQ.dart';
import 'HowItWorks.dart';
import 'Referral/Referrals.dart';

class AccountProfile extends StatefulWidget {
  AccountProfile({super.key});

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  List<dynamic> randomCreditCardMock = [CreditDebitNoCard(), CreditDebitCardAvailableCard()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Scaffold(
            backgroundColor: Color(0xffF2F2F2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: getFontSize(20, context), right: getFontSize(20, context)),
                  width: double.infinity,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        'Account',
                        style: TextStyle(
                              fontSize: getFontSize(29, context),
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E2E42),
                        ),
                      ),
                          SizedBox(height: getFontSize(10, context),),
                      Container(
                        width: double.infinity,
                            padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                                color: Color(0x0D000000),
                          ),
                        ),
                        child: Row(
                          children: [
                            // ClipOval for round image
                            ClipOval(
                              child: Image.asset(
                                'assets/images/rema.png',
                                    height: getFontSize(60, context),
                                    width: getFontSize(60, context),
                                fit: BoxFit.cover,
                              ),
                            ),
                                 SizedBox(width: getFontSize(16, context)),
                                Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Sanni Muiz . ',
                                      style: TextStyle(
                                            fontSize: getFontSize(22, context),
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2E2E42), // Text color
                                      ),
                                    ),
                                    Text(
                                      "Doctor",
                                      style: TextStyle(
                                          color: Colors.black12, fontSize: getFontSize(17, context)),
                                    )
                                  ],
                                ),

                                SizedBox(height: getFontSize(8, context)),
                                // Spacing between the two texts
                                Text(
                                  'johndoe@gmail.com', // Email text
                                  style: TextStyle(
                                        fontSize: getFontSize(14, context),
                                    color: Colors
                                        .blue, // Blue color for the email text
                                  ),
                                ),
                              ],
                            ),
                                Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                alignment: Alignment.topRight,
                                width: getFontSize(27, context),
                                height: getFontSize(27, context),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue, // Blue background
                                ),
                                child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditProfile(),
                                          ),
                                        );
                                      },
                                      child:  Center(
                                  child: Icon(
                                    Icons.edit, // Write (edit) icon
                                    color: Colors.white, // White icon color
                                        size: getFontSize(16, context), // Adjust the size as needed
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                           SizedBox(
                        height: getFontSize(30, context),
                      ),
                    ],
                  )),
              Container(
                    padding: EdgeInsets.only(left: getFontSize(20, context)),
                alignment: Alignment.centerLeft,
                    margin:  EdgeInsets.only(bottom: getFontSize(20, context), top: getFontSize(20, context)),
                child:  Text(
                  'Personal Details',
                  style: TextStyle(
                    fontSize: getFontSize(18, context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                      padding:  EdgeInsets.only(top: getFontSize(20, context), left: getFontSize(20, context), right: getFontSize(20, context)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    details(
                        icon: Icons.person,
                        detailType: "Name",
                        detailInfo: "Sanni Muiz Dolapo",
                        shouldLine: true),
                    details(
                        icon: Icons.phone,
                        detailType: "Phone Number",
                        detailInfo: "081112223344",
                        shouldLine: true),
                    details(
                        icon: Icons.email,
                        detailType: "Email Address",
                        detailInfo: "johndoe@gmail.com",
                        shouldLine: true),
                    details(
                        icon: Icons.male,
                        detailType: "Email Address",
                        detailInfo: "johndoe@gmail.com",
                        shouldLine: true),
                  ])),
              Container(
                    padding:  EdgeInsets.only(left: getFontSize(20, context)),
                alignment: Alignment.centerLeft,
                    margin:  EdgeInsets.only(bottom: getFontSize(20, context), top: getFontSize(20, context)),
                    child:  Text(
                  'Referrals',
                  style: TextStyle(
                    fontSize: getFontSize(18, context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                    padding: EdgeInsets.only(
                    top: getFontSize(20, context), left: getFontSize(20, context), right: getFontSize(20, context), bottom: getFontSize(10, context)),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Referrals(),
                      ),
                    );
                  },
                  child: detailsNoCol(
                      icon: Icons.link,
                      detailInfo: "Refer someone",
                      shouldLine: false),
                ),
              ),
              Container(
                    padding: EdgeInsets.only(left: getFontSize(20, context)),
                alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: getFontSize(20, context), top: getFontSize(20, context)),
                    child: Text(
                  'Payments',
                  style: TextStyle(
                    fontSize: getFontSize(18, context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                    padding: EdgeInsets.only(
                    top: getFontSize(20, context), left: getFontSize(20, context), right: getFontSize(20, context), bottom: getFontSize(10, context)),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreditDebitCard())),
                      child: detailsNoCol(
                          icon: Icons.wallet_outlined,
                          detailInfo: "Wallet",
                          shouldLine: true),
                    ),
                        SizedBox(
                      height: getFontSize(25, context),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  randomCreditCardMock[Random.secure().nextInt(2)])),
                      child: detailsNoCol(
                          icon: Icons.credit_card,
                          detailInfo: "Credit/Debit Cards ",
                          shouldLine: true),
                    ),
                        SizedBox(
                      height: getFontSize(25, context),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  ResetPin())),
                      child: detailsNoCol(
                          icon: Icons.lock,
                          detailInfo: "PIN settings",
                          shouldLine: false),
                    )
                  ],
                ),
              ),
              Container(
                    padding: EdgeInsets.only(left: getFontSize(20, context)),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: getFontSize(20, context), top: getFontSize(20, context)),
                    child:
                    Text(
                  'Health history',
                  style: TextStyle(
                    fontSize: getFontSize(18, context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                      padding: EdgeInsets.only(
                      top: getFontSize(20, context), left: getFontSize(20, context), right: getFontSize(20, context), bottom: getFontSize(10, context)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   PersonalHistoryRecords())),
                      child: detailsNoCol(
                          icon: Icons.person,
                          detailInfo: "Personal history records",
                          shouldLine: true),
                    ),
                            SizedBox(
                      height: getFontSize(25, context),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  HealthStatistic())),
                      child: detailsNoCol(
                          icon: Icons.network_cell,
                          detailInfo: "Health statistics (in-app)",
                          shouldLine: false),
                    )
                  ])),
              Container(
                    padding: EdgeInsets.only(left: getFontSize(20, context)),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: getFontSize(20, context), top: getFontSize(20, context)),
                    child:
                    Text(
                  'Device',
                  style: TextStyle(
                    fontSize: getFontSize(18, context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                      padding: EdgeInsets.only(
                      top: getFontSize(20, context), left: getFontSize(20, context), right: getFontSize(20, context), bottom: getFontSize(10, context)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  DeviceOwned())),
                      child: detailsNoCol(
                          icon: Icons.person,
                          detailInfo: "Devices owned",
                          shouldLine: true),
                    ),
                            SizedBox(
                      height: getFontSize(25, context),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  DeviceOrder())),
                      child: detailsNoCol(
                          icon: Icons.receipt_long_outlined,
                          detailInfo: "Device Orders",
                          shouldLine: false),
                    )
                  ])),
              Container(
                    padding: EdgeInsets.only(left: getFontSize(20, context)),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: getFontSize(20, context), top: getFontSize(20, context)),
                    child:
                    Text(
                  'Help and support',
                  style: TextStyle(
                    fontSize: getFontSize(18, context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                      padding: EdgeInsets.only(
                      top: getFontSize(20, context), left: getFontSize(20, context), right: getFontSize(20, context), bottom: getFontSize(10, context)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   CustomerCareOption())),
                      child: detailsNoCol(
                          icon: Icons.headset_mic_outlined,
                          detailInfo: "Customer care",
                          shouldLine: true),
                    ),
                            SizedBox(
                      height: getFontSize(25, context),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  FAQ())),
                      child: detailsNoCol(
                          icon: Icons.question_mark,
                          detailInfo: "FAQs",
                          shouldLine: true),
                    ),
                            SizedBox(
                      height: getFontSize(25, context),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  BlogAndAticles())),
                      child: detailsNoCol(
                          icon: Icons.receipt,
                          detailInfo: "Blogs & articles",
                          shouldLine: true),
                    ),
                            SizedBox(
                      height: getFontSize(25, context),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  HowItWorks())),
                      child: detailsNoCol(
                          icon: Icons.search,
                          detailInfo: "How it works",
                          shouldLine: false),
                    ),
                  ])),
              SizedBox(
                height: getFontSize(20, context),
              ),

                  SizedBox(height: getFontSize(20, context),),

              Container(
                    padding: EdgeInsets.only(left: getFontSize(20, context), right: getFontSize(20, context), top: getFontSize(20, context)),
                height: getFontSize(90, context),
                width: double.infinity,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: detailsNoCol(
                    icon: Icons.exit_to_app,
                    detailInfo: "Logout",
                    shouldLine: false,
                    lol: "true"),
              ),
              SizedBox(
                height: getFontSize(20, context),
              )
            ],
          ),
        ))));
    }

  details(
      {required IconData icon,
      required String detailType,
      required String detailInfo,
      required bool shouldLine}) {
    return Column(children: [
      Row(
        children: [
          Container(
              width: getFontSize(41, context),
              height: getFontSize(41, context),
              decoration: BoxDecoration(
                color: Color(0xffE2EDFF),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(icon, size: getFontSize(28, context), color: Colors.blue),
              )),
          SizedBox(
            width: getFontSize(10, context),
          ),
          SizedBox(width: getFontSize(10, context),),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detailType,
                style: TextStyle(color: Colors.grey, fontSize: getFontSize(14, context)),),
              SizedBox(height: getFontSize(10, context),),
              Text(detailInfo,
                  style: TextStyle(color: Colors.black, fontSize: getFontSize(18, context)))
            ],
          )
        ],
      ),
      SizedBox(height: getFontSize(10, context)),
      SvgPicture.asset(shouldLine == true ? "assets/images/line.svg" : ""),
      SizedBox(height: getFontSize(15, context)),
    ]);
  }

  detailsNoCol(
      {required IconData icon,
      required String detailInfo,
      required bool shouldLine,
      lol}) {
    return Column(children: [
      Row(
        children: [
          Container(
              width: getFontSize(41, context),
              height: getFontSize(41, context),
              decoration: BoxDecoration(
                color: lol == null
                    ? Color(0xffE2EDFF)
                    : Colors.red.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(icon,
                    size: getFontSize(28, context), color: lol == null ? Colors.blue : Colors.red),
              )),
          SizedBox(
            width: getFontSize(10, context),
          ),
          SizedBox(width: getFontSize(10, context),),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detailInfo,
                  style: TextStyle(
                      color: lol == null ? Colors.black : Colors.red,
                      fontSize: getFontSize(18, context),
                      fontWeight:
                          lol == null ? FontWeight.normal : FontWeight.bold))
            ],
          )
        ],
      ),
      SizedBox(height: getFontSize(10, context)),
      SvgPicture.asset(shouldLine == true ? "assets/images/line.svg" : ""),
    ]);
  }
}