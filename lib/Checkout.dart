import 'components/colors/colours.dart';
import '../Main/Dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceConnectedSuccess.dart';
import 'package:flutter_app/DeviceOrderPayment.dart';
import 'package:flutter_svg/svg.dart';

import 'SelectPickupLocation.dart';
import 'SelectYourLocation.dart';
import 'Main/Dashboard.dart';


class Checkout extends StatefulWidget {
  final dynamic nextScreen;
  final String? deliveryMethod;
  final Map<String, String>? address;
  Checkout({super.key, required this.nextScreen, this.deliveryMethod, this.address});
  @override
  _CheckoutScreen createState() => _CheckoutScreen();
}

class _CheckoutScreen extends  State<Checkout> {
  String? _selectedValue;
  String deliveryMethod = "";
  late Map<String, String> address = {};
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
                  'Checkout',
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
        Align(
          alignment: Alignment.centerLeft,
          child:
          Text('Summary', style: TextStyle(fontSize: getFontSize(16, context))),
        ),
        SizedBox(height: getFontSize(12, context),),
        info(type: 'Product amount', des: 'N3200'),
        SizedBox(height: getFontSize(8, context),),
        info(type: 'Delivery fee', des: 'N1000'),
        SizedBox(height: getFontSize(12, context),),
        SvgPicture.asset('assets/images/line.svg'),
        SizedBox(height: getFontSize(12, context),),
        Row(
          children: [
            Text('TOTAL', style: TextStyle(color: Color(0xff666666)),),
            Spacer(),
            Text('N4,2000', style: TextStyle(fontSize: getFontSize(16, context), color: AppColors.blue[700],fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: getFontSize(12, context),),
        SvgPicture.asset('assets/images/line.svg'),
        SizedBox(height: getFontSize(16, context),),

        deliverMethod(
            'Not set yet',
             'Delivery method',
             deliveryMethod
        ),

        deliverMethod(
             'Not set yet',
             'Address',
             address
        ),

        Spacer(),
        Visibility(
          visible: deliveryMethod.isNotEmpty && address.isNotEmpty,
          child:
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> widget.nextScreen));
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
        ),
        SizedBox(height: getFontSize(20, context),)
      ],
    ),
    ))));
  }
  info({
    required String type,
    required String des,
  }) {
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
  deliverMethod(  String text, String header, dynamic info){

    String result = "Not set yet";

    if (info != null) {
      if (info is String) {
        result = info.isNotEmpty ? info : "Not set yet.";
      } else() {
        if (!info.isEmpty) {
          result = "addressofmap[]";
        }else{
          result = "Not set yet.";
        }
      };
    } else {
      result = "Not set yet.";
    }

    return Column(children: [
     Align(
       alignment: Alignment.centerLeft,
       child:
      Text(header, style: TextStyle(fontSize: getFontSize(16, context))),
    ),
      SizedBox(height: getFontSize(20, context),),
      // SizedBox(height: getFontSize(30, context),),
      // Spacer(),
      DottedBorder(
        color:  Colors.grey.withOpacity(0.70),
        radius: Radius.circular(14),
        dashPattern: [8, 6],
        borderType: BorderType.RRect,
        strokeWidth: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          width: getFontSize(342, context),
          height: getFontSize(57, context),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.10)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(result, style: TextStyle(fontSize: getFontSize(14, context),
                  color: AppColors.gray[700].withOpacity(0.40)),),
              Spacer(),
              SizedBox(
                width: getFontSize(79, context),
                child:   ElevatedButton(
                  onPressed: () {
                    if (!(info is String)){
                      showHowToConnectPopup(context);
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: getFontSize(5, context), right: getFontSize(5, context)),
                    backgroundColor: AppColors.blue[700],
                    textStyle: TextStyle(color: AppColors.gray[100]),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Text(
                      'Set Now',
                      style: TextStyle(color: AppColors.gray[100], fontSize: getFontSize(12, context)),
                  ),
                ),
              )
            ],
          ),


        ),
      ),
      // Spacer(),
      SizedBox(height: getFontSize(20, context),),
    ]
    );
  }

  void showHowToConnectPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.gray[100],
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: howToConnectPopup(),
        );
      },
    );
  }

  Widget howToConnectPopup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Select deliver method',
          style: TextStyle(color: AppColors.gray[700], fontSize: getFontSize(18, context)),
        ),
        SizedBox(height: getFontSize(25, context)),
        ElevatedButton(
          onPressed: () {
            // TODO the popup nd select location no dey so redo it
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SelectYourLocation(nextScreen: widget.nextScreen,)));
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
              'Select delivery location',
              style: TextStyle(color: AppColors.gray[100], fontSize: getFontSize(18, context)),
            ),
          ),
        ),
        SizedBox(height: getFontSize(15, context),),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Selectpickuplocation(nextScreen: widget.nextScreen,)));
          },
          style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              side: BorderSide(width: getFontSize(1, context), color: AppColors.blue[700]),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              textStyle: TextStyle(color: AppColors.blue[700])
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Select pickup location',
              style: TextStyle(color: AppColors.blue[700], fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    );
  }


}