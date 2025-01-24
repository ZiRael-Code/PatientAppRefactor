import '../Main/Dashboard.dart';
import 'Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(SelectSpecialistToShareReadings());
}

class SelectSpecialistToShareReadings extends StatefulWidget {
  SelectSpecialistToShareReadings({super.key});
  @override
  _SelectSpecialistToShareReadingsScreen createState() => _SelectSpecialistToShareReadingsScreen();
}

class _SelectSpecialistToShareReadingsScreen extends  State<SelectSpecialistToShareReadings> {
  String? _selectedValue;

  List<bool> isSelectedList = [];



  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(1000, false);
  }
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
                  'Share readings',
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
        Align(child: Text("Select the medical personnel(s) you want to share your vital readings with", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getFontSize(14, context),
        ),
        ),
        ),
        ),
        SizedBox(height: getFontSize(35, context),),
        specialist(
            image: "assets/images/doc1.png",
            name: "Dr. John Doe",
            specialization: "Cardiologist surgeon",
            workingType: "Freelance specialist",
            index: 0
        ),
        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingType: "Freelance specialist",
            index: 1
        ),
        specialist(
          image: "assets/images/doc.png",
          name: "Dr. Nelson Yang",
          specialization: "Design Doctor",
          workingType: "Walls and Gates hospital",
            index: 2
        ),
        specialist(
          image: "assets/images/doc1.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingType: "Freelance specialist",
          index: 3
        ),

        SizedBox(height: getFontSize(25, context),),

        Container(
          height: getFontSize(50, context),
          width: MediaQuery.of(context).size.width * 0.60,
          decoration: BoxDecoration(
            color: Color(0xFFE2EDFF),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<String>(
            value: _selectedValue,
            hint: Text(
              'Sharing options',
              style: TextStyle(
                color: Color(0xFF3C8AFF),
              ),
            ),
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(
              fontSize: getFontSize(16, context),
              color: Color(0xFF3C8AFF),
            ),
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.blue,),
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
            items: <String>['Sharing 1 week readings', 'Sharing 2 week readings', 'Sharing 3 week readings', 'Sharing 4 week readings']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),

        Spacer(),
        ElevatedButton(
          onPressed: () {},
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
              'Share readings',
              style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
            ),
          ),
        ),


      ],
    ),
    ))));
  }

  specialist({required String image,
    required String name,
    required String specialization,
    required int index,
    required String workingType})
  {
    return GestureDetector(
      child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  // margin: EdgeInsets.only(bottom: getFontSize(50, context)),
                  height: getFontSize(44, context),
                  width: getFontSize(44, context),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(image),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(width: getFontSize(12, context)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(
                      fontSize: getFontSize(18, context),
                      color: Colors.black
                  ),),
                  SizedBox(height: getFontSize(5, context),),
                  Text("${specialization} . ${workingType}", style: TextStyle(
                      fontSize: getFontSize(12, context),
                      color: Colors.grey.withOpacity(0.90)
                  ),),
                ],
              ),
              Spacer(),
              Container(
                width: getFontSize(33, context),
                height: getFontSize(33, context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelectedList[index] ? Colors.green : Color(0xffF2F2F2),
                ),
                child: isSelectedList[index]
                    ? Icon(Icons.check, color: isSelectedList[index] ? Colors.white : Color(0xffC2C2C2))
                    : Container(),
              ),
            ],
          ),
          SizedBox(height: getFontSize(15, context),),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(15, context),),
        ],
      ),
    ),
      onTap: (){
        setState(() {
          isSelectedList[index] =!isSelectedList[index];
        });
      },
    );
  }



}