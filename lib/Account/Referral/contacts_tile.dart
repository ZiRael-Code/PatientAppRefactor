

import 'package:flutter/material.dart';

import '../../Main/Dashboard.dart';

class ContactsTile extends StatelessWidget {
  final String name;
  final String phonenumber;
  final VoidCallback onAddPatient; // Callback function

  ContactsTile({
    super.key,
    required this.name,
    required this.phonenumber,
    required this.onAddPatient, // Pass the callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: getFontSize(5, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: getFontSize(50, context),
                height: getFontSize(50, context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    name[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getFontSize(20, context)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: getFontSize(16, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: getFontSize(2, context)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      phonenumber,
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: getFontSize(10, context)),
              Container(
                width: getFontSize(79, context),
                height: getFontSize(27, context),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: onAddPatient, // Trigger the callback
                  child: Text(
                    "Add Patient",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getFontSize(10, context),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getFontSize(5, context)),
          SizedBox(
            width: getFontSize(350, context),
            child: Divider(
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }
}