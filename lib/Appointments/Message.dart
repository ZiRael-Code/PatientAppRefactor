import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/Chat.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(Message());
}

class Message extends StatefulWidget {
  Message({super.key});
  @override
  _MessageScreen createState() => _MessageScreen();
}

class _MessageScreen extends  State<Message> {
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
                  'Message',
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
        Container(
          padding: EdgeInsets.only(right: getFontSize(10, context)),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Specialist',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        SizedBox(height: getFontSize(35, context)),

       message(
         profile: 'assets/images/doc1.png',
         isActive: true,
         name: 'Dr. Nelson Yang',
         message: 'Hi, I need help with my appointment. Please provide me with the necessary details.',
         time: '5min',
         unReadSms: "1",
       ),

      message(
       profile: 'assets/images/doc.png',
       isActive: false,
       name: 'Dr. Nelson Yang',
       message: 'Hi, I need help with my appointment. Please provide me with the necessary details.',
       time: '5min',
       unReadSms: "",
     ),
        message(
          profile: 'assets/images/doc1.png',
          isActive: true,
          name: 'Dr. Nelson Yang',
          message: 'Hi, I need help with my appointment. Please provide me with the necessary details.',
          time: '5min',
          unReadSms: "2",
        ),
        message(
          profile: 'assets/images/doc.png',
          isActive: false,
          name: 'Dr. Nelson Yang',
          message: 'Hi, I need help with my appointment. Please provide me with the necessary details.',
          time: '9min',
          unReadSms: "",
        ),
      ],
    ),
    ))));
  }

  message({
    required String profile,
    required bool isActive,
    required String name,
    required String message,
    required String time,
    required String unReadSms,
  }) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Chat()));
      },
        child: Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                // Profile Picture with Green Dot (Online Indicator)
                Container(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: getFontSize(49, context),
                        height: getFontSize(49, context),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(profile),
                        ),
                      ),
                      Positioned(
                        bottom: getFontSize(0, context), // Moves to the bottom
                        right: getFontSize(0, context),  // Moves to the right
                        child: Container(
                          width: getFontSize(14, context),
                          height: getFontSize(14, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isActive ? Colors.green : Colors.transparent,
                            border: Border.all(
                              color: isActive ? Colors.white : Colors.transparent,
                              width: getFontSize(2, context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: getFontSize(10, context)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: getFontSize(18, context))),
                    SizedBox(height: getFontSize(3, context)),
                    Container(
                      width: getFontSize(214, context),
                      child: Text(
                        "After taking the prescribed medications I started noticing some changes",
                        style: TextStyle(fontSize: getFontSize(13, context)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            unReadSms.toString().isEmpty ?
                Container(
                    alignment: Alignment.topRight,
                    child:
                Text(time, style: TextStyle(color: Color(0xff2E2E42)),))
            :
            Positioned(
              top: getFontSize(0, context),
              right: getFontSize(0, context),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Text(
                  unReadSms.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: getFontSize(15, context)),
        SvgPicture.asset('assets/images/line.svg'),
        SizedBox(height: getFontSize(20, context)),
      ],
    )
    );
  }

}