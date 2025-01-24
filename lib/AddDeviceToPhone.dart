import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceConnect.dart';
import 'package:flutter_svg/svg.dart';
import 'Main/Dashboard.dart';


void main(){
  runApp(AddDeviceToPhone());
}

class AddDeviceToPhone extends StatefulWidget {
  AddDeviceToPhone({super.key});
  @override
  _AddDeviceToPhoneScreen createState() => _AddDeviceToPhoneScreen();
}

class _AddDeviceToPhoneScreen extends  State<AddDeviceToPhone> {
  String? _selectedValue;
  bool deviceFound = false;

  @override
  void initState() {
    // TODO: implement initState
      Future.delayed(Duration(milliseconds: 2000), () {
        setState(() {
          deviceFound = true;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              Container(
                width: getFontSize(35, context),
                height: getFontSize(35, context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5).withOpacity(0.40),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: getFontSize(8.0, context),
                  color: Colors.white,
                  height: getFontSize(15, context),),
              ),
              Spacer(),
          
          GestureDetector(
            child: 
          Container(
            width: getFontSize(35, context),
            height: getFontSize(35, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFE5E5E5).withOpacity(0.40),
            ),
            child: Icon(Icons.info_outlined, color: Colors.white,),


          ),
            onTap: ()=>{
              showHowToConnectPopup(context)
            },
          )
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
        SizedBox(height: getFontSize(30, context)),

        Align(child: Text("Add your device", textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getFontSize(28, context),
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("Please switch your device on and make sure your phone’s bluetooth is on.", textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

        SizedBox(height: getFontSize(60, context)),
       deviceFound ? GestureDetector(
    onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> DeviceConnect()));
         },
           child: Container(
             padding: EdgeInsets.all(15),
         width: getFontSize(183, context),
         height: getFontSize(183, context),
         decoration: BoxDecoration(
           color: Colors.white,
           shape: BoxShape.circle,
         ),
         child: SvgPicture.asset('assets/images/dev.svg'),
       )
       )
       : SvgPicture.asset('assets/images/search.svg'),
        SizedBox(height: getFontSize(40, context)),

        
      ],
    ),
    ))));
  }


  void showHowToConnectPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: howToConnectPopup(),
        );
      },
    );
  }

  Widget howToConnectPopup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'How to connect?',
          style: TextStyle(color: Colors.black, fontSize: getFontSize(18, context)),
        ),
        SizedBox(height: getFontSize(25, context)),
        numbering(
          number: "1",
          text: "Make sure the device is fully charged and turn on the device",
        ),
        numbering(
          number: "2",
          text: "Keep your phone and device within 1 meter.",
        ),
        numbering(
          number: "3",
          text: "Turn on the bluetooth of the mobile phone.",
        ),
      ],
    );
  }

  Widget numbering({required String number, required String text}) {
    return Container(
        child: Row(
      children: [
        Container(
          width: getFontSize(20, context),
          height: getFontSize(20, context),
          margin: EdgeInsets.only(right: getFontSize(7, context)),
          child: Center(
            child: Text(
              number,
              style: TextStyle(color: Color(0xFF2E2E42)),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2).withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 6,
          ),
        ),
      ],
    ),
    margin: EdgeInsets.only(bottom: getFontSize(10, context)),
    );
  }

}