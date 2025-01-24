import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(NewPrescription());
}

class NewPrescription extends StatefulWidget {
  NewPrescription({super.key});
  @override
  _NewPrescriptionScreen createState() => _NewPrescriptionScreen();
}

class _NewPrescriptionScreen extends  State<NewPrescription> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  'New prescription',
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
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(20, context), right: getFontSize(20, context)),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: getFontSize(30, context)),
        info(
          type: 'Name',
          des: '12/06/2022-Prescription'
        ),
        SizedBox(height: getFontSize(14, context),),
        info(
          type: 'Prescribed by:',
          des: 'Dr. Muiz Sanni'
        ),
        SizedBox(height: getFontSize(14, context),),
        info(
          type: 'Date',
          des: '12/06/2022-Prescription'
        ),
        SizedBox(height: getFontSize(14, context),),
        SizedBox(height: getFontSize(25, context),),
        drug(
          name: 'Ibuprofen',
          price: 'N700',
          qty: '1 pack'
        ),
        drug(
          name: 'Cough syrup',
          price: 'N700',
          qty: '1 bottle'
        ),
        drug(
          name: 'Paracetamol',
          price: 'N700',
          qty: '1 pack'
        ),
        SizedBox(height: getFontSize(20, context)),
        Row(
          children: [
            Text('TOTAL:'),
            Spacer(),
            Text('N3,200', style: TextStyle(fontSize: getFontSize(20, context), color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        Spacer(),
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
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Buy drugs',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
        SizedBox(height: getFontSize(20, context),)

      ],
    ),
    ))));
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
        Text(des, style: TextStyle(fontSize: getFontSize(16, context), color: Colors.black)),
      ],
    ),
        SizedBox(height: getFontSize(12, context)),
        ]
    );
  }

  drug({
    required String name,
    required String price,
    required String qty,
}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(name, style: TextStyle(fontSize: getFontSize(16, context))),
            Spacer(),
            Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: getFontSize(16, context))),
          ],
        ),
        SizedBox(height: getFontSize(10, context)),
        Text(qty,style: TextStyle(color:  Color(0xff666666)))
      ,SizedBox(height: getFontSize(15, context)),
      SvgPicture.asset('assets/images/line.svg', fit: BoxFit.fitWidth,)
        ,SizedBox(height: getFontSize(10, context)),
      ],
    );
  }
}