import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'LoanCheckout.dart';
import 'Main/Dashboard.dart';
import 'Main/Dashboard.dart';


class ConfirmLocation extends StatefulWidget {
  ConfirmLocation({super.key});

  @override
  State<ConfirmLocation> createState() => _ConfirmLocationState();
}

class _ConfirmLocationState extends State<ConfirmLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset(
                  'assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),
                ),
              ),
              Spacer(),
              Text(
                'Confirm your location',
                style: TextStyle(fontSize: getFontSize(20, context), fontStyle: FontStyle.normal),
              ),
              Spacer(),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
        padding: EdgeInsets.all(12),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(0.10)
          ),
          child: ListTile(
            title: Text("Green Street, 13"),
            subtitle: Text(
              "Lagos, Nigeria",
              style: TextStyle(fontSize: getFontSize(14, context)),
            ),
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder:
                (builder) => LoanCheckout()));
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
    )
    )
    );
  }
}