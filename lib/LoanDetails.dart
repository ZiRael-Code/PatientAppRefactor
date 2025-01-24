import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/RequestNewDeviceLoan.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';


class LoanDetails extends StatefulWidget {
  LoanDetails({super.key});

  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  bool _isSwitched = false;
  bool _isCheck = false;

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
      SizedBox(height: getFontSize(50, context),),
      Text("Loan details", style: TextStyle(fontSize: getFontSize(36, context), fontWeight: FontWeight.bold),),
      SizedBox(height: getFontSize(10, context),),
      Container(
          width: getFontSize(256, context),
          child:
          Text(style: TextStyle(fontSize: getFontSize(14, context))
              ,textAlign: TextAlign.center,"You can easily apply for a short loan if you currently don’t have enough money to buy a device.")
      ),
      SizedBox(height: getFontSize(25, context),),
      inputField(label: "Payback date",
          hint: "3 month "),
      Row(
        children: [
          Text("Set a custom date", style: TextStyle(fontSize: getFontSize(16, context), color: Colors.black45),),
          Spacer(),
          Switch(
            activeColor: Colors.blue,
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
          )
        ],
      ),
      Spacer(),
      Row(
        children: [
          GestureDetector(
            child:
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isCheck ?  Colors.blue : Colors.grey.withOpacity(0.40),
            ),
            child: Icon(Icons.check, color: Colors.white,)
          ),
            onTap: (){
              setState(() {
                _isCheck =!_isCheck;
              });
            },
          ),
          SizedBox(width: getFontSize(7, context),),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            child: Text(maxLines: 2,"By clicking on the checkbox, you are agreeing to our loan terms and conditions."
          )
          )
          ],
      ),
      SizedBox(height: getFontSize(20, context),),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => RequestNewDeviceLoan()));
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

    ]
    )
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
        Text(label, style:  TextStyle(fontSize: getFontSize(16, context)),),
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