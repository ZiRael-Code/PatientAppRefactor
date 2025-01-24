import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/HospitalProfile.dart';
import 'package:flutter_app/Appointments/PharmacyProfile.dart';
import 'package:flutter_app/Appointments/SpecialistProfile.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(AffiliatedNetwork());
}

class AffiliatedNetwork extends StatefulWidget {
  AffiliatedNetwork({super.key});
  @override
  _AffiliatedNetworkScreen createState() => _AffiliatedNetworkScreen();
}

class _AffiliatedNetworkScreen extends  State<AffiliatedNetwork> with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);

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
                  'Affiliated Network',
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
        body:
        Container(
          padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
          child: Align(
            child: Column(
              children: [
                SizedBox(height: getFontSize(40, context)),
                Container(
                  height: getFontSize(50, context),
                  padding: EdgeInsets.all(4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SizedBox(
                    child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      indicatorColor: Colors.transparent, // Removes the default bottom underline
                      labelColor: Colors.black,
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: Color(0xff4F4F4F),
                      tabs: [
                        Tab(text: "Specialists"),
                        Tab(text: "Pharmacies"),
                        Tab(text: "Hospitals"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getFontSize(10, context)),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Center(child: specialists()),
                      Center(child: pharmacies()),
                      Center(child: hospitals()),
                    ],
                  ),
                ),
              ],
    ),
    )));
  }

  specialists() {
    return Column(
      children: [
        SizedBox(height: getFontSize(20, context)),

    specialist(
      image: "assets/images/doc1.png",
      name: "Dr. John Doe",
      specialization: "Cardiologist surgeon",
      workingType: "Freelance specialist",
    ),
    specialist(
      image: "assets/images/doc.png",
      name: "Dr. Nelson Yang",
      specialization: "Design Doctor",
      workingType: "Walls and Gates hospital",
    ),
    specialist(
          image: "assets/images/doc1.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingType: "Freelance specialist",
    ),
    ]
    );

  }

  pharmacies() {
    return Column(
      children: [
    pharmacist(
      image: "assets/images/pharm1.jpeg",
      name: "RX Pharmacy",
      type: "Pharmacy",
    ),
    pharmacist(
      image: "assets/images/pharm2.jpeg",
      name: "RX Pharmacy",
      type: "Pharmacy",
    ),
    ]
    );
  }

  hospitals() {
    return Column(
      children: [
    hospital(
      image: "assets/images/host1.png",
      name: "New Life Medical Hospital Centre",
      type: "Hospital",
    ),

     hospital(
      image: "assets/images/host1.png",
      name: "Tripple J",
      type: "Health Clinic",
    ),

        hospital(
      image: "assets/images/host1.png",
      name: "Koboko Hospital",
      type: "Healthcare center",
    ),
    ]
    );
  }


  specialist({required String image,
    required String name,
    required String specialization,
    required String workingType})
  {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialistProfile()));
      },
        child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  // margin: EdgeInsets.only(bottom: getFontSize(50, context)),
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
                  Text(name, style: TextStyle(
                      fontSize: getFontSize(18, context),
                      color: Colors.black
                  ),),
                  SizedBox(height: getFontSize(5, context),),
                  Text("${specialization} . ${workingType}", style: TextStyle(
                      fontSize: getFontSize(12, context),
                      color: Colors.grey.withOpacity(0.90)
                  ),),
                ],
              )

            ],
          ),
          SizedBox(height: getFontSize(15, context),),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(15, context),),
        ],
      ),
      ),
    );
  }


  pharmacist({required String image,
    required String name,
    required String type})
  {
    return GestureDetector(
        onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => PharmacyProfile()));
    },
        child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  // margin: EdgeInsets.only(bottom: getFontSize(50, context)),
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
                  Text(name, style: TextStyle(
                      fontSize: getFontSize(18, context),
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                  SizedBox(height: getFontSize(5, context),),
                  Text(type, style: TextStyle(
                      fontSize: getFontSize(12, context),
                      color: Colors.grey.withOpacity(0.90)
                  ),),
                ],
              )

            ],
          ),
          SizedBox(height: getFontSize(15, context),),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(15, context),),
        ],
      ),
      ),
    );
  }

  hospital({required String image,
    required String name,
    required String type})
  {
    return GestureDetector(
        onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalProfile()));
    },
        child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  // margin: EdgeInsets.only(bottom: getFontSize(50, context)),
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
                  Text(name, style: TextStyle(
                      fontSize: getFontSize(18, context),
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                  SizedBox(height: getFontSize(5, context),),
                  Text(type, style: TextStyle(
                      fontSize: getFontSize(12, context),
                      color: Colors.grey.withOpacity(0.90)
                  ),),
                ],
              )

            ],
          ),
          SizedBox(height: getFontSize(15, context),),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(15, context),),
        ],
      ),
      ),
    );
}
}