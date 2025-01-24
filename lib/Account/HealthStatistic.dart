import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';




void main(){
  runApp(HealthStatistic());
}

class HealthStatistic extends StatefulWidget {
  HealthStatistic({super.key});
  @override
  _HealthStatisticScreen createState() => _HealthStatisticScreen();
}

class _HealthStatisticScreen extends  State<HealthStatistic> with SingleTickerProviderStateMixin {
  String? _selectedValue;
  late TabController _tabController = TabController(length: 2, vsync: this);
  int selectedIndex = 0; // Track which tab is selected
  final List<String> tabLabels = ["Blood Pressure", "Heart Rate", "Blood Group"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  'Health statistics',
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
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: getFontSize(20, context),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: getFontSize(23, context),
              width: getFontSize(23, context),
              child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.blue, size: getFontSize(15, context),),),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.20),
              ),
            ),
            SizedBox(width: getFontSize(8, context),),
            Text(
              'August',
              style: TextStyle(
                fontSize: getFontSize(20, context),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: getFontSize(8, context),),
            Container(
              height: getFontSize(23, context),
              width: getFontSize(23, context),
              child: Center(child:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue, size: getFontSize(15, context),),),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.20),
              ),
            ),
          ],),
        SizedBox(height: getFontSize(20, context),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(tabLabels.length, (index) {
              bool isSelected = selectedIndex == index;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: getFontSize(8.0, context)),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // Update the selected index
                    });
                  },
                  child: Container(
                    width: getFontSize(161, context),
                    height: getFontSize(54, context),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      border: Border.all(
                        color: isSelected ? Colors.transparent : Colors.blue,
                        width: getFontSize(1, context),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tabLabels[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.blue,
                        fontSize: getFontSize(16, context),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        SizedBox(height: getFontSize(20, context)), // Add space between tabs and content

        // Content Body based on selected tab
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: [
              Center(child:bloodPressure()),
              Center(child:hearthRate()),
              Center(child:bloodPressure()),
            ],
          ),
        ),
      ],
    ),
    ))));
  }

  bloodPressure() {
    return Column(children: [
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
    SizedBox
    (
    height: getFontSize(10, context)
    ,
    ),
    ],);
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
                color: bulletColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: getFontSize(16, context)),
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

  }

  hearthRate() {}



