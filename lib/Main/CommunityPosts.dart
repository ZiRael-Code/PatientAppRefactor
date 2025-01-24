import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Main/CommunityPostComment.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(CommunityFeed());
}

class CommunityFeed extends StatefulWidget {
  CommunityFeed({super.key});
  @override
  _CommunityPostsScreen createState() => _CommunityPostsScreen();
}

class _CommunityPostsScreen extends  State<CommunityFeed> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              Container(
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFFFFFFF).withOpacity(0.15),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),
                color: Colors.white,),
              ),
              Spacer(),
          Container(
            width: getFontSize(35, context),
            height: getFontSize(35, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFFFFFFF).withOpacity(0.15),
            ),
            child: Icon(Icons.more_vert, color: Colors.white,)
          ),

            ],
          ),
          centerTitle: true,
        ),
        body:
        Container(
          decoration: BoxDecoration(color: Colors.white),
            // padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
        Align(
          child:
      Column(
      children: [

        Stack(
          children: [
            Container(
              width: double.infinity,
              height: getFontSize(120, context),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: getFontSize(25, context), right: getFontSize(25, context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Stack(
                    children: [

                      Align(
                        alignment: Alignment.bottomCenter,
                        child:
                        Container(
                          margin: EdgeInsets.only(top: getFontSize(50, context)),
                          alignment: Alignment.bottomCenter,
                          height: getFontSize(145, context),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(width: getFontSize(0.1, context)),
                            color: Colors.white,
                        ),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: getFontSize(30, context),),

                              SizedBox(height: getFontSize(10, context)),
                              Text(
                                'Diabetes patients community',
                                style: TextStyle(fontSize: getFontSize(18, context), color: Color(0xff2E2E42)),
                              ),
                              SizedBox(height: getFontSize(10, context)),
                              Row(
                                children: [
                                  Container(
                                    width: getFontSize(30, context),
                                    height: getFontSize(30, context),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xffE2EDFF)
                                    ),
                                    child: Icon(Icons.person, color: Colors.blue),
                                  ),
                                  SizedBox(width: getFontSize(7, context),),
                                  Text(
                                    '15 members',
                                    style: TextStyle(fontSize: getFontSize(16, context), color: Color(0xff666666)),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset('assets/images/linev.svg'),
                                  Spacer(),
                                  Container(
                                    width: getFontSize(30, context),
                                    height: getFontSize(30, context),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xffE2EDFF)
                                    ),
                                    child: Icon(Icons.location_pin, color: Colors.blue),
                                  ),
                                  SizedBox(width: getFontSize(7, context),),
                                  Text(
                                    'surulere lagos',
                                    style: TextStyle(fontSize: getFontSize(16, context), color: Color(0xff666666)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(children: [
                        // SizedBox(height: getFontSize(45, context),),
                        Align(
                          alignment: Alignment.topCenter,
                          child:  SizedBox(
                            width: getFontSize(77, context),
                            height: getFontSize(77, context),
                            child:
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/family.png'),
                            ),
                          ),
                        ),
                      ]
                      ),
                    ]
                )
            )
          ],
        ),

            SizedBox(height: getFontSize(20, context),),
          Container(
            padding: EdgeInsets.all(12),
         child:  Row(
        children: [
        // Left Text: "Community Feed" (Bold, Size 18)
        Text(
        'Community Feed',
          style: TextStyle(
            fontSize: getFontSize(18, context),
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(), // Adds space between the two texts
        // Right Text: "Post something" (Blue, Size 14)
        Text(
          'Post something',
          style: TextStyle(
            fontSize: getFontSize(14, context),
            color: Colors.blue,
          ),
        ),
          ],
        ),
        ),
        SizedBox(height: getFontSize(20, context),),


            Expanded(child:
            SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
        Container(
          padding: EdgeInsets.all(3),
          child: 
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xffe5e5e5),
            border: Border.all(width: getFontSize(1, context), color: Color(0xffe5e5e5))
          ),
          child: Column(
            children: [

              post(
                iconPath: "assets/images/doc1.png",
                name: "Rayoo Rayoo",
                time: "11:20am",
                date: "9th Sept 2022",
                post: "Is vomiting and stooling a symptom of diarrhea? Please an answer is needed as soon as possible.",
                comments: "15"
              ),

              post(
                iconPath: "assets/images/doc1.png",
                name: "Rayoo Rayoo",
                time: "11:20am",
                date: "9th Sept 2022",
                post: "Is vomiting and stooling a symptom of diarrhea? Please an answer is needed as soon as possible.",
                comments: "15"
              ),

              post(
                iconPath: "assets/images/doc1.png",
                name: "Rayoo Rayoo",
                time: "11:20am",
                date: "9th Sept 2022",
                post: "Is vomiting and stooling a symptom of diarrhea? Please an answer is needed as soon as possible.",
                comments: "15"
              ),

            ],
          ),
          ),
          ),
      )
      )
          ]
        )

    ))));
  }

  post({
    required String iconPath,
    required String name,
    required String time,
    required String date,
    required String post,
    required String comments
  }) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> CommunityPostComment()));
      },
        child: Container(
      margin: EdgeInsets.only(bottom: getFontSize(15, context)),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
              width: getFontSize(42, context),
              height: getFontSize(42, context),
            child: CircleAvatar(
                radius: 50,
              backgroundImage: AssetImage(iconPath),
              ),
              ),
              SizedBox(width: getFontSize(10, context),),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: getFontSize(14, context)),),
                  Text(time+" . "+date, style: TextStyle(color: Colors.black45))
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert, color: Colors.black,)
            ],
          ),
          SizedBox(height: getFontSize(20, context),),
          Container(
            width: getFontSize(285, context),
            child: Text(post, style: TextStyle(fontSize: getFontSize(16, context))),
          ),
          SizedBox(height: getFontSize(20, context),),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(10, context),),
          Row(
            children: [
              Icon(Icons.comment, color: Colors.black,),
              SizedBox(width: getFontSize(5, context),),
              Text(comments+" comments", style: TextStyle(color: Colors.black)),
            ],
          )
        ],
      ),
      ),
    );
  }
}