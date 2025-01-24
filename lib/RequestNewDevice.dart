import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ApplyForLoan.dart';
import 'package:flutter_app/Checkout.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(RequestNewDevice());
}

class RequestNewDevice extends StatefulWidget {
  RequestNewDevice({super.key});
  @override
  _RequestNewDeviceScreen createState() => _RequestNewDeviceScreen();
}

class _RequestNewDeviceScreen extends  State<RequestNewDevice> {
  String? _selectedValue;
  List<int> _cartIncrease = [];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
   _cartIncrease = List.generate(100, (index) => 0);
  }
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

            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child:
        Container(
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
        Align(
          child:
      Column(
      children: [
        Container(
          width: getFontSize(180, context),
          child: Text(textAlign: TextAlign.center,'Request for a new device',style: TextStyle(fontSize: getFontSize(28, context), fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: getFontSize(25, context),),
        Container(
          width: getFontSize(284, context),
          child: Text(textAlign: TextAlign.center,'Select which device(s) you want to order',style: TextStyle(fontSize: getFontSize(14, context),),),
        ),

        SizedBox(height: getFontSize(45, context),),

        device(
          name: "Wellue BP2 connect device ",
          price: "N25,000",
          message: "Blood pressure, heart rate, body temperature, oxygen saturation, blood glucose, lipids "
          ,index: 0
        ),
        device(
          name: "Wellue BP2 connect device ",
          price: "N25,000",
          message: "Blood pressure, heart rate, body temperature, oxygen saturation, blood glucose, lipids "
          ,index: 1
        ),

        SizedBox(height: getFontSize(25, context),),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Checkout()));
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
        SizedBox(height: getFontSize(10, context),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Need a Loan to Buy Device?'),
            GestureDetector(
              child:
            Text(' Apply Here', style: TextStyle(color: Colors.blue),),
              onTap: () {
                // TODO: implement apply loan here
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Applyforloan()));
              },

        )
              ],
        )
      ],
    ),
    ))));
  }

  device({
    required String name,
    required String price,
    required String message,
    required int index
  }) {
    return
      Container(
      margin: EdgeInsets.only(bottom: getFontSize(15, context)),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: getFontSize(0.5, context), color: Colors.black54),
      ),
      child:Stack(
        children: [
          _cartIncrease[index] > 0 ?
          Positioned(
            top: getFontSize(0, context),
            right: getFontSize(0, context),
            child:
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue,
              ),
              child: Icon(Icons.check, color: Colors.white,),
            ),
          )
              :
          Container(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: getFontSize(16, context), ),),
              SizedBox(height: getFontSize(10, context),),
              Text(price, style: TextStyle(fontSize: getFontSize(16, context), color: Colors.blue),),
              SizedBox(height: getFontSize(10, context),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getFontSize(183, context),
                    child:
                  Text(message, style: TextStyle(fontSize: getFontSize(12, context), color: Colors.black54),)
    )
                ],
              ),
                  SizedBox(height: getFontSize(14, context),),
                  Container(
                    width: getFontSize(102, context),
                    padding: EdgeInsets.only(left: getFontSize(14, context), right: getFontSize(14, context), top: getFontSize(8, context), bottom: getFontSize(8, context)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: getFontSize(0.5, context), color: Colors.black54),
                    ),
                    child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              // padding: EdgeInsets.all(4),
                              width: getFontSize(15, context),
                              height: getFontSize(15, context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xffE2EDFF)
                              ),
                              child: Icon(Icons.minimize,size: getFontSize(11, context) ,color: Colors.blue),
                            ),
                            onTap: () {
                              setState(() {
                                _cartIncrease[index] = _cartIncrease[index]-1;
                              });
                            },
                          ),

                   Spacer(),
                   Text(_cartIncrease[index].toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                   Spacer(),
                          GestureDetector(
                            child:
                          Container(
                            width: getFontSize(15, context),
                            height: getFontSize(15, context),
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                                color: Color(0xffE2EDFF)
                            ),
                            child: Icon(Icons.add, size: getFontSize(11, context), color: Colors.blue,),
                          ),
                            onTap: () {
                              setState(() {
                                _cartIncrease[index] = _cartIncrease[index]+1;
                              });
                            },
                          )

                        ],
                    )


                  )


            ],
          ),
          SizedBox(width: getFontSize(15, context),),

                               Container(
                    padding: EdgeInsets.all(12),
                    width: getFontSize(100, context),
                    height: getFontSize(100, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffD9D9D9),
                    ),
                    child:  SvgPicture.asset('assets/images/dev.svg'),
                  )


        ],
      ),
      ]
    )
    );
  }

}