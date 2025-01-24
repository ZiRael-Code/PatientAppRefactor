import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/OnBoarding/SlideScreen3.dart';
import 'package:flutter_svg/svg.dart';

import '../Signup.dart';


void main(){
  runApp(SlideScreen2());
}

class SlideScreen2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Padding(padding:
       EdgeInsets.only(top: getFontSize(45, context),),
       child: Column(
         children: [
         Align(
         alignment: Alignment.centerRight,
         child: Container(
           padding: EdgeInsets.only(left: getFontSize(18, context), right: getFontSize(18, context)),
           child:InkWell(
             onTap: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Signup()));
             },
             child: Text('skip', style: TextStyle(color: Colors.blue, fontSize: getFontSize(16, context))),)
         ),
         ),
           Spacer(),
           Align(
             alignment: Alignment.center,
             child:  SvgPicture.asset(
               'assets/images/slide2.svg',
               // width: MediaQuery.of(context).size.width,
               // height: MediaQuery.of(context).size.height,
             ),
           ),
           SizedBox(height: getFontSize(25, context),),
           SvgPicture.asset('assets/images/slider2.svg'),
           SizedBox(height: getFontSize(25, context),),
           Container(
             width: getFontSize(314, context),
             child: Text('Whether it’s a video/voice call or a physical consultation with a doctor, the choice is yours!',style: TextStyle(fontSize: getFontSize(14, context)),),
           ),
           SizedBox(height: getFontSize(25, context),),
           Container(
             padding: EdgeInsets.only(left: getFontSize(18, context), right: getFontSize(18, context)),
             child:
           ElevatedButton(
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SlideScreen3()));
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
                 'Continue',
                 style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
               ),
             ),
           ),
           ),
           Spacer(),
         ],
       ),
       ),
   );
  }
}