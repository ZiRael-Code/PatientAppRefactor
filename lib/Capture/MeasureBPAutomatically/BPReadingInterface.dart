import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Capture/MeasureBPAutomatically/MeasureBPResult.dart';
import 'package:flutter_app/components/colors/colours.dart';

import '../../component/_VerticalLineProgressPainte.dart';

class BPReadingInterface extends StatefulWidget {
  const BPReadingInterface({super.key});

  @override
  State<BPReadingInterface> createState() => _BPReadingInterfaceState();
}

class _BPReadingInterfaceState extends State<BPReadingInterface> {
  double progress = 0;
  @override
  @override
  void initState() {
    super.initState();
    _incrementProgress();
  }

  void _incrementProgress() async {
    int maxIncrements = Random.secure().nextInt(300);
    for (int i = 0; i < maxIncrements; i++) {
      await Future.delayed(Duration(milliseconds: 50));  // hi handover guy, this is just a demo of the progress bar moving
      setState(() {
        progress++;
      });
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>MeasureBPResult()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(child: Container(
          padding: EdgeInsets.all(19),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(30, (index) {
                  int number = (30 - index) * 10;
                  return Container(
                      // margin: EdgeInsets.only(bottom: 8.5),
                      child:  Text(
                    number.toString(),
                    style: TextStyle(fontSize: 12),
                  )
                  );
                }),
              ),
          SizedBox(
          width: 0,
          ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 96,
              width: 90,
              child:
            CustomPaint(
              painter: VerticalLineProgressPainter(progress), // hi there taker over, anywho as the machine is reaing u just increase the progress with a setstate yea
            )
            ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 110,),
              Container(
                child:
              Row(
                children: [
                  Text(progress.toInt().toString(), style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),),
                  Text("mmHg")
                ],
              ),
              ),
                  SizedBox(width: 12),

                  Text("Measuring, please wait", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Please keep quiet. Dont talk or move", style: TextStyle(fontSize: 14, color: AppColors.gray[500])),
              Spacer(),
              Container(
                width: 206,
                child:
              Text("*press START/STOP button to start or stop measuring", style: TextStyle(fontSize: 14, color: AppColors.gray[500])),
              )
                ],
              )



            ],
          ),
        )),
    );
  }
}
