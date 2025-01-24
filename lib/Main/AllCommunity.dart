import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Main/CommunityPosts.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(AllCommunity());
}

class AllCommunity extends StatefulWidget {
  AllCommunity({super.key});
  @override
  _AllCommunityScreen createState() => _AllCommunityScreen();
}

class _AllCommunityScreen extends  State<AllCommunity> {
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
                  'All communities',
                  style: TextStyle(
                      fontSize: getFontSize(20, context),
                      fontStyle: FontStyle.normal
                  ),
                ),
                ),
              ),
              Spacer(),
          GestureDetector(
           onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchCommunity()));
             create_community_popup();
           },
            child:
          Container(
            width: getFontSize(35, context),
            height: getFontSize(35, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFE5E5E5),
            ),
            child: Icon(Icons.add)
          )
          )
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
        Container(
          padding: EdgeInsets.only(right: getFontSize(10, context)),
          // width: double.infinity,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        SizedBox(height: getFontSize(20, context)),
        community(
            iconPath: 'assets/images/family.png',
          communityName: 'Diabetes patients community',
          communityMember: '15 members',
          communityLocation: 'Surulere, Lagos',
        ),
        community(
            iconPath: 'assets/images/family.png',
          communityName: 'Hypertensive patients community',
          communityMember: '20 members',
          communityLocation: 'Surulere, Lagos',
        ),
        community(
            iconPath: 'assets/images/family.png',
          communityName: 'Diabetes patients community',
          communityMember: '15 members',
          communityLocation: 'Surulere, Lagos',
        ),
        community(
            iconPath: 'assets/images/family.png',
          communityName: 'Hypertensive patients community',
          communityMember: '15 members',
          communityLocation: 'Surulere, Lagos',
        ),
      ],
    ), ),
    )));
  }

  community({
    required String iconPath,
    required String communityName,
    required String communityMember,
    required String communityLocation,
  }) {
    return Container(
      height: getFontSize(229, context),
      margin: EdgeInsets.only(bottom: getFontSize(15, context)),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
        // Container(
        // height: getFontSize(85, context),
        // // padding: EdgeInsets.all(15),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(topRight: Radius.circular(14), topLeft: Radius.circular(14)),
        //     color: Colors.blue,
        //   ),
        // ),

          Align(
            alignment: Alignment.bottomCenter,
            child:
          Container(
            alignment: Alignment.bottomCenter,
            height: getFontSize(145, context),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(14), bottomLeft: Radius.circular(14)),
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
              communityName,
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
                  communityMember,
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
                  communityLocation,
                  style: TextStyle(fontSize: getFontSize(16, context), color: Color(0xff666666)),
                ),
              ],
            )
          ],
        ),
        ),
        ),
            Column(children: [
              SizedBox(height: getFontSize(45, context),),
              Align(
                alignment: Alignment.topCenter,
                child:  SizedBox(
                  width: getFontSize(77, context),
                  height: getFontSize(77, context),
                  child:
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(iconPath),
                  ),
                ),
              ),
            ]
            ),
        ]
      )
      )
    );
  }

  create_community_popup(){
    return  showDialog(
        context: context,
        builder: (context) {
      return AlertDialog(
          content:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
      children: [
        Text('Create Community', style: TextStyle(fontSize: getFontSize(20, context)),),
        SizedBox(height: getFontSize(25, context),),
        SvgPicture.asset('assets/images/wheel.svg',),
        SizedBox(height: getFontSize(15, context),),
        Container(alignment: Alignment.center,
          width: getFontSize(195, context),
          child: Text(textAlign: TextAlign.center, 'Do you wish to create a community?'),
        ),
        SizedBox(height: getFontSize(10, context),),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> CommunityFeed()));
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
              'Yes, continue',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
        SizedBox(height: getFontSize(8, context),),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            side: BorderSide(color: Colors.blue, width: getFontSize(1, context)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
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
          )
      );
        }
    );
  }
}