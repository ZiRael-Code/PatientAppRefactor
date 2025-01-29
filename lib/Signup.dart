import 'components/colors/colours.dart';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/OnBoarding/SetNewPassword.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainManvigator.dart';
import 'component/input_field.dart';

void main(){
  runApp(Signup());
}

class Signup extends StatelessWidget{
  Signup({super.key});

  Widget build (BuildContext context) {
    return  Scaffold(
        body: SignupState(),
    );
  }
}
void _handleGoogleLogin() {

  print("Google icon clicked");
}

void handleFacebook(){
  print("hello clicker");
}

class SignupState extends StatefulWidget {
  @override
  _SignupStateState createState() => _SignupStateState();
}

class _SignupStateState extends State<SignupState> {
  Dio _dio = Dio();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  bool isLoading = false;
  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _handleRegister(BuildContext context) async {
    if(fNameController.text.isEmpty && lNameController.text.isEmpty && phoneNoController.text.isEmpty && emailController.text.isEmpty ){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }
    String fName = fNameController.text.trim();
    String lName = lNameController.text.trim();
    String phoneNo = phoneNoController.text.trim();
    String emailTrim = emailController.text.trim();

    Map<String, dynamic> params =  {
      "email" : emailTrim,
      "first_name" : fName,
      "last_name" : lName,
      "phone" : phoneNo,
      "referral" : referralCodeController.text.isEmpty ? null : referralCodeController.text.trim()
    };

        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SetNewPassword(user: params)));


    // try {
    //   Response response = await _dio.post(
    //     "http://myaccount.myvitalz.org/api/signup-patient",
    //     queryParameters : params,
    //     options: Options(
    //       contentType: Headers.jsonContentType,
    //     ),
    //   );
    //
    //   if (response.statusCode == 200 && response.data["status"] != null) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("success")),
    //     );
    //     Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> MainNavigator(index: 0)));
    //
    //
    //   }else{
    //     print("error==-$response");
    //   }
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("Login failed")),
    //   );
    //   print('Error occurred: $e');
    // }

  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: getFontSize(50.0, context)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: getFontSize(32, context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: getFontSize(30.0, context)),
          InputField(
            labelText: 'First Name',
            fontSize: getFontSize(16, context),
            hintText: 'First Name',
            controller: fNameController,
          ),
          SizedBox(height: getFontSize(20.0, context)),

          InputField(
            labelText: 'Last Name',
            fontSize: getFontSize(16, context),
            hintText: 'Last Name',
            controller: lNameController,
          ),
          SizedBox(height: getFontSize(20.0, context)),

          InputField(
            labelText: 'Phone Number',
            fontSize: getFontSize(16, context),
            hintText: 'Phone Number',
            controller: phoneNoController,
          ),
          SizedBox(height: getFontSize(20.0, context)),

          InputField(
            labelText: 'Email Address',
            fontSize: getFontSize(16, context),
            hintText: 'Email Address',
            controller: emailController,
          ),
          SizedBox(height: getFontSize(20.0, context)),

          InputField(
            labelText: 'Referral Code',
            fontSize: getFontSize(16, context),
            hintText: 'Referral Code',
            controller: referralCodeController,
          ),

          SizedBox(height: getFontSize(20.0, context)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _handleRegister(context);
                // Handle login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C8AFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  color: AppColors.gray[100],
                  fontSize: getFontSize(16, context),
                ),
              ),
            ),
          ),
      SizedBox(height: getFontSize(20.0, context)),
      Text(
        'Or signup with',
        style: TextStyle(
          fontSize: getFontSize(16, context),
          color: AppColors.gray[700],
        ),
      ),
      SizedBox(height: getFontSize(10.0, context)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onDoubleTap:_handleGoogleLogin,
            child: SvgPicture.asset(
              "./assets/images/facebook.svg",
              // onPressed: () {
              //   // Handle Facebook login
              // },
            ),
            ),

      //     ),
          SizedBox(width: getFontSize(20.0, context)),
          GestureDetector(
            onDoubleTap: _handleGoogleLogin,
            child: SvgPicture.asset(
                "./assets/images/goggle.svg"
            ),
          ),
        ],
      ),
      SizedBox(height: getFontSize(20.0, context)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: getFontSize(16, context),
              color: AppColors.gray[700],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text(
              'Login Here',
              style: TextStyle(
                fontSize: getFontSize(16, context),
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C8AFF),
              ),
            ),
          ),
        ],
      ),
    ],
    ),
    );
  }
}