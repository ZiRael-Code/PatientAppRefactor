import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(MeasureVitals());
}

class MeasureVitals extends StatefulWidget{
  @override
  _MeasureVitalsState createState() => _MeasureVitalsState();
}

class _MeasureVitalsState  extends State<MeasureVitals>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset(
                  'assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  height: getFontSize(15, context),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: getFontSize(35, context)),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Measure vital',
                    style: TextStyle(
                      fontSize: getFontSize(20, context),
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Heart Rate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getFontSize(20, context),
                ),
              ),
              SizedBox(height: getFontSize(20, context)),
              SvgPicture.asset('assets/images/cuate.svg'),
              SizedBox(height: getFontSize(20, context)),
              Text(
                'You don’t have any device yet',
                style: TextStyle(
                  fontSize: getFontSize(14, context),
                ),
              ),
              SizedBox(height: getFontSize(10, context)),
              Container(
                width: getFontSize(215, context),
                height: getFontSize(54, context),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Order a device',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getFontSize(14, context),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getFontSize(25, context)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommended devices',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getFontSize(18, context),
                  ),
                ),
              ),
              SizedBox(height: getFontSize(10, context)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: getFontSize(15, context)),
                      recomendDevice(
                        name: "Wellue BP2 Connect Device",
                        measures: "Measures 1 vital",
                        image: "assets/images/printer.svg",
                        prices: "N25,000",
                      ),
                      SizedBox(height: getFontSize(15, context)),
                      recomendDevice(
                        name: "Wellue BP2 Connect Device",
                        measures: "Measures 3 vitals",
                        image: "assets/images/printer.svg",
                        prices: "N25,000",
                      ),
                      SizedBox(height: getFontSize(15, context)),
                      recomendDevice(
                        name: "Wellue BP2 Connect Device",
                        measures: "Measures 1 vital",
                        image: "assets/images/printer.svg",
                        prices: "N25,000",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  recomendDevice({
    required String name,
    required String measures,
    required String image,
    required String prices,
  }) {
    return Container(
      padding: EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: getFontSize(1, context),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getFontSize(16, context),
                  ),
                ),
                SizedBox(height: getFontSize(8, context)),
                Container(
                  margin: EdgeInsets.only(left: getFontSize(10, context)),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(measures),
                ),
                SizedBox(height: getFontSize(8, context)),
                Text(
                  prices,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: getFontSize(20, context),
                  ),
                ),
                SizedBox(height: getFontSize(16, context)),
                SizedBox(
                  width: getFontSize(134, context),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Order Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getFontSize(15, context)),
          Container(
            padding: EdgeInsets.all(12),
            height: getFontSize(110, context),
            width: getFontSize(110, context),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.34),
              borderRadius: BorderRadius.circular(50),
            ),
            child: SvgPicture.asset(image),
          ),
        ],
      ),
    );
  }
}