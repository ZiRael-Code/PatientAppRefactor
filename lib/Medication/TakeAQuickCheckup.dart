import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/SpecialistProfile.dart';
import 'package:flutter_app/Medication/SearchSpecialist.dart';
import 'package:flutter_svg/svg.dart';



void main(){
  runApp(TakeAQuickCheckup());
}

class TakeAQuickCheckup extends StatefulWidget {
  TakeAQuickCheckup({super.key});
  @override
  _TakeAQuickSessionScreen createState() => _TakeAQuickSessionScreen();
}

class _TakeAQuickSessionScreen extends  State<TakeAQuickCheckup> {
  String? _selectedValue;

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
                  'Take a quick checkup',
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
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: getFontSize(30, context)),
        Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,
          width: double.infinity,
          child:  Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(width: getFontSize(1, context), 
                  color: Colors.black.withOpacity(0.090))
            ),
              child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchSpecialist()));
          },
                child:
              Container(
                width: getFontSize(59, context),
                height: getFontSize(59, context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE2EDFF),
                ),
                child: Icon(Icons.search, weight: 6, size: getFontSize(38, context),
                  color: Colors.blue,),
              ),
              ),

              SizedBox(width: getFontSize(10, context),),
              Container(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Text('Search for doctors/hospitals/pharmacies by their names.')
              )

        ]
      )
      ),
        ),
        SizedBox(height: getFontSize(20, context),),
        Container(
          alignment: Alignment.centerLeft,
          child: Text('Affiliated medical personnels', style: TextStyle(fontSize: getFontSize(18, context), fontWeight: FontWeight.bold),),

        ),
        SizedBox(height: getFontSize(35, context),),
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

      ],
    ),
    )));
  }

  specialist({required String image,
    required String name,
    required String specialization,
    required String workingType})
  {
    return GestureDetector(
        onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SpecialistProfile()));
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



}