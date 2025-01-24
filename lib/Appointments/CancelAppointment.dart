import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import 'ConfirmCalcellation.dart';

void main(){
  runApp(CancelAppointment());
}
class CancelAppointment extends StatefulWidget {
  CancelAppointmentPage createState()=>CancelAppointmentPage();
}

class CancelAppointmentPage extends State<CancelAppointment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: [

      Stack(
        children: [
          Container(
            height: getFontSize(150, context),
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
              SizedBox(height: getFontSize(100, context)),
              Align(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: getFontSize(4, context))
                      ),
                        child:
                        CircleAvatar(
                        backgroundImage: AssetImage('assets/images/doc.png'),
                        radius: 50
                        ),
                      ),


              ),
              SizedBox(height: getFontSize(20, context)),
              Text(
                'Dr. Muiz Sanni',
                style: TextStyle(
                  fontSize: getFontSize(20, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Cardiovascular surgeon',
                style: TextStyle(
                  fontSize: getFontSize(14, context),
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

        SizedBox(height: getFontSize(30, context),),
        SvgPicture.asset('assets/images/line.svg'),

              Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Time:", style: TextStyle(color: Color(0xFF2E2E42)),),
                                Text("12:00pm",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Spacer(),

                          Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                                  Text("12th July 2022",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Appointment Type:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                                Text("Online", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Spacer(),

                          Container(
                            child: Column(
                                children: [
                                  Text("Consultation fee:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                                  Text("N20,000",  style: TextStyle(fontSize: getFontSize(28, context),color: Colors.blue, fontWeight: FontWeight.bold))
                                ]
                            ),
                          )
                        ],
                      ),


                    ],
                  )



              )])

        ],
      ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(12),

         child:
          ElevatedButton(
            onPressed: () {
              cancel_dialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
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
          ),
      SizedBox(height: getFontSize(40, context),),
        ])) ;
  }


  patientReview({
   required int reviewedStar,
    required String dateReviewed,
    required String review,
    required String reviewerName,
    required BuildContext context
}){
return Container(
  padding: EdgeInsets.all(12),
  // height: getFontSize(167, context),
width: MediaQuery.of(context).size.width * 0.8,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(9),
border: Border.all(
color: Colors.black.withOpacity(0.1),
width: getFontSize(1.5, context),
),
),
  child: Column(
    children: [
      Align(
        alignment: Alignment.topCenter,
        child:
      Row(
        children: [
          Image.asset('assets/images/dr_profile.png', width: getFontSize(50, context), height: getFontSize(50, context),),
          SizedBox(width: getFontSize(10, context)),
          // CircleAvatar(
          //   backgroundImage: AssetImage(),
          //   radius: 50,
          // ),
          Column(
            children: [
              Text(reviewerName, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getFontSize(16, context),
              ),),
              SizedBox(height: getFontSize(3, context),),
          RatingBar(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            ratingWidget: RatingWidget(
            full: Icon(Icons.star, color: Colors.amber),
            half: Icon(Icons.star_half, color: Colors.amber),
            empty: Icon(Icons.star_border, color: Color(0xFFC7C7C7)),
          ), onRatingUpdate: (double value) {  },
            itemSize: 18,
          ),

    ],
          ),
          Spacer(),
          Container(alignment: Alignment.topLeft,
            child:
          Text(dateReviewed,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.blue,
            fontSize: getFontSize(15, context)
          ),),
          ),
        ],
      ),
      ),
      SizedBox(height: getFontSize(10, context),),
      Container(
        width: MediaQuery.of(context).size.width *  0.8,
        // width: getFontSize(265, context),
        child:
      Text(review, style: TextStyle(fontSize: getFontSize(14, context)),),
      ),
    ],
  ),
);
}


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
      padding: EdgeInsets.all(14),
      width: getFontSize(50, context),
      height: getFontSize(50, context),
      margin: EdgeInsets.only(right: getFontSize(10, context)),
    );
}


  cancel_dialog(){
    showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: getFontSize(201, context),
                    child:
                    Text(textAlign: TextAlign.center, 'Are you sure you want to cancel this appointment?', style: TextStyle(fontSize: getFontSize(16, context)),),
                  ),
                  SizedBox(height: getFontSize(20, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ConfirmCalcellation()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                          ),
                        ),
                      ),
                      SizedBox(width: getFontSize(10, context),),
                      ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          // backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                            side: BorderSide(color: Colors.blue, width: getFontSize(1, context)),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.blue, fontSize: getFontSize(18, context)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getFontSize(12, context)),
                ],
              )
          );
        }
    );
  }

}