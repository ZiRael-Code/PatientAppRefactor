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
  Dashboard({super.key,
    required this.onItemTapped});

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
        color: Colors.blue,
      ),
      'text': "You have a new message from Alexander..."
    },
    {
      'icon': Icon(
        Icons.local_pharmacy,
        color: Colors.blue,
      ),
      'text': 'Your malaria drugs have been exhausted',
    },
    {
      'icon': Icon(Icons.devices, color: Colors.blue),
      'text': 'Your device is ready for pickup',
    },
  ];
  @override
  Widget  build(BuildContext context) {

    getFontSize(double d) {
    return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
  }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
                    backgroundImage: AssetImage('assets/images/dr.png'),
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
                  "Sanni Muiz",
                  style: TextStyle(
                    fontSize: getFontSize(26.0, ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            // GestureDetector(child: SvgPicture.asset('ass')
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder:
              //       (context) => Community()));
              // },
            // ),
            SizedBox(
              width: getFontSize(10, ),
            ),
           InkWell(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Community()));
             },
             child: Icon(Icons.supervisor_account, color: Colors.black, size: (29),
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
                  iconPath: 'assets/images/icons/dashboard/electric.png',
                  iconBackground: Color(0xFFFF618F),
                  actionBackground: Color(0xFFF5CFDD),
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
                  iconPath: 'assets/images/icons/dashboard/device.png',
                  iconBackground: Color(0xFFA64FFE),
                  actionBackground: Color(0xFFD3B6E8),
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
          style: TextStyle(fontSize: getFontSize(20),
              color: Colors.black,
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
            themeColor: Color(0xFFFF618F),
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

                SizedBox(width: getFontSize(25),),

                Align(
            alignment: Alignment.centerLeft,
            child:
          vital(
            themeColor: Colors.purple,
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
            ],),
          ),
          SizedBox(height: getFontSize(15),),
          SvgPicture.asset('assets/images/scroller.svg',
          width: MediaQuery.of(context).size.width,
          )
          ,SizedBox(height: getFontSize(15),),
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
        color: Colors.black.withOpacity(0.1),
      width: getFontSize(1.0, context),
    ),
        ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFFE2EDFF),
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
                    color: Colors.white,
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
                        BoxDecoration(shape: BoxShape.circle, color: Color(0xffE2EDFF)),
                        child: icon,
                      ),
                      SizedBox(width: w * 0.04,),
                      Align(
                        child:
                        Container(
                          alignment: Alignment.centerLeft,
                          width: textContSize,
                          child: AutoSizeText(text,
                              style: TextStyle(fontSize: getFontSize(16.0, context)* MediaQuery.of(context).textScaleFactor, color: Colors.black45),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue),
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
                  child: Image.asset(
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
    return GestureDetector(
        onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> VitalsReading()));
    },
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
                color: Colors.white,
              ),
              ),
              alignment: Alignment.centerLeft,
                ),
              SizedBox(height: getFontSize(5, context),),
            Align(child:
            Text(dateAdded, style: TextStyle(
              fontSize: getFontSize(12.0, context),
              color: Colors.white,
            )),
              alignment: Alignment.centerLeft,
            ),
              SizedBox(height: getFontSize(5, context),),
            Align(child:
               Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
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
                        color: Colors.white,
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