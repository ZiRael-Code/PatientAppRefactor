import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(CommunityPostComment());
}

class CommunityPostComment extends StatefulWidget {
  CommunityPostComment({super.key});
  @override
  _CommunityPostCommentScreen createState() => _CommunityPostCommentScreen();
}

class _CommunityPostCommentScreen extends  State<CommunityPostComment> {
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
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
                  'Community Post',
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
          color: Colors.white,
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: getFontSize(30, context)),
          Container(
            margin: EdgeInsets.only(bottom: getFontSize(15, context)),

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
                        backgroundImage: AssetImage('assets/images/doc1.png'),
                      ),
                    ),
                    SizedBox(width: getFontSize(10, context),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rayoo Rayoo", style: TextStyle(fontSize: getFontSize(14, context)),),
                        Text("11:20am"+" . "+"9th Sept 2022", style: TextStyle(color: Colors.black45))
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_vert, color: Colors.black,)
                  ],
                ),
                SizedBox(height: getFontSize(20, context),),
                Container(
                  width: getFontSize(285, context),
                  child: Text('Is vomiting and stooling a symptom of diarrhea? Please an answer is needed as soon as possible.', style: TextStyle(fontSize: getFontSize(16, context))),
                ),
                SizedBox(height: getFontSize(20, context),),
                SvgPicture.asset('assets/images/line.svg'),
                SizedBox(height: getFontSize(10, context),),
                Row(
                  children: [
                    Text('All comments', style: TextStyle(fontSize: getFontSize(18, context))),
                    Spacer(),
                    Icon(Icons.comment, color: Colors.black54,),
                    SizedBox(width: getFontSize(5, context),),
                    Text('15'+" comments", style: TextStyle(color: Colors.black54)),
                  ],
                ),
                comment(
                  profilePath: "assets/images/doc2.png",
                  name: "John Edifor",
                  context: context,
                  comment: "I do not think that is quite valid if I may say. You should seek medical advice from verified specialists"
                )

              ],
            ),
          )
      ],
    ),
    )));
  }

  comment({
    required String profilePath,
    required String name,
    required String comment,
    required BuildContext context
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: getFontSize(25, context)),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child:
          SizedBox(
            width: getFontSize(42, context),
            height: getFontSize(42, context),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/doc1.png'),
            ),
          ),
          ),

                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset('assets/images/replyicon.svg'),
                ),
                Container(
                  width: getFontSize(238, context) ,
                  child: Column(
                    children: [
                  Container(
                  padding: EdgeInsets.all(12),
                  width: screenWidth * 0.668 ,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: getFontSize(14, context)),),
                     SizedBox(height: getFontSize(7, context),),
                     Container(
                        width: getFontSize(240, context),
                       child:
                         Text(comment, style: TextStyle(fontSize: getFontSize(12, context), color: Colors.black54),)

                     )
                    ],
                  ),
                  ),
                      SizedBox(height: getFontSize(12, context)),
                      Row(
                        children: [
                          Icon(Icons.reply, color: Colors.blue,),
                          SizedBox(width: getFontSize(5, context),),
                          Text('Reply', style: TextStyle(fontSize: getFontSize(12, context), color: Colors.blue,))
                        ],
                      )
                  ]
                     )
                )
              ],
      ),
    );
  }
}