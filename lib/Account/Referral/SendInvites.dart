import 'package:flutter_app/Account/Referral/send_invites_success_page.dart';

import '../../Main/Dashboard.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(SendInvites());
}

class SendInvites extends StatefulWidget {
  SendInvites({super.key});
  @override
  _SendInvitesScreen createState() => _SendInvitesScreen();
}

class _SendInvitesScreen extends  State<SendInvites> {
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
                      'Send Invites',
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
            body: Stack(
    children: [Padding(
    padding:EdgeInsets.all(14),
    child: Column(
              children: [
                Text(
                  'Invite friends and loved ones to MyVitalz through your phonebook to help them avoid stroke, heart attack, kidney failure and sudden death.',
                  style: TextStyle(fontSize: getFontSize(14, context)),
                ),
                SizedBox(height: getFontSize(20, context)),
                Text(
                  'To download the MyVitalz app, click on this link to download from playstore or app store:',
                  style: TextStyle(fontSize: getFontSize(14, context)),
                ),
                Row(children: [
                  Text('Link: ', style: TextStyle(color: Colors.black, fontSize: getFontSize(14, context))),

                  GestureDetector(
                    onTap: () {

                    },
                    child: Text(
                      '7f4j6n8qN6EDCP-9wd/8ac6g7ewo87',
                      style: TextStyle(
                        fontSize: getFontSize(14, context),
                        color: Colors.blue,
                        decoration: TextDecoration.underline,              ),
                    ),
                  ),
                ]
                ),
                SizedBox(height: getFontSize(20, context),),
                SvgPicture.asset("assets/images/line.svg"),
                SizedBox(height: getFontSize(15, context),),
                Text(
                  '4 Contacts selected',
                  style: TextStyle(
                    fontSize: getFontSize(16, context),
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getFontSize(15, context),),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    contact(
                        alphaOrder: 'A',
                        name: "Alexander Trelawney"
                    ),
                    contact(
                        alphaOrder: 'A',
                        name: "Alexander Trelawney"
                    ),
                    contact(
                        alphaOrder: 'B',
                        name: "Benjamin Osagie"
                    ),
                    contact(
                        alphaOrder: 'A',
                        name: "Alexander Trelawney"
                    ),
                  ],),
                ),
              ],
            )
            ),
      DraggableScrollableSheet(
          initialChildSize: 0.27, // Default height (collapsed state)
          minChildSize: 0.1,  
          maxChildSize: 0.3, 
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: getFontSize(10, context)),
                  Container(
                    width: getFontSize(50, context),
                    height: getFontSize(5, context),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: getFontSize(10, context)),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: _actionButton(
                                icon: Icons.phone,
                                label: 'share on whatsapp',
                                color: Colors.blue,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                              },
                              child: _actionButton(
                                icon: Icons.message,
                                label: 'share as text message',
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getFontSize(20, context)),
                        Padding(padding: EdgeInsets.all(8),
                        child: 
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SendInvitesSuccessPage()));
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          })
                ]
            )

        );
  }

  Widget _actionButton(
      {required IconData icon, required String label, required Color color}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(
            icon,
            color: color,
            size: getFontSize(30, context),
          ),
        ),
        SizedBox(height: getFontSize(8, context)),
        Text(
          label,
          style: TextStyle(fontSize: getFontSize(12, context)),
        ),
      ],
    );
  }
  contact({
    required String alphaOrder,
    required String name}) {
    return
      Container(
          margin: EdgeInsets.only(right: getFontSize(15, context)),
          width: getFontSize(75, context),
          child: Column(
            children: [
              Container(
                width: getFontSize(70, context),
                height: getFontSize(70, context),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: getFontSize(63, context),
                      height: getFontSize(63, context),
                      decoration: BoxDecoration(
                          color: Color(0xff2e2e42),
                          shape: BoxShape.circle
                      ),
                      child: Text(alphaOrder, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: getFontSize(35, context), fontWeight: FontWeight.bold),),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.cancel, color: Colors.red,),
                    ),

                  ],
                ),
              ),

              SizedBox(height: getFontSize(10, context),),
              Text(
                name,
    textAlign: TextAlign.center,
                style: TextStyle(fontSize: getFontSize(16, context),),
              ),
              SizedBox(height: getFontSize(5, context),),

            ],
          )
      );
  }

  referOption({
    icon,
    required String referText
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(25),
          width: getFontSize(86, context),
          height: getFontSize(86, context),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffE2EDFF)
          ),
          child: icon is Icon ? icon : SvgPicture.asset(icon, width: getFontSize(26, context), height: getFontSize(26, context),),
        ),
        SizedBox(height: getFontSize(15, context),),
        Text("Refer a regular person", style: TextStyle(
            fontSize: getFontSize(14, context)
        ),)
      ],
    );
  }
}