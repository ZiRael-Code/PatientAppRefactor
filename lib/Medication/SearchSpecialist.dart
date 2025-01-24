import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Appointments/SpecialistProfile.dart';

void main(){
  runApp(SearchSpecialist());
}

class SearchSpecialist extends StatefulWidget {
  SearchSpecialist({super.key});
  @override
  _SearchSpecialistScreen createState() => _SearchSpecialistScreen();
}

class _SearchSpecialistScreen extends  State<SearchSpecialist> {
  String? _selectedValue;
  bool isFilterOpen = false;
  List<String> btnText = ["Pharmacy", "Hospital", "Doctor", "Gynaecologist", "Dentist", "Surgeon", "Surgeon", "Opthalmologist", "Others..."];
  bool isOther = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
          onTap: () => Navigator.pop(context),
          child: 
              Container(
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),),
              ),
              ),

              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Search',
                  style: TextStyle(
                      fontSize: getFontSize(20, context),
                      fontStyle: FontStyle.normal
                  ),
                ),
                ),
              ),
              Spacer(),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child: Column(
              children: [
                SizedBox(height: getFontSize(30, context)),
                Row(
                  children: [
                    // Search field
                    Container(
                      padding: EdgeInsets.only(right: getFontSize(10, context)),
                      width: MediaQuery.of(context).size.width * 0.70,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search by name, specialization...',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),

                    // Filter icon
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFilterOpen = !isFilterOpen; // Toggle the dropdown and icon
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: getFontSize(12, context)),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: isFilterOpen
                            ? Icon(Icons.close, color: Colors.black) // X icon when open
                            : SvgPicture.asset('assets/images/filter.svg'), // Filter icon when closed
                      ),
                    ),
                  ],
                ),

                // Filter dropdown appears under the row when isFilterOpen is true

                if (isFilterOpen)
                  Container(
                    margin: EdgeInsets.only(top: getFontSize(16, context)), // Spacing between row and dropdown
                    width: double.infinity, // Matches screen width
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Filters",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSize(18, context),
                          ),
                        ),
                        SizedBox(height: getFontSize(20, context)), // Space between the text and buttons
                        Wrap(
                          spacing: 5, // Space between buttons horizontally
                          runSpacing: 8, // Space between buttons vertically
                          children: [
                            for (int i = 0; i <= btnText.length-1; i++) // Create 9 buttons
                              ElevatedButton(
                                onPressed: () {
                                  // Button logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                    color: i == btnText.length-1 ? Colors.blue : Colors.transparent, // Border color
                                    width:  i == btnText.length-1 ? 1.0 : 0.0, // Border width
                                  ),
                                  shadowColor: Colors.transparent,
                                  backgroundColor: i == btnText.length-1 ? Colors.transparent : Color(0xFFE2EDFF)  , // Button color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50), // Rounded corners
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    btnText[i],
                                    style: TextStyle(color: Color(0xff3C8AFF), fontSize: getFontSize(11.5, context)), // Button text color
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: getFontSize(40, context)),

                // List of specialists
                specialist(
                  image: "assets/images/doc.png",
                  name: "Dr. Nelson Yang",
                  specialization: "Design Doctor",
                  workingType: "Walls and Gates hospital",
                ),
                specialist(
                  image: "assets/images/doc1.png",
                  name: "Dr. Muiz Sanni",
                  specialization: "Design Doctor",
                  workingType: "Walls and Gates hospital",
                ),
                specialist(
                  image: "assets/images/host2.png",
                  name: "New Life Medical Hospital Centre",
                  specialization: "Hospital",
                  workingType: "",
                ),
                specialist(
                  image: "assets/images/pharm2.jpeg",
                  name: "RX Pharmacy",
                  specialization: "Pharmacy",
                  workingType: "",
                ),
                specialist(
                  image: "assets/images/host2.png",
                  name: "New Life Medical Hospital Centre",
                  specialization: "Hospital",
                  workingType: "",
                ),
                specialist(
                  image: "assets/images/pharm2.jpeg",
                  name: "RX Pharmacy",
                  specialization: "Pharmacy",
                  workingType: "",
                ),
              ],
            ),
          ),
        ),
    );
  }

  specialist({
    required String image,
    required String name,
    required String specialization,
    required String workingType,
  }) {
    return GestureDetector(
        onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SpecialistProfile()));
    },
    child:  Container(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: getFontSize(44, context),
                  width: getFontSize(44, context),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(image),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(width: getFontSize(12, context)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: getFontSize(18, context),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: getFontSize(5, context)),
                  Text(
                    "${specialization} . ${workingType}",
                    style: TextStyle(
                      fontSize: getFontSize(12, context),
                      color: Colors.grey.withOpacity(0.90),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: getFontSize(15, context)),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(15, context)),
        ],
      ),
      ),
    );
  }
}