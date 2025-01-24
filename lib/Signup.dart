import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/OnBoarding/SetNewPassword.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

Future<void> _handleRegister(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userStr = "false";
  await prefs.setString("user", userStr);
  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SetNewPassword()));
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
  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
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
          Align(
            alignment: Alignment.topLeft,
          child: Text(
            'First Name',
            style: TextStyle(fontSize: getFontSize(16, context)),
          ),
          ),
          SizedBox(height: getFontSize(8.0, context)),
          TextField(
            decoration: InputDecoration(
              hintText: 'First Name',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: getFontSize(20.0, context)),
          Align(
            alignment: Alignment.topLeft,
          child: Text(
            'Last Name',
            style: TextStyle(fontSize: getFontSize(16, context)),
          ),
          ),
          SizedBox(height: getFontSize(8.0, context)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Last Name',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: getFontSize(20.0, context)),
          Align(
            alignment: Alignment.topLeft,
          child: Text(
            'Phone Number',
            style: TextStyle(fontSize: getFontSize(16, context)),
          ),
          ),
          SizedBox(height: getFontSize(8.0, context)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Phone Number',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: getFontSize(20.0, context)),
          Align(
            alignment: Alignment.topLeft,
          child: Text(
            'Email Address',
            style: TextStyle(fontSize: getFontSize(16, context)),
          ),
          ),
          SizedBox(height: getFontSize(8.0, context)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email Address',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: getFontSize(20.0, context)),
          Align(
            alignment: Alignment.topLeft,
          child: Text(
            'Referral Code',
            style: TextStyle(fontSize: getFontSize(16, context)),
          ),
          ),
          SizedBox(height: getFontSize(8.0, context)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Referral Code',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
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
                  color: Colors.white,
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
          color: Colors.black,
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
              color: Colors.black,
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