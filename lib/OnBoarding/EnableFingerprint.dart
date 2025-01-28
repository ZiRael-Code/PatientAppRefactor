import 'package:dio/dio.dart';
import 'package:flutter_app/SetupComplete.dart';

import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/OnBoarding/SetNewPin.dart';
import 'package:flutter_svg/svg.dart';

class EnableFingerprint extends StatefulWidget{
  final Map<String, dynamic> user;
  EnableFingerprint({super.key, required this.user});
  EnableFingerprintState createState() => EnableFingerprintState();
}

class EnableFingerprintState extends State<EnableFingerprint>{
  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
  bool showButton = false;
  @override
  void initState() {
    // TODO: implement initState
      Future.delayed(Duration(milliseconds: 2000), () {
        setState(() {
          showButton = true;
        });
      });

    super.initState();
  }
  bool isLoading = false;
  Dio _dio = Dio();

  void handleSignUp() async {
    try {
      Response response = await _dio.post(
        "http://myaccount.myvitalz.org/api/signup-patient",
        queryParameters : widget.user,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      if (response.data["rtn"].toString().isEmpty && response.data["reg"] == "1") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("signup success")),
        );
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SetupComplete()));

      }else{
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data["rtn"])),
        );
        print("error==-$response");
      }
    } catch (e) {
      setState(() {
      isLoading = false;
    });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Connection failed, please check your connection and try again")),
      );
      print('Error occurred: $e');
    }

  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Padding(
           padding: EdgeInsets.only(top: getFontSize(80, context), bottom: getFontSize(40, context), left: getFontSize(20, context), right: getFontSize(20, context)),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Align(
            alignment: Alignment.topCenter,
             child: SvgPicture.asset('assets/images/slide.svg'),
           ),
           SizedBox(height: getFontSize(20, context),),
           Text('Enable fingerprint', style: TextStyle(fontSize: getFontSize(28, context), fontWeight: FontWeight.bold),),
           SizedBox(height: getFontSize(15, context),),
          Container(
            width: getFontSize(176, context),
            child: Text(textAlign: TextAlign.center,'Tap on the icon to enable your fingerprint.'),

          ),

           Spacer(),

            showButton ? SvgPicture.asset('assets/images/markedfingerprint.svg')
                       : SvgPicture.asset('assets/images/fingerprint.svg'),
           Spacer(),
           showButton ? ElevatedButton(
             onPressed: () {
               setState(() {
                 isLoading = true;
               });
               handleSignUp();
             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
               fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(9),
               ),
             ),
             child:isLoading
                 ? SizedBox(
               width: 20,
               height: 20,
               child: CircularProgressIndicator(
                 color: Colors.white,
                 strokeWidth: 2,
               ),
             )
                 :
             Padding(
               padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
               child: Text(
                 'Continue',
                 style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
               ),
             ),
           ): SizedBox()
         ],
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