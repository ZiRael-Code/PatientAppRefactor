import '../../Main/Dashboard.dart';





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';

import 'SendInvites.dart'; // For clipboard functionality


void main(){
  runApp(ReferSomeone());
}

class ReferSomeone extends StatefulWidget {
  ReferSomeone({super.key});
  @override
  _ReferSomeoneScreen createState() => _ReferSomeoneScreen();
}

class _ReferSomeoneScreen extends  State<ReferSomeone> {
  String? _selectedValue;
  final String referralCode = '7f44aiwuehjands3gui';
  int size = 0;
  List<String> contacts = ["Alexander Trelawney",
    "Alexander Trelawney", "Alexander Trelawney",
    "Alexander Trelawney", "Benjamin Osagie",
    "Benjamin Osagie", "Benjamin Osagie"];
  List<bool> isSelectedList = [];



  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(contacts.length, false);
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
                      'Refer someone',
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
            body: Container(
              padding: EdgeInsets.all(20),
              child:
              Column(children: [
                SizedBox(height: getFontSize(20, context),),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container with person icon
                    Container(
                      width: getFontSize(49, context),
                      height: getFontSize(49, context),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: getFontSize(10, context)),

                    Text(
                      'Referral link:',
                      style: TextStyle(fontSize: getFontSize(16, context), fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: getFontSize(10, context)), // Spacing

                    Expanded(
                      child: Text(
                        referralCode,
                        style: TextStyle(fontSize: getFontSize(16, context)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    SizedBox(width: getFontSize(10, context)),

                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: referralCode));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied to clipboard'))
                        );
                      },
                      child: Container(
                        width: getFontSize(79, context),
                        height: getFontSize(28, context),
                        decoration: BoxDecoration(
                          color: Color(0xFFE2EDFF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.copy, color: Colors.blue, size: getFontSize(16, context)),
                            SizedBox(width: getFontSize(5, context)),
                            Text(
                              'Copy',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getFontSize(20, context),),
                SvgPicture.asset("assets/images/line.svg"),
                SizedBox(height: getFontSize(20, context),),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search contact',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: getFontSize(15, context)),
                    ),
                  ),
                ),

                SizedBox(height: getFontSize(20, context),),
                Text("[ ${size} selected ]", style: TextStyle(
                  color: Colors.blue,
                  fontSize: getFontSize(18, context),
                  fontWeight: FontWeight.bold,
                ),),

                SizedBox(height: getFontSize(15, context),),

                contact(
                  alphaOrder: contacts[0].toString().characters.elementAt(0),
                  name: contacts[0],
                  isSelected: true,
                  index: 0, // You can modify this as needed
                ),

                contact(
                  alphaOrder: contacts[1].characters.elementAt(0),
                  name: contacts[1],
                  isSelected: false,
                  index: 0,
                ),
                contact(
                  alphaOrder: contacts[2].characters.elementAt(0),
                  name: contacts[2],
                  isSelected: false,// You can modify this as needed
                  index: 0,
                ),
                contact(
                  alphaOrder: contacts[3].characters.elementAt(0),
                  name: contacts[3],
                  isSelected: true,
                  index: 0,
                ),
                contact(
                  alphaOrder: contacts[4].characters.elementAt(0),
                  name: contacts[4],
                  isSelected: false,
                  index: 0,
                ),
                contact(
                  alphaOrder: contacts[5].characters.elementAt(0),
                  name: contacts[5],
                  isSelected: false,
                  index: 0,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SendInvites( )));
                  },
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
                      'Done',
                      style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                    ),
                  ),
                ),
              ]),))

    );
  }

  Widget contact({
    required String alphaOrder,
    required String name,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: getFontSize(41, context),
                height: getFontSize(41, context),
                decoration: BoxDecoration(
                  color: Color(0xff2e2e42),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    alphaOrder.toUpperCase(),
                    style: TextStyle(fontSize: getFontSize(16, context), color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: getFontSize(10, context)),
              Text(
                name,
                style: TextStyle(fontSize: getFontSize(16, context)),
              ),
              Spacer(),
              Container(
                width: getFontSize(33, context),
                height: getFontSize(33, context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF2F2F2),
                ),
                child: isSelected
                    ? Icon(Icons.check, color: Colors.blue)
                    : Container(),
              ),
            ],
          ),
          SizedBox(height: getFontSize(8, context)),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: getFontSize(10, context)),

        ],
      ),
      onTap: () {
        setState(() {
          isSelectedList[index] = !isSelectedList[index]; // Toggle selection
        });
      },
    );
  }

}