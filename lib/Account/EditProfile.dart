import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(EditProfile());
}

class EditProfile extends StatefulWidget {
  EditProfile({super.key});
  @override
  _EditProfileScreen createState() => _EditProfileScreen();
}

class _EditProfileScreen extends  State<EditProfile> {
  String? _selectedValue;

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
                  'Edit Profile',
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
        body: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(15),
        child: Column(
          children: [

            Center(
            child: ClipOval(
              child: Image.asset(
                'assets/images/rema.png',
                height: getFontSize(123, context),
                width: getFontSize(123, context),
                fit: BoxFit.cover,
              ),
            ),
            ),

            textField(
              fieldType: 'First Name',
              fieldHint: 'First Name',
            ),
            textField(
              fieldType: 'Last Name',
              fieldHint: 'Last Name',
            ),
            textField(
              fieldType: 'Specialization',
              fieldHint: 'Specialization',
            ),
            textField(
              fieldType: 'Email Address',
              fieldHint: 'Email Address',
            ),


            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Gender",
                style: TextStyle(fontSize: getFontSize(16, context)),
              ),
            ),
            Container(
              width: double.infinity,
              height: getFontSize(50, context),
              padding: EdgeInsets.only(left: getFontSize(12, context), right: getFontSize(12, context)),
              decoration: BoxDecoration(
                color: Color(0xFFf0f0f0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: DropdownButton<String>(
                value: _selectedValue,
                hint: Text("Gender", style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold, color: Colors.grey),),
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                  fontSize: getFontSize(16, context),
                  fontWeight: FontWeight.bold,
                  color:  Colors.grey,
                ),
                icon: Icon(Icons.keyboard_arrow_down),
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                items: <String>['Male', 'Female', '02:00 PM', '04:00 PM']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
SizedBox(height: getFontSize(15, context),),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Certificate",
                style: TextStyle(fontSize: getFontSize(16, context)),
              ),
            ),
        SizedBox(height: getFontSize(8, context),),
        Container(
          width: double.infinity,
          height: getFontSize(50, context),
          padding: EdgeInsets.only(left: getFontSize(12, context), right: getFontSize(12, context)),
          decoration: BoxDecoration(
            color: Color(0xFFf0f0f0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Text("Bsc.", style: TextStyle(
                color: Colors.grey
              ),),
              Spacer(),
              Icon(Icons.edit, color: Colors.black,)
            ],
          ),
        ),
SizedBox(height: getFontSize(40, context),),
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
                padding: EdgeInsets.symmetric(vertical: getFontSize(12.0, context), horizontal: getFontSize(24.0, context)),
                child: Text(
                  'Save changes',
                  style: TextStyle(color: Colors.white, fontSize: getFontSize(16, context)),
                ),
              ),
            ),

          ],
        )
        ),
        ),
      ));
  }

  textField({
    required String fieldType,
    required String fieldHint}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            fieldType,
            style: TextStyle(fontSize: getFontSize(16, context)),
          ),
        ),
        SizedBox(height: getFontSize(8.0, context)),
        TextField(
          decoration: InputDecoration(
            hintText: fieldHint,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Color(0xFFf0f0f0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: getFontSize(20, context),)
      ],
    );
  }
}