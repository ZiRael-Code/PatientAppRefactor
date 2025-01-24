import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';


void main(){
  runApp(FingerprintAdded());
}

class FingerprintAdded extends StatefulWidget{
  FingerprintAddedState createState() => FingerprintAddedState();
}

class FingerprintAddedState extends State<FingerprintAdded>{
  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       body: Padding(
           padding: EdgeInsets.only(top: getFontSize(80, context), bottom: getFontSize(40, context), left: getFontSize(20, context), right: getFontSize(20, context)),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Align(
            alignment: Alignment.topCenter,
             child: SvgPicture.asset('assets/images/slider2.svg'),
           ),
           SizedBox(height: getFontSize(20, context),),
         Container(
           width: getFontSize(156, context),
           child:  Text(textAlign: TextAlign.center, 'Fingerprint successfully added!', style: TextStyle(fontSize: getFontSize(28, context), fontWeight: FontWeight.bold),),
         ),
           Spacer(),
            SvgPicture.asset('assets/images/fingerprint.svg'),
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
                 'Continue',
                 style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
               ),
             ),
           ),

         ],
       ),
       ),
     ),
   );
  }

  input_field({
    required String label,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: getFontSize(20, context)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(
                fontSize: getFontSize(16, context),
              ),
            ),
          ),
          SizedBox(height: getFontSize(8.0, context)),
          TextField(
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: '*********',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
          )
        ],
      ),
    );
  }
}