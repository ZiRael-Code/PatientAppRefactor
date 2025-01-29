import 'dart:convert';

import 'package:flutter_app/Login.dart';
import 'package:flutter_app/MainManvigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/colors/colours.dart';
 
import '../Main/Dashboard.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Capture/VitalsReading.dart';
import 'package:flutter_app/Main/Community.dart';
import 'package:flutter_app/Medication/TakeAQuickCheckup.dart';
import 'package:flutter_app/Notifications.dart';
import 'package:flutter_app/QuickCheckup.dart';
import 'package:flutter_app/RequestNewDevice.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget{
  final void Function(int index) onItemTapped;
  late final Map<String, dynamic> user;
  Dashboard({super.key,
    required this.onItemTapped, required this.user});

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  bool isCollaps = false;
  late int reverseIndex = show_notification.length -1;
  List<Map<String, dynamic>> show_notification = [
    {
      'icon': Icon(
        Icons.message,
        color: AppColors.blue[700],
      ),
      'text': "You have a new message from Alexander..."
    },
    {
      'icon': Icon(
        Icons.local_pharmacy,
        color: AppColors.blue[700],
      ),
      'text': 'Your malaria drugs have been exhausted',
    },
    {
      'icon': Icon(Icons.devices, color: AppColors.blue[700]),
      'text': 'Your device is ready for pickup',
    },
  ];
  late Map<String, dynamic> user;

  @override
  void initState() {
    // TODO: implement initState
    user = widget.user;
    super.initState();
  }
  List<String> sliderTxt = ["An apple a day keeps the doctor away", "Hello world", "biscuit bone"];
  int sIndex = 0;
  @override
  Widget  build(BuildContext context) {

    getFontSize(double d) {
    return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
  }
    return Scaffold(
      backgroundColor: AppColors.gray[100],
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: AppColors.gray[100],
        title: Row(
          children: [
            SizedBox(
              width: getFontSize(50.0, ),
              height: getFontSize(50.0,),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.onItemTapped(4);
                    });
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:  AssetImage('assets/images/default_avatar.png'),
                  )),
            ),
            SizedBox(width: ( 12.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning",
                  style: TextStyle(
                    fontSize: (16),
                  ),
                ),
                Text(
                  "${user["first_name"]} ${user["last_name"]}",

                  style: TextStyle(
                    fontSize: getFontSize(26.0, ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: getFontSize(10, ),
            ),
           InkWell(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Community()));
             },
             child: Icon(Icons.supervisor_account, color: AppColors.gray[700], size: (29),
             )),
            SizedBox(width: getFontSize(10, ),),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Notifications()));
              },
              child:
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/images/notification.svg',
                  fit: BoxFit.contain,
                ),
                // onTap: (){
                //   Navigator.push(context, MaterialPageRoute(builder:
                //       (context) => Notifications()));
                // },
              ),
            ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
      padding: EdgeInsets.only(left: getFontSize(16.0), right: getFontSize(16.0,), top: getFontSize(22.0, )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> TakeAQuickCheckup()));
      },
                child:
              quickAction(
                  iconPath: 'assets/images/speed.svg',
                  iconBackground: AppColors.pink[700],
                  actionBackground: AppColors.pink[700].withOpacity(0.20),
                  actionText: 'Take a quick checkup'
              ),
              ),
              Spacer(),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> RequestNewDevice()));
        },
        child:
              quickAction(
                  iconPath: 'assets/images/computer.svg',
                  iconBackground: Color(0xFFA64FFE),
                  actionBackground: Color(0xFFA64FFE).withOpacity(0.20),
                  actionText: 'Request a device'
              ),
              ),
              SizedBox(height: getFontSize(10))
            ],
          ),
        SizedBox(height: getFontSize(25),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:
                isCollaps ? buildNotificationList(Stack(children: []))
                    : buildNotificationList(Column(children: [])),)
            ],
          ),
          SizedBox(height: getFontSize(20)),
          Row(
            children: [
              Text("Vitals readings",
          style: TextStyle(fontSize: getFontSize(18),
              color: AppColors.gray[700],
              fontWeight: FontWeight.bold),),
              Spacer(),
              ElevatedButton(
                  onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> VitalsReading()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent

                  ),
                child: Text('See history',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getFontSize(14),
                  color: Color(0xFF3C8AFF),
                ),
                ),
              ),
            ],
          ),
          SizedBox(height: getFontSize(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
            Align(
            alignment: Alignment.centerLeft,
            child:
          vital(
            themeColor: AppColors.pink[700],
            vitalIcon: 'assets/images/hearth2.svg',
            vitalRead: '77',
            subcriptOrnot: 'bpm',
            isSubscript: true,
            vitalType: 'Heart rate (ECG)',
            dateAdded: 'Measured 10mins ago',
            vitalsReadMessage: 'NORMAL',
            emoji: 'assets/images/smily.svg'
          ),
          ),



                Align(
            alignment: Alignment.centerLeft,
            child:
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> VitalsReading()));
        },
        child:
          vital(
            themeColor: Color(0xffA64FFE),
            vitalIcon: 'assets/images/presure.svg',
            vitalRead: '90/60',
            subcriptOrnot: 'mmHg',
            isSubscript: true,
            vitalType: 'Blood pressure',
            dateAdded: '5 days ago',
            vitalsReadMessage: 'ABNORMAL',
            emoji: 'assets/images/smily.svg'
          ),
          ),
          ),

        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> VitalsReading()));
          },
          child:
            vital(
            themeColor: Color(0xff2C68BF),
            vitalIcon: 'assets/images/oxy.svg',
            vitalRead: '95%',
            subcriptOrnot: '',
            isSubscript: true,
            vitalType: 'Oxygen Saturation',
            dateAdded: '2 days ago',
            vitalsReadMessage: 'ABNORMAL',
            emoji: 'assets/images/smily.svg'
          ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> VitalsReading()));
            },
            child:
            vital(
            themeColor: Color(0xffFF6161),
            vitalIcon: 'assets/images/hrv.svg',
            vitalRead: '50',
            subcriptOrnot: 'milliseconds',
            isSubscript: true,
            vitalType: 'Stress (HRV rate)',
            dateAdded: 'Measured 10mins ago',
            vitalsReadMessage: 'ABNORMAL',
            emoji: 'assets/images/smily.svg'
          ),
          ),
            ],),
          ),
          SizedBox(height: getFontSize(15),),
          Container(
            padding: EdgeInsets.all(14),
            height: 145,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blue[700],
              borderRadius: BorderRadius.circular(14)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (sIndex > 0) {
                              sIndex--;
                            } else {
                              sIndex = 3;
                            }
                          });

                        },
                        child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: getFontSize(14)),)
                  ),
                    Spacer(),
                    Text(sliderTxt[sIndex],
                      style: TextStyle(
                        fontSize: getFontSize(16),
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray[100],
                      ),
                    ),

                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            sIndex = (sIndex + 1) % 4;
                          });

                        },
                        child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: getFontSize(14)),)
                    )

                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                     SvgPicture.asset('assets/images/s1.svg', color: sIndex == 0 ? AppColors.gray[100] : AppColors.gray[400]),
                     SvgPicture.asset('assets/images/s2.svg',width: 40, color: sIndex == 0 ? AppColors.gray[100] : AppColors.gray[400]),
                     SvgPicture.asset('assets/images/s3.svg',width: 25, height: 2, color: sIndex == 0 ? AppColors.gray[100] : AppColors.gray[400]),
                    Spacer(),

                  ],
                )
              ],
            ),
          ),
          SizedBox(height: getFontSize(15),),
        ],
      ),
      ),
    );
  }

  notifications({
    required String imagePath,
    required BuildContext context,
    required String text}) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: getFontSize(74, context),
        padding: EdgeInsets.only(top: getFontSize(12, context), left: getFontSize(10.0, context), bottom: getFontSize(12, context), right: getFontSize(10, context)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
        color: AppColors.gray[700].withOpacity(0.1),
      width: getFontSize(1.0, context),
    ),
        ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.blue["600"],
            ),
            width: getFontSize(35, context),
            height: getFontSize(35, context),
            child: Center(
              child: SvgPicture.asset(imagePath),
            ),

          ),
          SizedBox(width: getFontSize(10, context)),
          Text(text,
          style: TextStyle(
            fontSize: getFontSize(14, context),
          ),
          ),
          Spacer(),
          SvgPicture.asset('assets/images/forwardIcon.svg'),
        ],
      ),
      margin: EdgeInsets.only(bottom: getFontSize(10, context)),
    );
  }

  Widget buildNotificationList(Widget layout) {
    int reverseIndex = show_notification.length - 1;

    List<Widget> notificationWidgets = List.generate(
      show_notification.length,
          (index) {
        Map<String, dynamic> nots = show_notification[index];
        return Center(child:  notification(
          nots['icon'],
          nots['text'],
          reverseIndex-- ,
        )
        );
      },
    );

    if (layout is Stack) {
      return Stack(children: notificationWidgets);
    } else if (layout is Column) {
      return Column(children: notificationWidgets);
    } else {
      return SizedBox();
    }
  }

  notification(Icon icon, String text,
      int index) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    double textContSize = isCollaps ? index == 0 ?
    w * 0.60
        : index == 1
        ? w * 0.55
        : index == 2
        ? w * 0.48
        : double.infinity

        : w * 0.6
    ;

    return GestureDetector(
        onTap: (){
          setState(() {
            isCollaps = !isCollaps;
          });
        },
        child: SizedBox(
          // height: getFontSize(150, context),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: isCollaps ?
                index == 0 ? h * 0.0
                    : index == 1
                    ? h * 0.020
                    : index == 2
                    ? h * 0.040
                    : 0
                    : 0,),

                Container(
                  alignment: Alignment.center,
                  width: isCollaps ?  index == 0 ?
                  double.infinity
                      : index == 1
                      ? w * 0.85
                      : index == 2
                      ? w * 0.78
                      : double.infinity

                      : double.infinity,
                  margin: EdgeInsets.only(bottom: getFontSize(10, context),),
                  padding: EdgeInsets.only(top: getFontSize(19, context), bottom: getFontSize(19, context), left: getFontSize(12, context), right: getFontSize(12, context)),
                  decoration: BoxDecoration(
                    color: AppColors.gray[100],
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration:
                        BoxDecoration(shape: BoxShape.circle, color: AppColors.blue[600]),
                        child: icon,
                      ),
                      SizedBox(width: w * 0.04,),
                      Align(
                        child:
                        Container(
                          alignment: Alignment.centerLeft,
                          width: textContSize,
                          child: AutoSizeText(text,
                              style: TextStyle(fontSize: getFontSize(16.0, context)* MediaQuery.of(context).textScaleFactor, color: AppColors.gray[700]),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.blue[700]),
                      )

                    ],
                  ),

                ),
              ]
          ),
        )
    );
  }

  Widget quickAction({
    required String iconPath,
    required Color iconBackground,
    required Color actionBackground,
    required String actionText,
  }){
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - getFontSize(24, context) ,
      padding: EdgeInsets.only(top: getFontSize(12, context), left: getFontSize(10.0, context), bottom: getFontSize(12, context), right: getFontSize(10, context)),
      decoration: BoxDecoration(
        color: iconBackground.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(getFontSize(8, context)),
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: getFontSize(16, context),
                    height: getFontSize(16, context),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(width: getFontSize(10.0, context)),
            Text(actionText,
              style: TextStyle(
                  fontSize: getFontSize(11.0, context),
                  color: iconBackground
              ),),
          ],
        ),
      ),
    );
  }

  vital({
    required Color themeColor,
    required String vitalIcon,
    required String vitalRead,
    required String subcriptOrnot,
    required bool isSubscript,
    required String vitalType,
    required String dateAdded,
    required vitalsReadMessage,
    required emoji,
  }) {
    return  Container(
        margin: EdgeInsets.only(right: getFontSize(25, context)),
        child: Stack(
      children: [
        Positioned(
          top: 10,
          right: 10,
      child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getFontSize(12, context)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeColor
            ),
            child: Center(child: SvgPicture.asset(vitalIcon,
            width: getFontSize(34, context),
            height: getFontSize(34, context)
            ),
            ),
          ),
        ),
        ),
      Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getFontSize(12, context)),
        border: Border.all(
          color: themeColor.withOpacity(0.1),
          width: getFontSize(1.5, context),
        ),
      ),
      height: getFontSize(275, context),
      width: getFontSize(208, context),
      margin: EdgeInsets.only(bottom: getFontSize(10, context)),
      child:
      Stack(
        children: [
          Positioned(
        child: SvgPicture.asset('assets/images/vital.svg', color: themeColor,
        width: getFontSize(208, context),
          height: getFontSize(118, context),
        ),
            bottom: 0,
      ),
      Container(
        padding: EdgeInsets.only(left: getFontSize(15, context),right: getFontSize(15, context), top: getFontSize(15, context)),
        child: Column(
            children: [
              SizedBox(height: getFontSize(59, context),),
            Row(
              children: [
                Text(vitalRead,
                  style: TextStyle(
                    fontSize: getFontSize(50.0, context),
                    fontWeight: FontWeight.bold,
                    color: themeColor,
                  ),),

                if (isSubscript)
                  Text(subcriptOrnot,
                    style: TextStyle(
                      fontSize: getFontSize(11.0, context),
                      color: themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                else
                  Text(subcriptOrnot,
                    style: TextStyle(
                      fontSize: getFontSize(16.0, context),
                      color: themeColor,
                    ),
                  ),
              ],
            ),
            SizedBox(height: getFontSize(40, context),),

            Align(child: Text(vitalType,
              style: TextStyle(
                fontSize: getFontSize(19.0, context),
                color: AppColors.gray[100],
              ),
              ),
              alignment: Alignment.centerLeft,
                ),
              SizedBox(height: getFontSize(5, context),),
            Align(child:
            Text(dateAdded, style: TextStyle(
              fontSize: getFontSize(12.0, context),
              color: AppColors.gray[100],
            )),
              alignment: Alignment.centerLeft,
            ),
              SizedBox(height: getFontSize(5, context),),
            Align(child:
               Container(
                decoration: BoxDecoration(
                    color: AppColors.gray[100].withOpacity(0.20),
                    borderRadius: BorderRadius.circular(18)
                ),
                padding: EdgeInsets.only(left: getFontSize(10, context), top: getFontSize(10, context), right: getFontSize(20, context), bottom: getFontSize(10, context)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(emoji,
                    width: getFontSize(16, context),
                      height: getFontSize(16, context),
                    ),
                    SizedBox(width: getFontSize(5, context),),
                    Text(vitalsReadMessage,
                      style: TextStyle(
                        color: AppColors.gray[100],
                        fontSize: getFontSize(12.0, context),
                      ),
                    )
                  ],
                ),
              ),
              alignment: Alignment.centerLeft,
            ),





          ],),
    )

          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/backgroundVitals.png')
          //     ),
          //     color: themeColor
          //   ),
          //   child: Column(
          //     children: [
          //
          //

          //   ],
          // ),
          // ),



          ],)



      // margin: EdgeInsets.only(bottom: getFontSize(20, context)),
    ),
    ],
    )
    );

  }

}
getFontSize(double d, BuildContext context) {
  return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
}