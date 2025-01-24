import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(NewDrugs());
}

class NewDrugs extends StatefulWidget {
  NewDrugs({super.key});
  @override
  _NewDrugsScreen createState() => _NewDrugsScreen();
}

class _NewDrugsScreen extends  State<NewDrugs> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'New drugs',
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
        SizedBox(height: getFontSize(30, context)),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("Your drugs are being processed by the pharmacy. When you’ve recieved them, click on the button below to start using them.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),
SizedBox(height: getFontSize(30, context),),
          drug(
              name: "Ibuprofen",
              usage: '1 pack: 1 pill(s). 2x daily'
          ),
          drug(
              name: "Cough syrup",
              usage: '1 bottle:  10ml. 3X daily'
          ),
          drug(
          name: "Paracetamol",
          usage: '1 pack:  3 pill(s) . 3X daily'
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Start using drugs',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),

      ],
    ),
    )));
  }

  drug({
    required String name,
    required String usage}) {
    return GestureDetector(
      onTap: (){
        gotten_drug_confirmation_popup();
      },
        child: Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: getFontSize(10, context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey,
          width: getFontSize(1.0, context),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontSize: getFontSize(16, context)),),
          SizedBox(height: getFontSize(8, context),),
          Text(usage, style: TextStyle(color: Color(0xff666666)))
        ],
      ),
      ),
    );
  }
  gotten_drug_confirmation_popup(){
    return showDialog(
        context: context,
        builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: getFontSize(197, context),
          child: Text(textAlign: TextAlign.center,'Have you gotten these drugs yet?', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: getFontSize(15, context),),
        Container(
        width: getFontSize(197, context),
        child: Text('Once you click the ‘start using drugs’ button, a counter starts counting the number of drugs you’ve used. Click yes if you’ve gotten them.')
        ),
        SizedBox(height: getFontSize(15, context),),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> CommunityFeed()));
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
                  'Yes',
                  style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                ),
              ),
            ),
            SizedBox(height: getFontSize(8, context),),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                side: BorderSide(color: Colors.blue, width: getFontSize(1, context)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Text(
                  'No i haven\'t',
                  style: TextStyle(color: Colors.blue, fontSize: getFontSize(18, context)),
                ),
              ),
            ),
          ],
        )
    ],
        )
      );
        }
    );
  }
}