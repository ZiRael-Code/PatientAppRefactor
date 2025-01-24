import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(DeviceHistoryHearthRate());
}

class DeviceHistoryHearthRate extends StatefulWidget {
  DeviceHistoryHearthRate({super.key});
  @override
  _DeviceHistoryHearthRateScreen createState() => _DeviceHistoryHearthRateScreen();
}

class _DeviceHistoryHearthRateScreen extends  State<DeviceHistoryHearthRate> with TickerProviderStateMixin{
  late TabController _tabController = TabController(length: 2, vsync: this);
  Color appBarColor = Color(0xffFF618F);
  int statusSelectedIndex= 0;
  List<SvgPicture> statusTab = [SvgPicture.asset('assets/images/hearth.svg'), SvgPicture.asset('assets/images/hearth.svg')];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: appBarColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(22), bottomLeft: Radius.circular(22)),
              ),
            child:
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width * 0.15,),
                  Container(
                    padding: EdgeInsets.only(left: getFontSize(10, context), right: getFontSize(10, context)),
                    child:
                  Row(
                    children: [
                      Container(
                        width: getFontSize(35, context),
                        height: getFontSize(35, context),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFFFFFF).withOpacity(0.45),
                        ),
                        child: SvgPicture.asset('assets/images/back.svg',
                          width: getFontSize(8.0, context),
                          height: getFontSize(15, context),
                        color: Colors.white,),
                      ),
                      Spacer(),
                      Text('Heart rate', style: TextStyle(fontSize: getFontSize(20, context), color: Colors.white),),
                      Spacer(),
                      Container(
                        width: getFontSize(35, context),
                        height: getFontSize(35, context),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFFFFFF).withOpacity(0.45),
                        ),
                        child: Icon(Icons.share, color: Colors.white,),
                      ),

                    ],
                  ),
                  ),

                  SizedBox(height: getFontSize(30, context),),
                  Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width /2 -20),
                  alignment: Alignment.center,
                  child:
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            tab(
                              icon: "assets/images/hearth1.svg",
                              isSelected: true,
                            ),
                            tab(
                              icon: "assets/images/hearth1.svg",
                              isSelected: false,
                            ),
                            tab(
                              icon: "assets/images/hearth1.svg",
                              isSelected: false,
                            ),
                            tab(
                              icon: "assets/images/hearth1.svg",
                              isSelected: false,
                            ),
                            tab(
                              icon: "assets/images/hearth1.svg",
                              isSelected: false,
                            ),  tab(
                              icon: "assets/images/hearth1.svg",
                              isSelected: false,
                            ),
                            tab(
                              icon: "assets/images/hearth1.svg",
                              isSelected: false,
                            ),
                    ]
                  )
                  ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.width * 0.15,),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('107/160', style: TextStyle(fontSize: getFontSize(30, context),color: Colors.white, fontWeight: FontWeight.bold),),
                        SizedBox(width: getFontSize(16, context)),
                        Text('bpm', style: TextStyle( color: Colors.white ),),

                      ],
                    ),
                  ),
                  SizedBox(height: getFontSize(15, context),),
                  Text('measured 10mins ago', style: TextStyle( color: Colors.white ),),
                  SizedBox(height: getFontSize(15, context),),
                ],
      )
      ),

            SizedBox(height: getFontSize(20, context),),

            //
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              Text('History', style: TextStyle(fontSize: getFontSize(18, context), color: Colors.black)),
                  SizedBox(height: getFontSize(20, context),),
                 Column(
                   children: [
                 Container(
                  height: getFontSize(50, context),
                  padding: EdgeInsets.all(4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffE0E0E0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                     child: TabBar(
                         controller: _tabController,
                         indicatorSize: TabBarIndicatorSize.tab,
                         indicator: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(30),
                         ),
                         labelColor: Colors.black,
                         unselectedLabelColor: Color(0xff4F4F4F),
                         tabs: [
                           Tab(text: "Device Reading"),
                           Tab(text: "Manual Reading"),
                         ],
            )
            ),
                  SizedBox(height: getFontSize(10, context)),
                  // Expanded(
                  //   child:
                  //   TabBarView(
                  //     controller: _tabController,
                  //     children: [
                  //       Center(
                  //         child: Text("Device Reading Content"),
                  //         // Replace this with your deviceReading widget
                  //       ),
                  //       Center(
                  //         child: Text("Manual Reading Content"),
                  //         // Replace this with your manualReading widget
                  //       ),
                  //     ],
                  //   ),
                  // ),

                ]
              )

                ]
            )
            )
            //   Column(
            //     children: [
            //       // Your existing app bar and other widgets
            //
            //             SizedBox(height: getFontSize(10, context)),
            //             // Container(
            //             //   height: getFontSize(50, context),
            //             //   padding: EdgeInsets.all(4),
            //             //   width: double.infinity,
            //             //   decoration: BoxDecoration(
            //             //     color: Color(0xffE0E0E0),
            //             //     borderRadius: BorderRadius.circular(50),
            //             //   ),
            //             //   child: TabBar(
            //             //     controller: _tabController,
            //             //     indicatorSize: TabBarIndicatorSize.tab,
            //             //     indicator: BoxDecoration(
            //             //       color: Colors.white,
            //             //       borderRadius: BorderRadius.circular(30),
            //             //     ),
            //             //     labelColor: Colors.black,
            //             //     unselectedLabelColor: Color(0xff4F4F4F),
            //             //     tabs: [
            //             //       Tab(text: "Device Reading"),
            //             //       Tab(text: "Manual Reading"),
            //             //     ],
            //             //   ),
            //             // ),
            //             // SizedBox(height: getFontSize(10, context)),
            //             // // Wrap with Expanded to handle the available space
            //             // Expanded(
            //             //   child: TabBarView(
            //             //     controller: _tabController,
            //             //     children: [
            //             //       Center(
            //             //         child: Text("Device Reading Content"),
            //             //         // Replace this with your deviceReading widget
            //             //       ),
            //             //       Center(
            //             //         child: Text("Manual Reading Content"),
            //             //         // Replace this with your manualReading widget
            //             //       ),
            //             //     ],
            //             //   ),
            //             // ),
            //     ],
            //   ),
            // )


            ]
      )
      ));
  }

  tab({required String icon,
    required bool isSelected}) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        margin: EdgeInsets.only(right: getFontSize(10, context)),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ?Colors.white   : Colors.white.withOpacity(0.20),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(child: SvgPicture.asset(icon,
          color: isSelected ? Color(0xffFF618F) : Colors.white.withOpacity(0.20),

        )
        ),
      ),
    );
  }

  deviceReading() {
    return Column(
      children: [
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(child: Column(
                children: [
                  history(
                      date: "Today . 12:00 am",
                      text: "Regular ECG",
                      stackColor:  Color(0xFF1BE43B)
                  ),
                  history(
                      date: "14 Jul 2022 . 12:00 am",
                      text: "Irregular ECG",
                      stackColor:  Color(0xFFFAB400)
                  ),
                  history(
                      date: "14 Jul 2022 . 12:00 am",
                      text: "Abnormal ECG",
                      stackColor:  Color(0xFFFF6161)
                  ),
                  SizedBox(height: getFontSize(10, context),),
                ]),)
        ),
    ],
    );
  }

  history({required String date,
    required String text,
    required Color stackColor}) {
    return Container(
      margin: EdgeInsets.only(bottom: getFontSize(14, context)),
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
              SvgPicture.asset("assets/images/irr.svg", fit: BoxFit.fitHeight, color: stackColor,)
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

  manualReading() {

  }
}