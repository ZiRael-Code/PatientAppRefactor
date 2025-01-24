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
import 'package:flutter_app/Medication/NoMedication.dart';

import 'Main/Dashboard.dart';
class MainNavigator extends StatefulWidget {
  final int index;
  MainNavigator({required this.index});
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  void initState() {
    super.initState();
  }


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

  late final List<Widget> _screens = [
    Dashboard(onItemTapped: _onItemTapped),
    NoMedication(),
    Container(), //
    MainAppointment(),
    AccountProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
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
                      width: getFontSize(32, context),
                      height: getFontSize(32, context),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 1
                          ? 'assets/images/s_medication.svg'
                          : 'assets/images/un_medication.svg',
                      width: getFontSize(32, context),
                      height: getFontSize(32, context),
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
                      width: getFontSize(32, context),
                      height: getFontSize(32, context),
                    ),
                    label: 'Appointment',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 4
                          ? 'assets/images/s_account.svg'
                          : 'assets/images/un_account.svg',
                      width: getFontSize(39, context),
                      height: getFontSize(39, context),
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