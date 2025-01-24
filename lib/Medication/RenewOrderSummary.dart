import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Medication/RenewOrderTotalPrice.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(RenewOrderSummary());
}

class RenewOrderSummary extends StatefulWidget {
  RenewOrderSummary({super.key});
  @override
  _RenewOrderSummaryScreen createState() => _RenewOrderSummaryScreen();
}

class _RenewOrderSummaryScreen extends  State<RenewOrderSummary> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  'Renew order',
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

SizedBox(height: getFontSize(30, context),),
        info(
            type: 'Name',
            des: '12/06/2022-Prescription'
        ),
        info(
            type: 'Prescribed by:',
            des: 'Dr. Muiz Sanni'
        ),
        info(
            type: 'Date',
            des: '12/06/2022-Prescription'
        ),
          SizedBox(height: getFontSize(35, context),),
          drug(
            price: 'N650',
              name: "Ibuprofen",
              usage: '1 pack: 1 pill(s). 2x daily'
          ),
          drug(
            price: 'N1,500',
              name: "Cough syrup",
              usage: '1 bottle:  10ml. 3X daily'
          ),
          drug(
              price: 'N3,250',
          name: "Paracetamol",
          usage: '1 pack:  3 pill(s) . 3X daily'
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RenewOrderTotalPrice()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),

      ],
    ),
    )));
  }
  info({
    required String type,
    required String des}) {
    return Column(
        children: [
          Row(
            children: [
              Text(type, style: TextStyle(fontSize: getFontSize(14, context), color: Color(0xff666666))),
              Spacer(),
              Text(des, style: TextStyle(fontSize: getFontSize(16, context))),
            ],
          ),
          SizedBox(height: getFontSize(12, context)),
        ]
    );
  }
  drug({
    required String price,
    required String name,
    required String usage}) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(name, style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold),),
             Spacer(),
              Text(price, style: TextStyle(fontSize: getFontSize(16, context), color: Colors.blue, fontWeight: FontWeight.bold))
            ],
          ),
          
          SizedBox(height: getFontSize(8, context),),
          Text(usage, style: TextStyle(color: Color(0xff666666)))
        ],
      ),
    );
  }

  prescription_information_bottom_sheet(){
    return Column(
      children: [
        Container(
          width: getFontSize(197, context),
          child: Text('Have you gotten these drugs yet?', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: getFontSize(15, context),),
        Container(
        width: getFontSize(197, context),
        child: Text('Once you click the ‘start using drugs’ button, a counter starts counting the number of drugs you’ve used. Click yes if you’ve gotten them.')
        ),
        SizedBox(height: getFontSize(15, context),),
        Row(
          children: [

          ],
        )
    ],
    );
  }
}