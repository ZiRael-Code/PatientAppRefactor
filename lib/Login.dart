import 'components/api/requests.dart';
import 'components/colors/colours.dart';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/api_call.dart';
import 'package:flutter_app/component/input_field.dart';

import '../Main/Dashboard.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainManvigator.dart';
import 'Main/Dashboard.dart';
import 'Signup.dart';
import 'component/blue_background_button.dart';



class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: LoginState(),
    );
  }
}


class LoginState extends StatefulWidget {
  @override
  _LoginStateState createState() => _LoginStateState();
}

class _LoginStateState extends State<LoginState> {
  bool _obscurePassword = true;
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  Dio _dio = Dio();
  bool isLoading = false;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _handleGoogleLogin() {

    print("Google icon clicked");
  }

  _handleLogin() async {
    if(passwordController.text.isEmpty && emailController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });
    String emailTrim = emailController.text.trim();
    String passwordTrim = passwordController.text.trim();

    Map<String, dynamic> params =  {
      "email" : emailTrim,
      "password" : passwordTrim,
  };

      ApiServices apiServices = ApiServices();
      dynamic response = await apiServices.login(params);

      if (response is Response) {
        Map<String, dynamic> user = response.data["user"][0] as Map<String, dynamic>;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login successful"))
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? userStr = prefs.getString('user');
        if (userStr == null) {
          user['loginStatus'] = true;
            String userJson = jsonEncode(user);
          await prefs.setString('user', userJson);
        }else {
          Map<String, dynamic> user = jsonDecode(userStr);
          user['loginStatus'] = true;
          String userJson = jsonEncode(user);
          await prefs.setString('user', userJson);
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> MainNavigator(index: 0)));

        setState(() {
          isLoading = false;
        });
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response["rtn"]))
        );
        print("error==-$response");
        setState(() {
          isLoading = false;
        });
      }
  }

  void _handleFacebookLogin() {

    print("Facebook icon clicked");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: getFontSize(50.0, context)),
            child: SvgPicture.asset(
              'assets/images/illustration.svg',

              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: getFontSize(20.0, context)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: getFontSize(32, context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: getFontSize(20.0, context)),
          InputField(
            labelText: 'Email',
            fontSize: getFontSize(16, context),
            hintText: 'sanni12@gmail.com',
            controller: emailController,
          ),

          SizedBox(height: getFontSize(20.0, context)),
          InputField(
            labelText: 'Password',
            fontSize: getFontSize(16, context),
            hintText: 'password',
            controller: passwordController,
          ),
          SizedBox(height: getFontSize(10.0, context)),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {

              },
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  color: AppColors.blue[700],
                ),
              ),
            ),
          ),
           SizedBox(height: getFontSize(20.0, context)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: isLoading
                  ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: AppColors.gray[100],
                  strokeWidth: 2,
                ),
              )
                  : AutoSizeText(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gray[100],
                ),
                maxLines: 1,
              ),
            ),
          ),

           SizedBox(height: getFontSize(20.0, context)),
          Text(
            'Or login with',
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
            onDoubleTap: _handleFacebookLogin,
              child: SvgPicture.asset(
                "./assets/images/facebook.svg",
                // onPressed: () {
                //   // Handle Facebook login
                // },
              ),
    ),
               SizedBox(width: getFontSize(20.0, context)),
              GestureDetector(
                onDoubleTap: _handleFacebookLogin,
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
                'Don\'t have an account yet?',
                style: TextStyle(
                  fontSize: getFontSize(16, context),
                  color: AppColors.gray[700],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                child:  Text(
                  'Register now',
                  style: TextStyle(
                    fontSize: getFontSize(16, context),
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue[700],
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