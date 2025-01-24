import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments.dart';
import 'package:flutter_app/Appointments1.dart';
import 'package:flutter_app/Appointments/ScheduleAppointmentDateChooser.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(AppointmentDoctor());
}
class AppointmentDoctor extends StatefulWidget {
  @override
  _AppointmentDoctorPageState createState() => _AppointmentDoctorPageState();

}

class _AppointmentDoctorPageState extends State<AppointmentDoctor> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: getFontSize(206, context),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.blue,
            ),
              alignment: Alignment.centerLeft,
              child:
              Container(
                margin: EdgeInsets.only(left: getFontSize(10, context)),
                width: getFontSize(45, context),
                height: getFontSize(45, context),
                alignment: Alignment.center, // Centers the content inside the inner container
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5).withOpacity(0.15),
                ),
                child: SvgPicture.asset(
                  'assets/images/back.svg',
                  color: Colors.white,
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),
                ),
              ),
            ),
          Column(
            children: [
              SizedBox(height: getFontSize(150, context)),
              Align(
                    child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dr.png'),
                        radius: 50
                        ),

              ),
              SizedBox(height: getFontSize(20, context)),
              Text(
                'Dr. Nelson Yang',
                style: TextStyle(
                  fontSize: getFontSize(25, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getFontSize(5, context)),
              Text(
                'Cardiovascular surgeon',
                style: TextStyle(
                  fontSize: getFontSize(18, context),
                ),
              ),
              SizedBox(height: getFontSize(20, context)),
              Align(
                alignment: Alignment.center,
                child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  handles(handleIconPath: 'assets/images/tel.svg'),
                  handles(handleIconPath: 'assets/images/contactMe.svg'),
                  handles(handleIconPath: 'assets/images/vc.svg'),
                ],
          ),
              ),
              Container(
                margin: EdgeInsets.only(top: getFontSize(20, context)),
                padding:EdgeInsets.only(left: getFontSize(15, context), right: getFontSize(15, context)),
                child:
                Column(
                  children: [
                  Align(
                alignment: Alignment.centerLeft,
                child:Text('Avialable days', textAlign: TextAlign.left,style: TextStyle(
                fontSize: getFontSize(18, context),
                fontWeight: FontWeight.bold,
              ),),

              ),
                    SizedBox(height: getFontSize(7, context),),
                    Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    direction: Axis.horizontal,
                  children: [
                  wicd(text: "MON"),
                  wicd(text: "TUE"),
                  wicd(text: "WED"),
                  wicd(text: "THUR"),
                ],
              ),
              ),

                SizedBox(height: getFontSize(20, context),),
                Align(
                alignment: Alignment.centerLeft,
                child:Text('Avialable days', textAlign: TextAlign.left,style: TextStyle(
                fontSize: getFontSize(18, context),
                fontWeight: FontWeight.bold,
              ),),

              ),
                    SizedBox(height: getFontSize(7, context),),
                    Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    direction: Axis.horizontal,
                  children: [
                  wicd(text: "11:00AM-3:00AM"),
                  wicd(text: "9:00AM"),
                  wicd(text: "7:00PM"),
                ],
              ),
              ),
                    SizedBox(height: getFontSize(15, context),),
                Align(
                  alignment: Alignment.centerLeft,
                 child:
                   Text('Patient Reviews',
                      style: TextStyle(
                      fontSize: getFontSize(18, context),
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                     child: Text('N20,000',
                      style: TextStyle(
                      fontSize: getFontSize(26, context),
                      fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),),
                ),
                     SizedBox(height: getFontSize(10, context),),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleAppointmentDateChooser()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                        child: Text(
                          'Schedule appointment',
                          style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                        ),
                      ),
                    ),
    ],
    ),
    )
   ],
          ),
        ]
        ,)
    );
  }


//   patientReview({
//    required int reviewedStar,
//     required String dateReviewed,
//     required String review,
//     required String reviewerName,
//     required BuildContext context
// }){
// return Container(
//   padding: EdgeInsets.all(12),
//   // height: getFontSize(167, context),
// width: MediaQuery.of(context).size.width * 0.8,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(9),
// border: Border.all(
// color: Colors.black.withOpacity(0.1),
// width: getFontSize(1.5, context),
// ),
// ),
//   child: Column(
//     children: [
//       Align(
//         alignment: Alignment.topCenter,
//         child:
//       Row(
//         children: [
//           Image.asset('assets/images/dr_profile.png', width: getFontSize(50, context), height: getFontSize(50, context),),
//           SizedBox(width: getFontSize(10, context)),
//           // CircleAvatar(
//           //   backgroundImage: AssetImage(),
//           //   radius: 50,
//           // ),
//           Column(
//             children: [
//               Text(reviewerName, style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: getFontSize(16, context),
//               ),),
//               SizedBox(height: getFontSize(3, context),),
//           RatingBar(
//             initialRating: 3,
//             minRating: 1,
//             direction: Axis.horizontal,
//             itemCount: 5,
//             ratingWidget: RatingWidget(
//             full: Icon(Icons.star, color: Colors.amber),
//             half: Icon(Icons.star_half, color: Colors.amber),
//             empty: Icon(Icons.star_border, color: Color(0xFFC7C7C7)),
//           ), onRatingUpdate: (double value) {  },
//             itemSize: 18,
//           ),
//
//     ],
//           ),
//           Spacer(),
//           Container(alignment: Alignment.topLeft,
//             child:
//           Text(dateReviewed,
//           textAlign: TextAlign.start,
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: getFontSize(15, context)
//           ),),
//           ),
//         ],
//       ),
//       ),
//       SizedBox(height: getFontSize(10, context),),
//       Container(
//         width: MediaQuery.of(context).size.width *  0.8,
//         // width: getFontSize(265, context),
//         child:
//       Text(review, style: TextStyle(fontSize: getFontSize(14, context)),),
//       ),
//     ],
//   ),
// );
// }
//

  wicd({
    required String text
}){
    return Container(
      margin: EdgeInsets.only(right: getFontSize(5, context), top: getFontSize(15, context)),
      padding: EdgeInsets.only(top: getFontSize(12, context), left: getFontSize(25, context), bottom: getFontSize(12, context), right: getFontSize(25, context)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1), width: getFontSize(0.5, context)),
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Text(text, style: TextStyle(fontSize: getFontSize(12, context)),),
    );
  }

  handles({
    required handleIconPath
}){
    return Container(
      child: SvgPicture.asset(handleIconPath),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.blue.withOpacity(0.15),
      ),
      padding: EdgeInsets.all(10),
      width: getFontSize(50, context),
      height: getFontSize(50, context),
      margin: EdgeInsets.only(right: getFontSize(10, context)),
    );
}
}