import 'package:flutter_app/MainManvigator.dart';

import 'components/colors/colours.dart';
import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainScreen.dart';
import 'OnBoarding/SlideScreen1.dart';
import 'main.dart';

void main() {
  runApp(main_app());
}

class main_app extends StatelessWidget {
  main_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Patient App',
      home: Loader(),
    );
  }
}

class Loader extends StatefulWidget {
  Loader({super.key});

  @override
  State<Loader> createState() => LoaderState();
}

class LoaderState extends State<Loader> {
  @override
  void initState() {
    super.initState();
    // Adding a delay of 2 seconds
  //   Future.delayed(Duration(milliseconds: 2000), () {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) =>  SlideScreen1()),
  //     );
  //   });
    _checkLoginStatus();
  }
  Future<void> _checkLoginStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userStr = prefs.getString('user');

      if (userStr != null) {

        Map<String, dynamic> user = jsonDecode(userStr);

        if (user["loginStatus"]) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainNavigator(index: 0)));
            // MaterialPageRoute(builder: (context) => Login()));
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        }
      }else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SlideScreen1()),
        );
      }
    } catch (e) {
      print('Error checking login status: $e');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SlideScreen1()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}