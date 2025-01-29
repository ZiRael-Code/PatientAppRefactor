import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';
import 'components/colors/colours.dart';
import '../Main/Dashboard.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Account/AccountProfile.dart';
import 'package:flutter_app/Appointments.dart';
import 'package:flutter_app/Appointments/MainAppointment.dart';
import 'package:flutter_app/Notifications.dart';
import 'package:flutter_app/Capture/VitalsReading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/Medication/Medication.dart';

import 'Main/Dashboard.dart';
class MainNavigator extends StatefulWidget {
  final int index;
  MainNavigator({required this.index});
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {

  bool isFetchingUser = true;
  late int _selectedIndex = widget.index;


  void _onItemTapped(int index ) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VitalsReading()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  late Map<String, dynamic> user;

  Future<void> _getUserInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userStr = prefs.getString('user');

      if (userStr != null) {
        user = jsonDecode(userStr);
        setState(() {
          isFetchingUser = false;
        });
      }else{
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Login()),
              (Route<dynamic> route) => false,
        );

      }
    }catch(e){
      print(e);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false,
      );
    }
  }
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }
  late final List<Widget> _screens = [
    Dashboard(onItemTapped: _onItemTapped,user:  user),
    NoMedication(),
    Container(), //
    MainAppointment(),
    AccountProfile(user: user,),
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:isFetchingUser ? Scaffold(
        body: Center(
      child: Stack(
      alignment: Alignment.center,
        children: [
          // Background Circle
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
          ),
          // Circular Progress Indicator
          SizedBox(
            width: 120,
            height: 120,
            child: CircularProgressIndicator(
              strokeWidth: 10,
              value: 0.75, // Adjust the value to show progress (0.0 to 1.0)
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xff3C8AFF)), // Custom blue color
            ),
          ),
          // Progress Percentage Text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "75%",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3C8AFF),
                ),
              ),
              Text(
                "Loading...",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    ),)

          : Builder(
        builder: (context) =>
            Scaffold(
              body: _screens[_selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: (index) => _onItemTapped(index ),
                selectedItemColor: Color(0xff9260F4),
                unselectedItemColor: Colors.grey,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 0
                          ? 'assets/images/s_home.svg'
                          : 'assets/images/un_home.svg',
                      width: getFontSize(24, context),
                      height: getFontSize(24, context),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 1
                          ? 'assets/images/s_medication.svg'
                          : 'assets/images/un_medication.svg',
                      width: getFontSize(24, context),
                      height: getFontSize(24, context),
                    ),
                    label: 'Medication',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/main.svg',
                      width: getFontSize(52, context),
                      height: getFontSize(52, context),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 3
                          ? 'assets/images/s_appointment.svg'
                          : 'assets/images/un_appointment.svg',
                      width: getFontSize(24, context),
                      height: getFontSize(24, context),
                    ),
                    label: 'Appointment',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 4
                          ? 'assets/images/s_account.svg'
                          : 'assets/images/un_account.svg',
                      width: getFontSize(24, context),
                      height: getFontSize(24, context),
                    ),
                    label: 'Account',
                  ),
                ],
              ),
            ),
      ),
    );
  }
}