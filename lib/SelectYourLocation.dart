import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ConfirmLocation.dart';

class SelectYourLocation extends StatefulWidget {
  SelectYourLocation({super.key});

  @override
  State<SelectYourLocation> createState() => _SelectYourLocationState();
}

class _SelectYourLocationState extends State<SelectYourLocation> {
  TextEditingController controller = TextEditingController();

  final List<Map<String, String>> addressMap = [
    {
      "address": "Green Street, 13",
      "city": "Lagos",
      "country": "Nigeria",
    },
    {
      "address": "Green road avenue",
      "city": "Lagos",
      "country": "Nigeria",
    },
    {
      "address": "Green Street, 13",
      "city": "Lagos",
      "country": "Nigeria",
    },
    {
    },
  ];

  String query = "";
  bool showAddPatient = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredAddresses = addressMap
        .where((map) => map.values.any(
          (value) => value.toLowerCase().contains(query.toLowerCase()),
    ))
        .toList();
    filteredAddresses.add(addressMap.last);

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: getFontSize(35, context),
              height: getFontSize(35, context),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFE5E5E5),
              ),
              child: SvgPicture.asset(
                'assets/images/back.svg',
                width: getFontSize(8.0, context),
                height: getFontSize(15, context),
              ),
            ),
            Spacer(),
            Text(
              'Select your location',
              style: TextStyle(fontSize: getFontSize(20, context), fontStyle: FontStyle.normal),
            ),
            Spacer(),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(right: getFontSize(10, context)),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    query = value;
                    showAddPatient = !filteredAddresses.isEmpty;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search by street name, city...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            SizedBox(height: getFontSize(10, context)),
            Visibility(
              visible: filteredAddresses.isNotEmpty,
              child: Expanded(
                child: ListView.builder(
                  itemCount: filteredAddresses.length + 1, // Extra item for the additional row
                  itemBuilder: (context, index) {
                    if (index == filteredAddresses.length) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Can’t find your address?",
                                  style: TextStyle(fontSize: getFontSize(16, context)),
                                ),
                                SizedBox(height: getFontSize(10, context)),
                                Text("Use the map instead"),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xffE2EDFF),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    final address = filteredAddresses[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:
                            (builder) => ConfirmLocation()));
                      },
                      child: addressWidget(
                        address["address"] ?? "No Address",
                        address["city"],
                        address["country"],
                      ),
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: query.isEmpty,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Color(0xffE2EDFF),
                    shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: getFontSize(15, context)),
                  Text(
                    "Use my location",
                    style: TextStyle(
                      fontSize: getFontSize(16, context),
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addressWidget(String name, String? city, String? country) {
    return ListTile(
      title: Text(name),
      subtitle: Text(
        "$city, $country",
        style: TextStyle(fontSize: getFontSize(14, context)),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: SelectYourLocation()));
}