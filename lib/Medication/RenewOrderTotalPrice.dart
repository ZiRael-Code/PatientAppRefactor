import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/BuyDrugCheckout.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(RenewOrderTotalPrice());
}

class RenewOrderTotalPrice extends StatefulWidget {
  RenewOrderTotalPrice({super.key});
  @override
  _RenewOrderCheckoutScreen createState() => _RenewOrderCheckoutScreen();
}

class _RenewOrderCheckoutScreen extends  State<RenewOrderTotalPrice> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
          child:
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

        SizedBox(height: getFontSize(25, context)),
        GestureDetector(
          child: 
        Container(
          height: getFontSize(50, context),
          width: MediaQuery.of(context).size.width * 0.40,
          padding: EdgeInsets.only(left: getFontSize(12, context), right: getFontSize(12, context)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xffE2EDFF),
            ),
            child: GestureDetector(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('See details', style: TextStyle(color: Colors.blue),),
                SizedBox(width: getFontSize(10, context),),
                Icon(Icons.keyboard_arrow_down, color: Colors.blue,),
              ],
          ),
              onTap: (){
                prescription_information_bottom_sheet();
              },
          )
        ),
        ),
        ),
        SizedBox(height: getFontSize(20, context),),
        
        Row(
          children: [
            Text('No. of medications:', style: TextStyle(color: Color(0xff666666))),
            Spacer(),
            Text('3 drugs'),
          ],
        ),
        SizedBox(height: getFontSize(20, context),),
        Row(
          children: [
            Text('price', style: TextStyle(color: Color(0xff666666))),
            Spacer(),
            Text('N5,350.00', style: TextStyle(color: Colors.blue),
            )],
        ),
        SizedBox(height: getFontSize(20, context),),
        Row(
          children: [
            Text('TOTAL', style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Text('3 drugs', style: TextStyle(fontSize: getFontSize(16, context),color: Colors.blue),
            )],
        ),

        
        
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Checkout()));
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
              'Proceed to checkout',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    ),
    )));
    
  }

  prescription_information_bottom_sheet(){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Prescription information', style: TextStyle(fontSize: getFontSize(20, context), fontWeight: FontWeight.bold),)
              ,SizedBox(height: getFontSize(25, context),),
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
              SizedBox(height: getFontSize(25, context),),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                      side: BorderSide(width: getFontSize(1, context), color: Colors.blue)
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.blue, fontSize: getFontSize(18, context)),
                  ),
                ),
              ),
            ],
          )
        );
      },
    );
  }
  drug({
    required String name,
    required String price,
    required String qty,
  }){
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: getFontSize(10, context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey,
          width: getFontSize(1.0, context),
        ),
      ),
      child:
        Row(
          children: [
            Column(children: [
              Text(name),
              SizedBox(height: getFontSize(10, context)),
              Text(qty,style: TextStyle(color:  Color(0xff666666)))
              ,SizedBox(height: getFontSize(15, context)),
            ],),
            Spacer(),
            Text(price, style: TextStyle(color: Colors.blue, fontSize: getFontSize(16, context)),),
          ],
        ),

    );
  }
}