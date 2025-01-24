import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(HospitalProfile());
}
class HospitalProfile extends StatefulWidget {
  @override
  _HospitalProfileState createState() => _HospitalProfileState();
}

class _HospitalProfileState extends State<HospitalProfile> {

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
                        backgroundImage: AssetImage('assets/images/pharm1.jpeg'),
                        radius: 50
                        ),

              ),
              SizedBox(height: getFontSize(20, context)),
              Text(
                'New Life Medical Center',
                style: TextStyle(
                  fontSize: getFontSize(25, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getFontSize(5, context)),
              SizedBox(
                width: getFontSize(209, context),
                child: Text(
                  textAlign: TextAlign.center,
                  'No. 33 Adegoke Street, Surulere, Lagos State',
                  style: TextStyle(
                    fontSize: getFontSize(16, context),
                  ),
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
                  handles(handleIconPath: 'assets/images/drAppoint.svg'),
                  handles(handleIconPath: 'assets/images/location.svg'),
                ],
          ),
              ),
                    SizedBox(height: getFontSize(15, context),),
      Padding(padding: EdgeInsets.all(12),
        child: Column(
          children: [
                Align(
                  alignment: Alignment.centerLeft,
                 child:
                 Column(
                   children: [
                   Text('Patient Reviews',
                      style: TextStyle(
                      fontSize: getFontSize(18, context),
                      fontWeight: FontWeight.bold,
                    ),),
                     SizedBox(height: getFontSize(10, context),),
                ],
                ),

                ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child:SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:
                    Row(
                      children: [
                        patientReview(
                            reviewedStar: 4,
                            dateReviewed: '23 July 2023',
                            review: 'I’m really thankful to doctor Sanni for this wonderful treatment. I feel better thanks to his prescriptions and he’s really nice.',
                            reviewerName: 'Richard Okafor',
                            context: context
                        ),
                        SizedBox(width: getFontSize(20, context),),
                        patientReview(
                            reviewedStar: 4,
                            dateReviewed: '23 July 2023',
                            review: 'I’m really thankful to doctor Sanni for this wonderful treatment. I feel better thanks to his prescriptions and he’s really nice.',
                            reviewerName: 'Richard Okafor',
                            context: context
                        ),

                      ],
                    ),
                    ),
                    ),
                    SizedBox(height: getFontSize(20, context),),
                    Column(
                      children: [
                        Align(alignment: Alignment.topLeft,child:
                        Text('Write a Review', style: TextStyle(
                          fontSize: getFontSize(18, context),
                          fontWeight: FontWeight.bold,
                        ),),),],),
                    SizedBox(height: getFontSize(20, context),),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
                    height: getFontSize(85, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color(0xFFF1F1F1),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        width: getFontSize(1.5, context),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                    child: 
                    Column(
                      children: [
                        RatingBar(
                          initialRating: 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.amber),
                            half: Icon(Icons.star_half, color: Colors.amber),
                            empty: Icon(Icons.star_border, color: Color(0xFFC7C7C7)),
                          ), onRatingUpdate: (double value) {  },
                          itemSize: 34,
                        ),
                        Text('Slide accross to leave a rating',
                          style: TextStyle(
                            fontSize: getFontSize(14, context),
                            color: Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                    ),
                  ),
                    SizedBox(height: getFontSize(20, context),),

                Container(
                  height: getFontSize(49, context),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: 'Add your name here',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    style: TextStyle(
                      fontSize: getFontSize(16, context), // Font size of the input text
                    ),
                  ),
                ),
              SizedBox(height: getFontSize(20, context),),
                Container(
                  height: getFontSize(138, context),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: 'Write your review here',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    style: TextStyle(
                      fontSize: getFontSize(16, context),
                    ),
                  ),
                ),
                    SizedBox(height: getFontSize(20, context),),



                    Align(
                      alignment: Alignment.bottomCenter,
                      child:
                    ElevatedButton(
                      onPressed: () {},
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
                          'Request to be a patient',
                          style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                        ),
                      ),
                    ),
              ),
                    SizedBox(height: getFontSize(20, context),),
                ],

      ),
      )
  ]
          )
    ],
    ),
    );
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
      margin: EdgeInsets.only(right: getFontSize(7, context), top: getFontSize(15, context)),
      padding: EdgeInsets.only(top: getFontSize(12, context), left: getFontSize(29, context), bottom: getFontSize(12, context), right: getFontSize(29, context)),
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

request_to_be_a_patient(){
    return Column(
      children: [
        SvgPicture.asset('assets/image/donearrow.svg'),
        Text('Request sent to Dr. Muiz. When they agrees to be your physician, you will be notified', textAlign: TextAlign.center,),
        SizedBox(height: getFontSize(15, context),),
        SizedBox(
          width: double.infinity,
          child:
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Ok, got it',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
        ),

      ],
    );
}
}