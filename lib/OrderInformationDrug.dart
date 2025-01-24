import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main() {
  runApp(OrderInformationDrug());
}

class OrderInformationDrug extends StatefulWidget {
  OrderInformationDrug({super.key});

  @override
  _OrderInformationDrugScreen createState() => _OrderInformationDrugScreen();
}

class _OrderInformationDrugScreen extends State<OrderInformationDrug> {
  String? _selectedValue;
  bool isFilterOpen = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Spacer(),
              Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Order information',
                    style: TextStyle(fontSize: getFontSize(20, context), fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
          child: Align(
            child: Column(
              children: [
                SizedBox(height: getFontSize(30, context)),
                Container(
                  margin: EdgeInsets.only(bottom: getFontSize(20, context)),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      width: getFontSize(1, context),
                      color: Colors.black.withOpacity(0.070),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/images/pill1.svg'),
                      SizedBox(width: getFontSize(8, context)),
                      Text(
                        '12/06/2022 - ',
                        style: TextStyle(
                          color: Color(0xff218130),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Prescriptions',
                        style: TextStyle(
                          color: Color(0xff218130),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFilterOpen = !isFilterOpen; // Toggle the dropdown and icon
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: getFontSize(50, context),
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          color: Color(0xFFE2EDFF),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'See details',
                              style: TextStyle(
                                fontSize: getFontSize(16, context),
                                color: Color(0xFF3C8AFF),
                              ),
                            ),
                            SizedBox(width: getFontSize(15, context)),
                            Icon(
                              isFilterOpen
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.blue,
                              size: getFontSize(26, context),
                            ),
                          ],
                        ),
                      ),
                      if (isFilterOpen)
                        Container(
                          margin: EdgeInsets.only(top: getFontSize(16, context)), // Spacing between row and dropdown
                          width: double.infinity, // Matches screen width
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('No. of medications:',
                                  style: TextStyle(
                                    fontSize: getFontSize(14, context),
                                    color: Colors.black.withOpacity(0.55),
                                  )
                                  ),
                                  Spacer(),
                                  Text('3 drugs',
                                  style: TextStyle(
                                    fontSize: getFontSize(14, context),
                                    color: Colors.black,
                                  )
                                  )
                                ],
                              ),
  SizedBox(height: getFontSize(25, context),),
                              Row(
                                children: [
                                  Text('Price:',
                                  style: TextStyle(
                                    fontSize: getFontSize(14, context),
                                    color: Colors.black.withOpacity(0.55),
                                  )
                                  ),
                                  Spacer(),
                                  Text('N25,000.00',
                                  style: TextStyle(
                                    fontSize: getFontSize(14, context),
                                    color: Colors.blue,
                                  )
                                  )
                                ],
                              ),
                              SizedBox(height: getFontSize(25, context),),
                              Row(
                                children: [
                                  Text('TOTAL:',
                                  style: TextStyle(
                                    fontSize: getFontSize(14, context),
                                    color: Colors.black.withOpacity(0.55),
                                  )
                                  ),
                                  Spacer(),
                                  Text('N5,500.00',
                                  style: TextStyle(
                                    fontSize: getFontSize(16, context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  )
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: getFontSize(15, context)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      'Proceed to checkout',
                      style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}