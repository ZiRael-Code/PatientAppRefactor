import '../Main/Dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Notifications.dart';
import 'package:flutter_svg/svg.dart';

import 'PrescriptionDetails.dart';

void main(){
  runApp(MedicationUsageConfirmation());
}

class MedicationUsageConfirmation extends StatefulWidget {
  MedicationUsageConfirmation({super.key});
  @override
  MedicationUsageConfirmationState createState() => MedicationUsageConfirmationState();
}

class MedicationUsageConfirmationState extends  State<MedicationUsageConfirmation> {
  String? _selectedValue;
  List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(1000, false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                      GestureDetector(
                        onTap: ()=>{
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Notifications()))
                        }, child: Stack(
                        children: [
                          SvgPicture.asset('assets/images/nots.svg'),
                          Positioned(
                            top: getFontSize(0, context),
                            right: getFontSize(0, context), 
                            child:  Container(
                              width: getFontSize(10, context),
                              height: getFontSize(10, context),
                              decoration: BoxDecoration(
                                color: Color(0xffE40404),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: getFontSize(2, context), color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                      )

                    ],
                  )


                ],
              ),
              centerTitle: true,
            ),
            body: Container(child:
                SingleChildScrollView(
              child:
            Padding(padding: EdgeInsets.only(left: getFontSize(15, context), right: getFontSize(15, context), top: getFontSize(10, context), bottom: getFontSize(20, context)),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: getFontSize(20, context)),
            child:
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: getFontSize(8, context), right: getFontSize(5, context)),
                      width: getFontSize(105, context),
                      decoration: BoxDecoration(
                        color: Color(0xFF000000).withOpacity(0.90),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.only(left: getFontSize(14, context), right: getFontSize(10, context)),
                      child: DropdownButton<String>(
                        value: _selectedValue,
                        hint: Text(
                          'Select a Time',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          fontSize: getFontSize(15, context),
                          color: Colors.white,
                        ),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                        dropdownColor: Color(0xFF000000), // Dark background for dropdown
                        items: <String>['Morning', 'Afternoon', 'Evening', 'Night']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white), // White text for items
                            ),
                          );
                        }).toList(),
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.only(left: getFontSize(8, context), right: getFontSize(5, context)),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff2E2E421A),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Text('Total amount of drugs left: ',  style: TextStyle(fontSize: getFontSize(13, context),)),
                          Text('80%', style: TextStyle(fontSize: getFontSize(13, context), fontWeight: FontWeight.bold)),
                        ]
                      )
                    )
                  ],
                ),
    ),
          Container(
            width: getFontSize(263, context),
            margin: EdgeInsets.only(bottom: getFontSize(20, context)),
            child: Text('Tap here after using your medications to ensure you’ve used them.', style: TextStyle(color: Color(0xff2E2E42)), textAlign: TextAlign.center,)
          ),
                Container(
                  width: getFontSize(99, context),
                    height: getFontSize(99, context),
                    margin: EdgeInsets.only(bottom: getFontSize(20, context)),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelectedList[0] ? Colors.green : Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:Center(child: SvgPicture.asset('assets/images/mark.svg', color: isSelectedList[0] ? Colors.white : Color(0xffC2C2C2))
                  ),
                  ),
               // Text('data'),

               drug(
                 index: 0,
                 icon: 'assets/images/drug1.svg',
                 name: 'Ibuprofen',
                 dosage: '1 pill(s) . 2x daily'
               ),
                drug(
                    index: 1,
                 icon: 'assets/images/drug2.svg',
                 name: 'Cough Syrup',
                 dosage: '1 pill(s) . 2x daily'
               ),
                drug(
                 index: 2,
                 icon: 'assets/images/drug1.svg',
                 name: 'Ibuprofen',
                 dosage: '1 pill(s) . 2x daily'
               ),
                drug(
                 index: 3,
                 icon: 'assets/images/drug2.svg',
                 name: 'Cough Syrup',
                 dosage: '1 pill(s) . 2x daily'
               ),
                GestureDetector(
                  onTap: ()=>{
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> PrescriptionDetails()))
                },
                  child:
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.only(left: getFontSize(14, context), right: getFontSize(14, context), bottom: getFontSize(8, context), top: getFontSize(8, context)),
                  child: Text('See more details', style: TextStyle(color: Colors.blue),),
                )
                )
                ],
            ),
            )
        )
        )
        )
    );
  }

  drug({required String icon,
    required String name,
    required String dosage,
    required int index,
  }) {
    return  GestureDetector(

        child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: getFontSize(15, context)),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: getFontSize(0.05, context), color: Colors.black)
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: getFontSize(15, context)),
            padding: EdgeInsets.all(10),
            width: getFontSize(39, context),
            height: getFontSize(56, context),
            decoration: BoxDecoration(
                color: Color(0xff40FB5E).withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Align(alignment: Alignment.topCenter, child: SvgPicture.asset(icon)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(color: Color(0xff2E2E42), fontSize: getFontSize(20, context)),),
              Text(dosage, style: TextStyle(color: Color(0xff2E2E42))),
            ],
          ),
          Spacer(),
          Container(
            width: getFontSize(33, context),
            height: getFontSize(33, context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelectedList[index] ? Colors.green : Color(0xffF2F2F2),
            ),
            child: Icon(Icons.check, color: isSelectedList[index] ? Colors.white : Color(0xffC2C2C2))
          ),
        ],
      ),
    ),
            onTap: () {
          setState(() {
            isSelectedList[index] =!isSelectedList[index];
          });
    },
    );
  }


}