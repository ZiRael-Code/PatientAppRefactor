import '../Main/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Main/MeasureVitalsManuallyMenu.dart';
import 'package:flutter_app/MeasureBloodPresure.dart';
import 'package:flutter_app/MeasureHearthRate.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(VitalsReading());


class VitalsReading extends StatefulWidget {
  @override
  _VitalsReadingState createState() => _VitalsReadingState();
}

class _VitalsReadingState extends State<VitalsReading>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Row(children: [
          Container(
          width: getFontSize(35, context),
          height: getFontSize(35, context),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            shape: BoxShape.circle,
          ),
          child: InkWell(child: Icon(Icons.home_outlined, color: Colors.white),
          onTap: (){
            Navigator.pop(context);
          },
          ),
        ),
        Spacer(),
        Text('Vital Readings', style: TextStyle(color: Colors.white)),
          Spacer(),
          Container(
            width: getFontSize(35, context),
            height: getFontSize(35, context),
            decoration: BoxDecoration(
              color: Colors.blue[200],
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(Icons.share, color: Colors.white)),
          ),
        ],
      ),



        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            _buildTabButton('Take Readings'),
            _buildTabButton('History'),
            _buildTabButton('Devices'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTakeReadingsContent(),
          _buildHistoryContent(),
          _buildDevicesContent(),
        ],
      ),
    );
  }
  Widget _buildTabButton(String text) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTakeReadingsContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textFormat(
              text1: "Measure Readings",
              text2: 'Select what vitals you want to measure',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  vital(
                    themeColor: Color(0xFFFF618F),
                    vitalIcon: 'assets/images/hearth.svg',
                    vitalRead: '77',
                    subcriptOrnot: 'bpm',
                    isSubscript: true,
                    vitalType: 'Heart rate (ECG)',
                    dateAdded: 'Measured 10mins ago',
                    vitalsReadMessage: 'NORMAL',
                  ),
                  vital(
                    themeColor: Colors.purple,
                    vitalIcon: 'assets/images/bloodpressure.svg',
                    vitalRead: '90/60',
                    subcriptOrnot: 'mmHg',
                    isSubscript: true,
                    vitalType: 'Blood pressure',
                    dateAdded: '5 days ago',
                    vitalsReadMessage: 'ABNORMAL',
                  ),
                  vital(
                    themeColor: Colors.deepOrange,
                    vitalIcon: 'assets/images/tunder.svg',
                    vitalRead: '77',
                    subcriptOrnot: 'bpm',
                    isSubscript: true,
                    vitalType: 'Heart rate (ECG)',
                    dateAdded: 'Measured 10mins ago',
                    vitalsReadMessage: 'NORMAL',
                  ),
                  vital(
                    themeColor: Color(0xFF2C68BF),
                    vitalIcon: 'assets/images/02.svg',
                    vitalRead: '95%',
                    subcriptOrnot: ' ',
                    isSubscript: false,
                    vitalType: 'Oxygen saturation',
                    dateAdded: '5 days ago',
                    vitalsReadMessage: 'ABNORMAL',
                  ),


                ],
              ),
            ),
            SizedBox(height: getFontSize(20, context)),
            Text(
              "If you don't have the device, you can still measure by clicking the button below",
              style: TextStyle(fontSize: getFontSize(18, context)),
            ),
            SizedBox(height: getFontSize(20, context)),
            GestureDetector(
              onTap: (){
                // Navigate to the details page
                Navigator.push(context, MaterialPageRoute(builder: (context) => MeasureVitalsManuallyMenu()));
              },
              child: _buildActionButton('Capture Manually', Colors.blue, Colors.white)
            ),
            SizedBox(height: getFontSize(10, context)),
            _buildActionButton('Request for the Device', Colors.transparent, Colors.blue, hasBorder: true),
            SizedBox(height: getFontSize(20, context)),
          ],
        ),
      ),
    );
  }


  Widget _buildHistoryContent() {
    return SingleChildScrollView(  // Add SingleChildScrollView here
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: getFontSize(30, context),),

            // Text Format Section
            textFormat(
              text1: "Measure Readings",
              text2: 'Select what vitals you want to measure',
            ),

            SizedBox(height: getFontSize(20, context),),

            // Wrap for icons and readings
            Wrap(
              direction: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the details page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MeasureHearthRate()));
      },
                  child:
                readingHistory(
                  icon: "assets/images/hearth2.svg",
                  themeColor: Color(0xFFFF618F),
                  name: "Heart rate",
                ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the details page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MeasureBloodPresure()));
                  },
                  child: readingHistory(
                  icon: "assets/images/presure.svg",
                  themeColor: Color(0xFFA64FFE),
                  name: "Blood pressure",
                ),
                ),
                readingHistory(
                  icon: "assets/images/oxy.svg",
                  themeColor: Color(0xFF2C68BF),
                  name: "Oxygen saturation",
                ),

                readingHistory(
                  icon: "assets/images/st.svg",
                  themeColor: Color(0xFFFF6161),
                  name: "Stress level",
                ),
                readingHistory(
                  icon: "assets/images/bg.svg",
                  themeColor: Color(0xFF3C8AFF),
                  name: "Blood glucose",
                ),
                readingHistory(
                  icon: "assets/images/bt.svg",
                  themeColor: Color(0xFFFF8E3C),
                  name: "Body Temperature",
                ),
              ],
            ),

            SizedBox(height: getFontSize(15, context),),

            // Readings History Header
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Readings History',
                style: TextStyle(
                  fontSize: getFontSize(18, context),        // Font size 18
                  fontWeight: FontWeight.bold,  // Bold text
                ),
              ),
            ),

            SizedBox(height: getFontSize(10, context),),

            // Reading History List
            reading_history(
              mmhg: "107/60",
              bpm: "67",
              date: "Today, 12:00 am",
              bulletColor: Colors.lightGreenAccent,
            ),
            SizedBox(height: getFontSize(10, context),),
            reading_history(
              mmhg: "125/60",
              bpm: "88",
              date: "14 Jul 2022. 12:00 am",
              bulletColor: Color(0xFFFAB400),
            ),
            SizedBox(height: getFontSize(10, context),),

            irregular_reading_history(
                date: "14 Jul 2022 . 12:00 am",
                text: "Irregular ECG",
                stackColor:  Color(0xFFFAB400)
            ),
            SizedBox(height: getFontSize(10, context),),
            reading_history(
              mmhg: "125/68",
              bpm: "88",
              date: "14 Jul 2022 . 12:00 am",
              bulletColor: Color(0xFFFF6161),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDevicesContent() {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(12),
        child: Column(children: [
          textFormat(
            text1: "Devices",
            text2: 'View history of any vitals by directly tapping on their icons.',
          ),
          SizedBox(height: getFontSize(20, context),),
        Wrap(children: [
          devices(
            name: "BP2 Connect",
            imagePath: "assets/images/dev.svg"
          ),
          SizedBox(width: getFontSize(20, context),),
          devices(
            name: "Device 2",
            imagePath: "assets/images/dev.svg"
          ),
          devices(
            name: "Device 3",
            imagePath: "assets/images/dev.svg"
          ),
          SizedBox(width: getFontSize(20, context),),
          Column(
              children: [
                Container(
                  width: getFontSize(73, context),
                  height: getFontSize(73, context),
                  decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.add, color: Colors.blue, size: getFontSize(32, context),),
                ),
                Text('Order for a new device')
              ]
          )
],)
        ],),

      ),
    );
  }

  Widget _buildActionButton(String text, Color backgroundColor, Color textColor,
      {bool hasBorder = false}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: hasBorder ? Border.all(color: Colors.blue) : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: getFontSize(16, context),
            fontWeight: FontWeight.bold,
          ),
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
  }) {
    return Container(
      margin: EdgeInsets.only(right: getFontSize(3, context)),
      child: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: themeColor.withOpacity(0.1),
                width: getFontSize(1.5, context),
              ),
            ),
            height: getFontSize(186, context),
            width: getFontSize(156, context),
            margin: EdgeInsets.only(bottom: getFontSize(10, context)),
            child:
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: SvgPicture.asset('assets/images/vt.svg', color: themeColor,),
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: getFontSize(15, context),right: getFontSize(15, context), top: getFontSize(15, context)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: getFontSize(45, context),
                          height: getFontSize(45, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: themeColor
                          ),
                          child: Center(child: SvgPicture.asset(vitalIcon)),
                        ),
                      ),

                      Row(
                        children: [
                          Text(vitalRead,
                            style: TextStyle(
                              fontSize: getFontSize(37.0, context),
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),),

                          if (isSubscript)
                            Text(subcriptOrnot,
                              style: TextStyle(
                                fontSize: getFontSize(10.0, context),
                                color: themeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          else
                            Text(subcriptOrnot,
                              style: TextStyle(
                                fontSize: getFontSize(10.0, context),
                                color: themeColor,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: getFontSize(30, context),),

                      Align(child: Text(vitalType,
                        style: TextStyle(
                          fontSize: getFontSize(14.0, context),
                          color: Colors.white,
                        ),
                      ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: getFontSize(2, context),),
                      Align(child:
                      Text(dateAdded, style: TextStyle(
                        fontSize: getFontSize(9.0, context),
                        color: Colors.white,
                      )),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: getFontSize(2, context),),






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
    ),
    );

  }

  textFormat({
    required String text1,
    required String text2
  }) {
    return Column(
      children: [
        Text(
     text1,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: getFontSize(18, context)),
    ),
    SizedBox(height: getFontSize(10, context)),
    Container(
      width: getFontSize(263, context),
      child:
    Text(
    text2, textAlign: TextAlign.center,
    style: TextStyle(fontSize: getFontSize(16, context)),
    ),
        ),

    SizedBox(height: getFontSize(25, context),),

    ],
    );
  }

  readingHistory({
    required icon,
    required themeColor,
    required String name
  }) {
    return Column(children: [
      Container(
    width: getFontSize(86, context),
    height: getFontSize(86, context),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: themeColor
    ),
    child: Center(child: SvgPicture.asset(icon)),
    margin: EdgeInsets.only(right: getFontSize(20, context)),
    ),
      SizedBox(height: getFontSize(2, context),),
      Container(
        width: getFontSize(86, context),
        margin: EdgeInsets.only(right: getFontSize(20, context)),
      child: Text(name, textAlign: TextAlign.center, style: TextStyle(fontSize: getFontSize(14, context)),),
      ),
      SizedBox(height: getFontSize(20, context),),
    ]
    );
  }

 reading_history({
    required mmhg,
    required bpm,
    required date,
    required bulletColor,
  }){
    return Container(
      height: getFontSize(85, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: getFontSize(10, context), right: getFontSize(10, context)),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: getFontSize(28, context)),
              width: getFontSize(11, context),
              height: getFontSize(11, context),
              decoration: BoxDecoration(
                color: bulletColor, // Lemon green color
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: getFontSize(16, context)), // Space between the circle and the texts
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      mmhg,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(18, context),
                      ),
                    ),
                    SizedBox(width: getFontSize(4, context)),
                    Text(
                      'mmHg',
                      style: TextStyle(
                        fontSize: getFontSize(10, context),
                      ),
                    ),
                    SizedBox(width: getFontSize(16, context)),
                    Text(
                      bpm,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(18, context),
                      ),
                    ),
                    SizedBox(width: getFontSize(4, context)),
                    Text(
                      'BPM',
                      style: TextStyle(
                        fontSize: getFontSize(10, context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getFontSize(4, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: getFontSize(10, context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: getFontSize(16, context),
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  irregular_reading_history({
    required text,
    required date,
    required stackColor,
  }) {
    return Container(
      height: getFontSize(85, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only( right: getFontSize(10, context)),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: 
              SvgPicture.asset("assets/images/irr.svg", fit: BoxFit.fitHeight,)
          ),
          SizedBox(width: getFontSize(16, context)),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getFontSize(18, context),
                        ),
                      ),
                      SizedBox(height: getFontSize(5, context),),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: getFontSize(10, context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getFontSize(4, context)),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: getFontSize(16, context),
                  color: Colors.black,
                ),
                ),




          ],),

            )],
      ),
    );
  }

  devices({
    required String name,
    required String imagePath
  }) {
    return Container(
      child: Column(children: [
      Container(
      width: getFontSize(143, context),
      height: getFontSize(143, context),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: getFontSize(1, context), color: Colors.black.withOpacity(0.2))
      ),
      child:
      Center(child: SvgPicture.asset(imagePath),),
    ),
      SizedBox(height: getFontSize(10, context),),
      Text(name, style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold)),
        SizedBox(height: getFontSize(20, context), ),
    ],),
    );
  }

}