import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/AppointmentDoctor.dart';
import 'package:flutter_app/Appointments/CancelAppointment.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(ScheduledAppointment());
}

class ScheduledAppointment extends StatefulWidget {
  ScheduledAppointment({super.key});
  @override
  _BookAppointmentSpecialistSearchScreen createState() => _BookAppointmentSpecialistSearchScreen();
}

class _BookAppointmentSpecialistSearchScreen extends  State<ScheduledAppointment> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  'Scheduled appointment',
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
    child:
        Container(
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: getFontSize(30, context)),
        Row(
          children:[
        Container(
          padding: EdgeInsets.only(right: getFontSize(10, context)),
          width: MediaQuery.of(context).size.width * 0.9,
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
        ]
      ),
        SizedBox(height: getFontSize(40, context)),
        //
        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingDays: "MON - FRI",
          workingHours: "9:00 AM - 6:00 PM",

        ),

        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingDays: "MON - FRI",
          workingHours: "9:00 AM - 6:00 PM",

        ),

        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingDays: "MON - FRI",
          workingHours: "9:00 AM - 6:00 PM",

        ),

        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingDays: "MON - FRI",
          workingHours: "9:00 AM - 6:00 PM",

        ),


      ],
    ),
    ),
    )));
  }

  specialist({required String image,
    required String name,
    required String specialization,
    required String workingDays,
    required String workingHours})
  {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CancelAppointment()));
      },
        child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: getFontSize(50, context)),
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
                  Text(specialization, style: TextStyle(
                    fontSize: getFontSize(16, context),
                    color: Colors.grey.withOpacity(0.90)
                  ),),
                  SizedBox(height: getFontSize(20, context)),
                ],
              ),

              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Container(
                      padding: EdgeInsets.only(left: getFontSize(12, context), right: getFontSize(12, context), top: getFontSize(6, context), bottom: getFontSize(6, context)),
                      decoration: BoxDecoration(
                        color: Color(0xffE2EDFF),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        workingHours,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      )
                  ),
                  SizedBox(height: getFontSize(10, context),),
                  Container(
                      padding: EdgeInsets.only(left: getFontSize(12, context), right: getFontSize(12, context), top: getFontSize(6, context), bottom: getFontSize(6, context)),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text(
                        workingDays,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                  ),

                ],
              )

            ],
          ),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(15, context),),
        ],
      ),
      ),
    );
  }
}