import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Account/AddCondition.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(PersonalHistoryRecords());
}

class PersonalHistoryRecords extends StatefulWidget {
  PersonalHistoryRecords({super.key});
  @override
  _PersonalHistoryRecordsScreen createState() => _PersonalHistoryRecordsScreen();
}

class _PersonalHistoryRecordsScreen extends  State<PersonalHistoryRecords> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    List<String> conditions = [];
    // List<String> conditions = ["Hypertension", "Diabetes", "Ucler"];
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
                  'Personal History Records',
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


        SvgPicture.asset('assets/images/girl.svg'),
        SizedBox(height: getFontSize(30, context)),

        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("If you have any previous or current health condition, you can add them here.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),

        SizedBox(height: getFontSize(15, context),),
        SizedBox(
          width: getFontSize(200, context),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCondition(),
              ),
            );
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
              'Add a condition',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(16, context)),
            ),
          ),
        ),
        ),

       SizedBox(height: getFontSize(75, context),),
    conditions.isEmpty ? nothing() : ListView(
        children: List.generate(conditions.length, (index) {
          String text = conditions[index];
          return
              Text(text, style: TextStyle(fontSize: getFontSize(16, context)),);

        }),
      ),


      ],
    ),
    )) );
  }

  nothing() {
    return  DottedBorder(
      color:  Colors.grey.withOpacity(0.70),
      radius: Radius.circular(19),
      dashPattern: [8, 6],
      borderType: BorderType.RRect,
      strokeWidth: 2,
      child: Container(
        width: getFontSize(342, context),
        height: getFontSize(206, context),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.10)
        ),
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset('assets/images/box.svg'),
            SizedBox(height: getFontSize(20, context),),
            Text('No medical conditions added.', style: TextStyle(fontSize: getFontSize(16, context),
                color: Colors.black.withOpacity(0.40)),),
            Spacer(),

          ],
        ),


      ),
    );
  }

}