import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ChangeLocation.dart';

class Selectpickuplocation extends StatefulWidget {
  Selectpickuplocation({super.key});

  @override
  State<Selectpickuplocation> createState() => _SelectpickuplocationState();
}

class _SelectpickuplocationState extends State<Selectpickuplocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  'Select pickup location',
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
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getFontSize(25, context),),
        Text("Your Location", style: TextStyle(fontSize: getFontSize(18, context)),),
        SizedBox(height: getFontSize(20, context),),
        Row(
          children: [
            Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Region",style: TextStyle(fontSize: getFontSize(16, context),color: Colors.black38) ),
                Text("Lagos", style: TextStyle(fontSize: getFontSize(16, context)))
              ],
            )
          ],
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("LGA",style: TextStyle(fontSize: getFontSize(16, context),color: Colors.black38) ),
                Text("Agege, Lagos", style: TextStyle(fontSize: getFontSize(16, context)))
              ],
            )
          ],
        ),
          ],
        ),
        SizedBox(height: getFontSize(15, context),),
        ElevatedButton(
          onPressed: () {
            // TODO the popup nd select location no dey so redo it
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ChangeLocation()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            side: BorderSide(
              color: Colors.blue,
              width: getFontSize(2.0, context),
            )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Change Location',
              style: TextStyle(color: Colors.blue, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
        SizedBox(height: getFontSize(25, context),),
        Text("Pickup venues near you", style: TextStyle(fontSize: getFontSize(16, context))),
        SizedBox(height: getFontSize(25, context),),
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xffF9F9F9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Landmark hospitals", style: TextStyle(fontSize: getFontSize(16, context))),
              SizedBox(height: getFontSize(9, context),),
              Text("50, Saint Mark Avenue, off Raymond estate, Surulere, Lagos", style: TextStyle(color: Colors.black45)),
              SizedBox(height: getFontSize(20, context),),
              ElevatedButton(
                onPressed: () {
                  // TODO the popup nd select location no dey so redo it
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ChangeLocation()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                ),
                child: Align(alignment: Alignment.center, child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                    'Change Location',
                    style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                  ),
                   SizedBox(width: getFontSize(10, context),),
                   Icon(Icons.check_circle, color: Colors.white,),
                      Spacer(),
                    ]
                  )
                ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            // TODO the popup nd select location no dey so redo it
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ChangeLocation()));
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
              'Checkout',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),
      ],
    )
    )
    );
  }
}