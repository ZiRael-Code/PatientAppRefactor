import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(OrderDeatils());
}

class OrderDeatils extends StatefulWidget {
  OrderDeatils({super.key});
  @override
  _OrderDeatilsScreen createState() => _OrderDeatilsScreen();
}

class _OrderDeatilsScreen extends  State<OrderDeatils> {
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
                  'Order details',
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
        // Container(
        //   alignment: Alignment.center,
        //   width: MediaQuery.of(context).size.width * 0.78,
        //   child:
        // Align(child: Text("Your drugs are being processed by the pharmacy. When you’ve recieved them, click on the button below to start using them.", textAlign: TextAlign.center,
        // style: TextStyle(
        //   fontSize: getFontSize(14, context),
        // ),
        // ),
        // ),
        // ),
        // SizedBox(height: getFontSize(30, context),),
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
        SizedBox(height: getFontSize(30, context),),

        drug(
              name: "Cough syrup",
              usage: '1 bottle:  10ml. 3X daily',
            price: "N25,000"

          ),
          drug(
          name: "Paracetamol",
          usage: '1 pack:  3 pill(s) . 3X daily',
              price: "N25,000"

        ),
        drug(
          name: "Paracetamol",
          usage: '1 pack:  3 pill(s) . 3X daily',
              price: "N25,000"

        ),
        SizedBox(height: getFontSize(40, context)),
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
        Spacer(),
        ElevatedButton(
          onPressed: () {
            cancel_dialog();
          },
          style: ElevatedButton.styleFrom(
            // backgroundColor: Colors.blue,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
              side: BorderSide(color: Colors.red, width: getFontSize(1, context)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.red, fontSize: getFontSize(18, context)),
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
    required String name,
    required String usage,
    required String price,

  }) {
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
      child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontSize: getFontSize(16, context)),),
          SizedBox(height: getFontSize(8, context),),
          Text(usage, style: TextStyle(color: Color(0xff666666)))
        ],
      ),
    Text(price, style: TextStyle(fontSize: getFontSize(16, context), color: Colors.black, fontWeight: FontWeight.bold),)
    ],
      ),
    );
  }


  cancel_dialog(){
    showDialog(
        context: context,
        builder: (context)
    {
      return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
          width: getFontSize(201, context),
              child:
              Text(textAlign: TextAlign.center, 'Are you sure you want to cancel this order?', style: TextStyle(fontSize: getFontSize(16, context)),),
              ),
              SizedBox(height: getFontSize(20, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                      ),
                    ),
                  ),
                  SizedBox(width: getFontSize(10, context),),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                        side: BorderSide(color: Colors.blue, width: getFontSize(1, context)),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.blue, fontSize: getFontSize(18, context)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getFontSize(12, context)),
                ],
          )
      );
    }
    );
  }
}