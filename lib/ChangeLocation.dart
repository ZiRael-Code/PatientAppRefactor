import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Checkout.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';
import 'Main/Dashboard.dart';


class ChangeLocation extends StatefulWidget {
  ChangeLocation({super.key});

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
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
                  'Select pickup location',
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
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      inputField(label: "State",
          hint: "e.g lagos"),
      inputField(label: "Region",
          hint: "e.g surulere"),
      ElevatedButton(
        onPressed: () {
          // TODO the popup nd select location no dey so redo it
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
            'Confirm new location',
            style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
          ),
        ),
      ),
      ]
    )
    )
    );
  }
  inputField({
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: getFontSize(16, context)),),
         SizedBox(height: getFontSize(10, context),),

        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black26),
            filled: true,
            fillColor: Colors.grey[200], // Light gray background
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Circular border radius
              borderSide: BorderSide(
                color: Colors.grey.shade300, // Light gray border
                width: getFontSize(1, context), // Border thickness
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: getFontSize(1, context),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: getFontSize(1.5, context),
              ),
            ),
            suffixIcon:  Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.black45,
            ),// Optional suffix icon
            constraints: BoxConstraints(
              maxWidth: 331, // Set the fixed width for the TextField
            ),
          ),
        ),

         SizedBox(height: getFontSize(15, context),), // Additional vertical space between fields
      ],
    );
  }
}