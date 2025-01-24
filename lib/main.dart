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
// this is israel on main.dart

class main_app extends StatelessWidget {
  main_app({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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

        String logged = userStr;
        print("___+_+_+ is the status ${logged}");
        if (logged.contains("true")) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
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