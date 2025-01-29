import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Medication/RenewOrderSummary.dart';
import 'package:flutter_svg/svg.dart';

import '../Main/Dashboard.dart';
import '../components/colors/colours.dart';

class SelectMedicationToRenew extends StatefulWidget {
  const SelectMedicationToRenew({super.key});

  @override
  State<SelectMedicationToRenew> createState() => _SelectMedicationToRenewState();
}

class _SelectMedicationToRenewState extends State<SelectMedicationToRenew> {
  String? _selectedValue;
  List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(1000, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Medication to Renew'),
      ),
        body: SafeArea(
      child: Container(
    padding: EdgeInsets.all(12),
    child: Column(
        children: [
          SingleChildScrollView(
      child: Column(
        children: [
          drug(
            price: 'N1,500',
            name: "Cough syrup",
            usage: '1 bottle:  10ml. 3X daily', index: 0
        ),
          drug(
              price: 'N1,500',
              name: "Cough syrup",
              usage: '1 bottle:  10ml. 3X daily', index: 1
          ),
          drug(
              price: 'N3,250',
              name: "Paracetamol",
              usage: '1 pack:  3 pill(s) . 3X daily', index: 2
          ),
          drug(
              price: 'N1,500',
              name: "Cough syrup",
              usage: '1 bottle:  10ml. 3X daily', index: 3
          ),
          drug(
              price: 'N3,250',
              name: "Paracetamol",
              usage: '1 pack:  3 pill(s) . 3X daily', index: 4
          ),
          drug(
              price: 'N1,500',
              name: "Cough syrup",
              usage: '1 bottle:  10ml. 3X daily', index: 5
          ),
          SizedBox(height: 35,),

        ],
      ),
      ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => RenewOrderSummary()));
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
                'Continue',
                style: TextStyle(color: AppColors.gray[100], fontSize: getFontSize(18, context)),
              ),
            ),
          ),
    ]
    )
    )
    )
    );
  }

  drug({
    required String price,
    required String name,
    required int index,
    required String usage}) {
    return GestureDetector(
        child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: getFontSize(10, context)),
      child: Stack(children: [

        Container(
          padding: EdgeInsets.all(14),
          width: double.infinity,
          margin: EdgeInsets.only(bottom: getFontSize(10, context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.grey,
              width: getFontSize(0.7, context),
            ),
          ),
        child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(name, style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold),),
              Spacer(),
              Text(price, style: TextStyle(fontSize: getFontSize(16, context), color: AppColors.blue[700], fontWeight: FontWeight.bold))
            ],
          ),

          SizedBox(height: getFontSize(8, context),),
          Row(
            children: [
              Text(usage, style: TextStyle(color: Color(0xff666666))),
              Spacer(),
              Text("By: ",style: TextStyle(color: AppColors.blue[700], fontWeight: FontWeight.bold)),
              Text("Dr. Muiz Sanni", style: TextStyle(color: Color(0xff666666)))
            ],
          )

        ],
      ),
      ),
        Positioned(
          bottom: 0,
          right: 0,
          child:
          Container(
              width: getFontSize(22, context),
              height: getFontSize(22, context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelectedList[index] ? Colors.green : Color(0xffF2F2F2),
              ),
              child: isSelectedList[index] ? Icon(Icons.check, size: 14, color: isSelectedList[index] ? AppColors.gray[100] : Color(0xffC2C2C2)) : null
          ),
        ),
      ]
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
