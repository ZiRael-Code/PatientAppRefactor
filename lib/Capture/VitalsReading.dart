import 'package:flutter_app/Capture/devices_content.dart';
import 'package:flutter_app/Capture/reading_history_content.dart';
import 'package:flutter_app/Capture/take_reading_content.dart';

import '../component/vitals_text_format.dart';
import '../components/colors/colours.dart';
import '../Main/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Main/MeasureVitalsManuallyMenu.dart';
import 'package:flutter_app/Capture/MeasureHearthRateAutomatically/MeasureHearthRateAutomaticallyTip.dart';
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
        backgroundColor: AppColors.blue[700],
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
            color: AppColors.blue[700],
            shape: BoxShape.circle,
          ),
          child: InkWell(child: Icon(Icons.home_outlined, color: AppColors.gray[100]),
          onTap: (){
            Navigator.pop(context);
          },
          ),
        ),
        Spacer(),
        Text('Vital Readings', style: TextStyle(color: AppColors.gray[100])),
          Spacer(),
          Container(
            width: getFontSize(35, context),
            height: getFontSize(35, context),
            decoration: BoxDecoration(
              color: AppColors.blue[700],
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(Icons.share, color: AppColors.gray[100])),
          ),
        ],
      ),



        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.gray[100],
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
          TakeReadingsContent(),
          HistoryContent(),
          DevicesContent(),
        ],
      ),
    );
  }
  Widget _buildTabButton(String text) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.gray[100]),
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
          border: Border.all(width: getFontSize(1, context), color: AppColors.gray[700].withOpacity(0.2))
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