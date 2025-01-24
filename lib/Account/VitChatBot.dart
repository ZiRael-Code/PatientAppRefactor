import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(VitChatBot());
}

class VitChatBot extends StatefulWidget {
  VitChatBot({super.key});
  @override
  _VitChatBotScreen createState() => _VitChatBotScreen();
}

class _VitChatBotScreen extends  State<VitChatBot> {
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
                Row(
                  children: [
                    Image.asset("assets/images/vit.jpg"),
                    SizedBox(width: getFontSize(10, context)),
                    Column(
                      children: [

                        Row(children: [
                        Text(
                          'Vit the Chatbot',
                          style: TextStyle(
                            color: Colors.black, // Black text color
                            fontSize: getFontSize(16, context), // Font size 16
                          ),
                        ),
                          SizedBox(width: getFontSize(7, context),),
                          SvgPicture.asset("assets/images/verified.svg")
                        ],),
                      SizedBox(height: getFontSize(8, context),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF218130)
                          ),
                          width: getFontSize(11, context),
                          height: getFontSize(11, context),
                        ),
                        ),

                          SizedBox(width: getFontSize(7, context),),
                          Text(
                            'Active now',
                            style: TextStyle(
                              color: Color(0xff2E2E42),
                              fontSize: getFontSize(16, context),
                            ),
                          ),
                        ],
                    ),
                      ],),
                  ],
                ),
              ),
              Spacer(),

            ],
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(left: getFontSize(15, context), right: getFontSize(15, context), top: getFontSize(25, context), bottom: getFontSize(25, context)),
          child: Column(
            children: [
              SizedBox(height: getFontSize(20, context)),
              Text("Wed 8:21 AM"),
              SizedBox(height: getFontSize(70, context)),

           incomingMessage(
               text: 'Hello, I’m Vit! 😁👋 How can I help you?'),
              SizedBox(height: getFontSize(40, context),),
              outGoingMessage(text: "How do I use my device?"),

              Spacer(),
              Row(
                children: [
                  // TextField
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        contentPadding: EdgeInsets.symmetric(vertical: getFontSize(15, context), horizontal: getFontSize(20, context)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Color(0x66BFBFBF),
                            width: getFontSize(0.5, context),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Color(0x66BFBFBF),
                            width: getFontSize(0.5, context),
                          ),
                        ),
                        suffixIcon: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.attach_file, color: Colors.grey),
                                onPressed: () {
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.mic, color: Colors.grey),
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: getFontSize(10, context)),

                  Container(
                    width: getFontSize(51, context),
                    height: getFontSize(51, context),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),

            ],
          ),



      ));


  }
  incomingMessage({
  required String text,
}){
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFF2F4F5),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: getFontSize(14, context),
              ),
            ),
          ),
        ],
      ),
    );

  }

outGoingMessage({
  required String text,
}){
  return Align(
    alignment: Alignment.centerRight,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF3C8AFF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: getFontSize(14, context),
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}





}