import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(ArticlePost());
}

class ArticlePost extends StatefulWidget {
  ArticlePost({super.key});
  @override
  _ArticlePostScreen createState() => _ArticlePostScreen();
}

class _ArticlePostScreen extends  State<ArticlePost> {
  String? _selectedValue;
  List<String> pin = [];

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
              InkWell(
          onTap: () => Navigator.pop(context),
          child: 
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

              ),

              ),

                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child:
                    Center(child: Text(
                      'Articles Post',
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
            child: Column(
              children: [
              blog(name: "Rayoo Rayoo",
                time: "11:20am",
                date: "9th Sept, 2022",
                profilePath: "assets/images/profile.png",
                title: "BEST PRACTICES TO REDUCE RISK OF PROSTATE CANCER IN MEN.",
                description:
                """1.) Reduce fat intake. Eat less trans fats and saturated fats. Focus on healthy fats such as omega-3 fatty acids from nuts, seeds and fish.

2.) Avoid charred meat. Charred meat, from frying or grilling at high temperatures, may produce a chemical compound that leads to cancer....""",
                views: "23"),


                blog(name: "Rayoo Rayoo",
                time: "11:20am",
                date: "9th Sept, 2022",
                profilePath: "assets/images/profile.png",
                title: "BEST PRACTICES TO REDUCE RISK OF PROSTATE CANCER IN MEN.",
                description:
                """1.) Reduce fat intake. Eat less trans fats and saturated fats. Focus on healthy fats such as omega-3 fatty acids from nuts, seeds and fish.

2.) Avoid charred meat. Charred meat, from frying or grilling at high temperatures, may produce a chemical compound that leads to cancer....""",
                views: "23"),


                blog(name: "Rayoo Rayoo",
                time: "11:20am",
                date: "9th Sept, 2022",
                profilePath: "assets/images/profile.png",
                title: "BEST PRACTICES TO REDUCE RISK OF PROSTATE CANCER IN MEN.",
                description:
                """1.) Reduce fat intake. Eat less trans fats and saturated fats. Focus on healthy fats such as omega-3 fatty acids from nuts, seeds and fish.

2.) Avoid charred meat. Charred meat, from frying or grilling at high temperatures, may produce a chemical compound that leads to cancer....""",
                views: "23"),
          ],
            ),
            ),
    );
  }









  Widget blog({
    required String name,
    required String time,
    required String date,
    required String profilePath,
    required String title,
    required String description,
    required String views
}){
    return Container(
      margin: EdgeInsets.only(top: getFontSize(10, context)),
      child: Column(
      children: [
        Padding(padding: EdgeInsets.all(30),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(profilePath),
                  ),
                  SizedBox(width: getFontSize(10, context)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: getFontSize(14, context),
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: getFontSize(5, context)),
                        Row(
                          children: [
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: getFontSize(12, context),
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: getFontSize(10, context)),
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: getFontSize(12, context),
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
              SizedBox(height: getFontSize(16, context)),
              // Bold Title Text
              Text(
                title,
                style: TextStyle(
                  fontSize: getFontSize(16, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getFontSize(12, context)),
              Container(
                child: Text(description,
                  style: TextStyle(fontSize: getFontSize(14, context), color: Colors.black),
                ),
              ),
              SizedBox(height: getFontSize(12, context)),
             Center( child: GestureDetector(
                onTap: () {

                },
                child: Container(
                  padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFC4DCFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffC4DCFF), width: getFontSize(0.5, context)),
                ),
               child: Row(children: [
                  Text(
                    'See source link',
                    style: TextStyle(
                      fontSize: getFontSize(14, context),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: getFontSize(5, context)),
                  Icon(Icons.arrow_forward, color: Colors.blue,),
                ],),
              ),


              ),
              ),
              SizedBox(height: getFontSize(25, context)),
              SvgPicture.asset("assets/images/line.svg"),
              SizedBox(height: getFontSize(16, context)), // Space between "See More" and bottom row
              // Row with eye icon, view count, and text
              Row(
                children: [
                  Icon(Icons.remove_red_eye, size: getFontSize(23, context), color: Colors.black), // Eye icon
                  SizedBox(width: getFontSize(8, context)), // Space between icon and views count
                  Text(
                    views,
                    style: TextStyle(fontSize: getFontSize(14, context), color: Colors.black),
                  ),
                  SizedBox(width: getFontSize(4, context)),
                  Text(
                    'Views',
                    style: TextStyle(fontSize: getFontSize(14, context), color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: getFontSize(10, context),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5)
          ),
        ),
      ],
    ),
    );
}
}