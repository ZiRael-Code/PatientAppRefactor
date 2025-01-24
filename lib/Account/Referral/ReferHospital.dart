import '../../Main/Dashboard.dart';




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'SendInvites.dart';
import 'contacts_checked_tile.dart';


class ReferHospital extends StatefulWidget {
  ReferHospital({super.key});

  @override
  State<ReferHospital> createState() => _ReferHospitalState();
}

class _ReferHospitalState extends State<ReferHospital>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final String referralCode = '7f44aiwuehjands3gui';

  List<String> contacts = [
    "Alexander Trelawney",
    "Blexander Trelawney",
    "Jonathan Mason",
    "Sophia Bennett",
    "Emily Jones",
  ];

  List<String> filteredContacts = [
    "Alexander Trelawney",
    "Blexander Trelawney",
    "Jonathan Mason",
    "Sophia Bennett",
    "Emily Jones",
  ];

  // Keep track of selected contacts
  Set<String> selectedContacts = {};

  // Filter contacts based on search query
  void _filterContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredContacts = contacts;
      } else {
        filteredContacts = contacts
            .where((contact) =>
                contact.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // Add or remove a contact from the selected list
  void _toggleSelection(String contact, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedContacts.add(contact);
      } else {
        selectedContacts.remove(contact);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getFontSize(25, context)),
          child: Column(
            children: [
              SizedBox(height: getFontSize(40, context)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: getFontSize(45, context),
                      width: getFontSize(45, context),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(width: getFontSize(50, context)),
                  Center(
                    child: Text(
                      "Refer a hospital",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(20, context),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: selectedContacts.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: getFontSize(40, context)),
                        child: SizedBox(
                          height: getFontSize(60, context),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Container with person icon
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    width: getFontSize(49, context),
                                    height: getFontSize(49, context),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset("assets/images/hospital.svg",
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: getFontSize(10, context)),

                                  Text(
                                    'Referral link:',
                                    style: TextStyle(
                                        fontSize: getFontSize(16, context),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: getFontSize(10, context)), // Spacing

                                  Expanded(
                                    child: Text(
                                      referralCode,
                                      style: TextStyle(fontSize: getFontSize(16, context)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  SizedBox(width: getFontSize(10, context)),

                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(
                                          ClipboardData(text: referralCode));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('Copied to clipboard')));
                                    },
                                    child: Container(
                                      width: getFontSize(79, context),
                                      height: getFontSize(28, context),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE2EDFF),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.copy,
                                              color: Colors.blue, size: getFontSize(16, context)),
                                          SizedBox(width: getFontSize(5, context)),
                                          Text(
                                            'Copy',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : null,
              ),
              SizedBox(height: getFontSize(10, context)),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: getFontSize(35, context)),
                    Container(
                      height: getFontSize(50, context),
                      padding: EdgeInsets.all(4),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextField(
                        onChanged: _filterContacts,
                        decoration: InputDecoration(
                          hintText: "Patient name or Phone number",
                          hintStyle:
                              TextStyle(fontSize: getFontSize(14, context), color: Colors.grey[400]),
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.grey[400],
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getFontSize(20, context),
                    ),
                    // Increment selected
                    Center(
                      child: Text(
                        "[ ${selectedContacts.length} selected ]", // Show the count of selected contacts
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: getFontSize(16, context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getFontSize(20, context),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredContacts.length,
                        itemBuilder: (context, index) {
                          final contact = filteredContacts[index];
                          return ContactsCheckedTile(
                            name: contact,
                            isInitiallySelected:
                                selectedContacts.contains(contact),
                            onSelectionChanged: (isSelected) {
                              _toggleSelection(contact, isSelected);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getFontSize(30, context),
              ),
              Container(
                child: selectedContacts.isNotEmpty
                    ? GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SendInvites())),
                        child: Container(
                          width: getFontSize(335, context),
                          height: getFontSize(54, context),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getFontSize(16, context)),
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
              SizedBox(
                height: getFontSize(20, context),
              )
            ],
          ),
        ),
      ),
    );
  }
}