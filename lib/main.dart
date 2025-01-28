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
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.grey[800]),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey[700]),
          bodySmall: TextStyle(fontSize: 11, color: Colors.grey[700]),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),

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