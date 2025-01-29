import '../components/colors/colours.dart';
 
import '../Main/Dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/AffiliatedNetwork.dart';
import 'package:flutter_app/Appointments/BookAppointmentSpecialistSearch.dart';
import 'package:flutter_app/Appointments/Message.dart';
import 'package:flutter_app/Medication/TakeAQuickCheckup.dart';
import 'package:flutter_svg/svg.dart';import 'dart:math';

import 'ScheduledAppointment.dart';


void main(){
  runApp(MainAppointment());
}


class MainAppointment extends StatefulWidget{
  @override
  _MainAppointmentState createState() => _MainAppointmentState();
}

class _MainAppointmentState extends State<MainAppointment> {
  late List<dynamic> sectionList = [nothing(), pendingAppointments()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: AppColors.gray[100],
        elevation: 0,
        title: Text(
          'Appointment',
          style: TextStyle(
            fontSize: getFontSize(26, context),
            fontWeight: FontWeight.bold,
            color: AppColors.gray[700],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Message()));
            },
      child: Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: AppColors.gray[700],
                  size: getFontSize(28, context),
                ),
                onPressed: () {},
              ),
              Positioned(
                top: getFontSize(10, context),
                right: getFontSize(12, context),
                child: Container(
                  width: getFontSize(10, context),
                  height: getFontSize(10, context),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          ),
        ],
      ),
      body:SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getFontSize(20, context),),
            // Scrollable row with quick checkup options
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> TakeAQuickCheckup()));
                    },
                    child:
                  appointmentOptions(
                    icon: Icon(
                      Icons.electric_bolt,
                      color: AppColors.blue[700],
                      size: getFontSize(30, context),
                    ),
                    text: "Take a quick checkup"
                  ),
                  ),

        GestureDetector(
          onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> TakeAQuickCheckup()));
          },
          child:
                  appointmentOptions(
                    icon: Icon(
                      Icons.local_hospital,
                      color: AppColors.blue[700],
                      size: getFontSize(30, context),
                    ),
                    text: "Book appointment"
                  ),
                  ),


                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ScheduledAppointment()));
                    },
                    child:
                  appointmentOptions(
                    icon: Icon(
                      Icons.refresh,
                      color: AppColors.blue[700],
                      size: getFontSize(30, context),
                    ),
                    text: "Scheduled appointment"
                  ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> AffiliatedNetwork()));
                    },
                    child:
                  appointmentOptions(
                    icon: Icon(
                      Icons.share,
                      color: AppColors.blue[700],
                      size: getFontSize(30, context),
                    ),
                    text: 'View affiliated network',
                  ),
                  ),
                  // Add more options here as needed...
                ],
              ),
            ),
            SizedBox(height: getFontSize(20, context)),

            // Available specialists with "See more" button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available specialists',
                  style: TextStyle(
                    fontSize: getFontSize(18, context),
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray[700],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more',
                    style: TextStyle(
                      fontSize: getFontSize(16, context),
                      color: AppColors.blue[700],
                    ),
                  ),
                ),
              ],
            ),

            // Scrollable row of specialists
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [

                  specialist(
                    ratings: "3.5",
                    imagePath: "assets/images/doc.png",
                    name: "Dr. Patric Ayomide",
                    specialization: "Cardiologist surgeon",
                    workingDays: "MON - FRI",
                    workingHours: "9:00 AM - 6:00 PM",
                  ),

                  specialist(
                    ratings: "3.5",
                    imagePath: "assets/images/doc.png",
                    name: "Dr. Patric Ayomide",
                    specialization: "Cardiologist surgeon",
                    workingDays: "MON - FRI",
                    workingHours: "9:00 AM - 6:00 PM",
                  ),
                  // Add more specialists here...
                ],
              ),
            ),
            SizedBox(height: getFontSize(25, context)),
            // Pending MainAppointment
            Text(
              'Pending appointments',
              style: TextStyle(
                fontSize: getFontSize(18, context),
                fontWeight: FontWeight.bold,
                color: AppColors.gray[700],
              ),
            ),

            SizedBox(height: getFontSize(25, context)),

            randomMedicationChooser()
      ],
        ),
      ),
      ),
    );
  }
  nothing() {
    return  DottedBorder(
      color:  Colors.grey.withOpacity(0.70),
      radius: Radius.circular(19),
      dashPattern: [8, 6],
      borderType: BorderType.RRect,
      strokeWidth: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: getFontSize(216, context),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.10)
        ),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/box.svg'),
            Text('No appointment yet.', style: TextStyle(fontSize: getFontSize(16, context),
                color: AppColors.gray[700].withOpacity(0.40)),),
            SizedBox(height: getFontSize(11, context),),
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookAppointmentSpecialistSearch()));
                },
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookAppointmentSpecialistSearch()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue[700],
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      'Book an appointment',
                      style: TextStyle(color: AppColors.gray[100], fontSize: getFontSize(16, context)),
                    ),
                  ),
                ),
              ),
            ),

            Spacer(),

          ],
        ),


      ),
    );
  }
  randomMedicationChooser(){
    return sectionList[Random.secure().nextInt(2)];
  }

  appointments({
    required String name,
    required String time,
    required String date,
    required String appointmentType,

  }){
    Color textColor = Color(0xffffa135);
    if (appointmentType.toLowerCase().compareTo('online appointment') == 0 ){
      textColor =  Color(0xffffa135);
    }else{
      textColor = Color(0xFF2db042);
    }
    return GestureDetector(
      onTap: (){
        appointment_information_bottom_sheet();
      },
        child: Container(
      margin: EdgeInsets.only(bottom: getFontSize(10, context)),
      padding: EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray[700].withOpacity(0.09))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(name, style: TextStyle(
           fontSize: getFontSize(16, context),
           color: AppColors.gray[700],
         ),),
         SizedBox(height: getFontSize(5, context),),
         Row(
           children: [
             Text(time, style: TextStyle(
               fontSize: getFontSize(14, context),
               color: AppColors.gray[700],
             ),),
             SizedBox(width: getFontSize(8, context),),
             Text(date, style: TextStyle(
               fontSize: getFontSize(14, context),
               color: AppColors.gray[700],
             ),),
           ],
         ),
         SizedBox(height: getFontSize(10, context),),
         Container(
           padding: EdgeInsets.only(left: getFontSize(10, context), right: getFontSize(10, context), top: getFontSize(5, context), bottom: getFontSize(5, context)),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(50),
             color:  textColor.withOpacity(0.15)
           ),
           child:   Text(appointmentType, style: TextStyle(
             fontSize: getFontSize(16, context),
             color: textColor,
           ),),
         ),
       

       ],
      ),
      ),
    );

  }

  appointmentOptions({
    required Icon icon,
    required String text}) {
    return Container(
      margin: EdgeInsets.only(right: getFontSize(3, context)),
      child: Column(
      children: [
        Container(
          width: getFontSize(60, context),
          height: getFontSize(60, context),
          decoration: BoxDecoration(
            color: AppColors.blue[600],
            shape: BoxShape.circle,
          ),
          child: icon
        ),
        SizedBox(height: getFontSize(8, context)),
        Container(
          width: getFontSize(78, context),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getFontSize(12, context),
            ),
          ),
        ),
      ],
    ),
    );
  }
  specialist({required String ratings,
    required String imagePath,
    required String name,
    required String specialization,
    required String workingDays,
    required String workingHours
  }) {
    return Container(
      padding: EdgeInsets.only(left: getFontSize(11, context), right: getFontSize(11, context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: AppColors.gray[700].withOpacity(0.09),
        ),
      ),
      width: getFontSize(237, context),
      height: getFontSize(286, context),
      margin: EdgeInsets.only(right: getFontSize(25, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: getFontSize(160, context),
                child: Image.asset(imagePath),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned(
                top: getFontSize(8, context),
                right: getFontSize(8, context),
                child: Container(
                  margin: EdgeInsets.only(top: getFontSize(10, context)),
                  width: getFontSize(51, context),
                  height: getFontSize(24, context),
                  decoration: BoxDecoration(
                    color: AppColors.gray[700].withOpacity(0.45),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: getFontSize(16, context),
                      ),
                      SizedBox(width: getFontSize(4, context)),
                      Text(
                        ratings,
                        style: TextStyle(
                          color: AppColors.gray[100],
                          fontSize: getFontSize(12, context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getFontSize(8, context)),
          Text(
            name,
            style: TextStyle(
              fontSize: getFontSize(18, context),
              fontWeight: FontWeight.bold,
              color: AppColors.gray[700],
            ),
          ),
          SizedBox(height: getFontSize(4, context)),
          Text(
            specialization,
            style: TextStyle(
              fontSize: getFontSize(14, context),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: getFontSize(10, context)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: getFontSize(12, context), right: getFontSize(12, context), top: getFontSize(6, context), bottom: getFontSize(6, context)),
                    decoration: BoxDecoration(
                        color: AppColors.blue[700],
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      workingDays,
                      style: TextStyle(
                        color: AppColors.gray[100],
                      ),
                    )
                ),

                Container(
                    padding: EdgeInsets.only(left: getFontSize(12, context), right: getFontSize(12, context), top: getFontSize(6, context), bottom: getFontSize(6, context)),
                    decoration: BoxDecoration(
                      color: AppColors.blue[600],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      workingHours,
                      style: TextStyle(
                        color: AppColors.blue[700],
                      ),
                    )
                ),

              ]
          )
        ],
      ),
    );
  }

  pendingAppointments() {
    return Column(
      children: [
        // The design for the appointment is down uncomment this to see it.
        appointments(name: "Dr. Nelson Yang",
            time: '9:00AM.',
            date: '12th June',
            appointmentType: 'online appointment'
        ),

        appointments(name: "Dr. Charles Dickson",
            time: '9:00AM.',
            date: '12th June',
            appointmentType: 'Physical appointment'
        )
      ],
    );
  }

  void appointment_information_bottom_sheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) =>
            Container(
              padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.gray[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: getFontSize(103, context),
                        child: Row(
                          children: [
                            Image.asset('assets/images/dr_profile.png',
                              width: getFontSize(56, context),
                              height: getFontSize(56, context),
                            ),
                            SizedBox(width: getFontSize(10, context)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: Text("Dr. Muiz Sanni", style: TextStyle(color: AppColors.gray[700], fontWeight: FontWeight.bold),)),
                                SizedBox(height: getFontSize(10, context),),
                                Center(child: Text("Cardiovascular surgeon", style: TextStyle(color: Colors.grey),),),
                              ],
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color:  AppColors.gray[700].withOpacity(0.1)),
                        ),
                      ),
                      SizedBox(height: getFontSize(20, context),),
                      Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text("Time:", style: TextStyle(color: Color(0xFF2E2E42)),),
                                Text("12:00pm",  style: TextStyle(color: AppColors.gray[700], fontWeight: FontWeight.bold)),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                          Spacer(),

                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                                  Text("12th July 2022",  style: TextStyle(color: AppColors.gray[700], fontWeight: FontWeight.bold))
                                ]
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: getFontSize(25, context),),
                      Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Appointment Type:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                                Text("Online", style: TextStyle(color: AppColors.gray[700], fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Spacer(),

                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Consultation fee:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                                  Text("N20,000",  style: TextStyle(fontSize: getFontSize(28, context),color: AppColors.blue[700], fontWeight: FontWeight.bold))
                                ]
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: getFontSize(25, context),),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gray[100],
                          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width), // Button width
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                            side: BorderSide(
                              color: Color(0xFFFF6161),
                              width: getFontSize(0.5, context),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                          child: Text(
                            'Cancel appointment',
                            style: TextStyle(
                              color: Color(0xFFFF6161), // Text color
                              fontSize: getFontSize(16, context),
                            ),
                          ),
                        ),
                      )
                    ]
                )
            )
    );
  }
}