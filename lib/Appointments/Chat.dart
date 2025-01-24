import '../Main/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SelectADeliveryMethod.dart';


void main(){
  runApp(Chat());
}

class Chat extends StatefulWidget {
  Chat({super.key});
  @override
  _ChatScreen createState() => _ChatScreen();
}

class _ChatScreen extends  State<Chat> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

                SizedBox(width: getFontSize(25, context),),
                Align(
                    alignment: Alignment.centerLeft,
                  child:
                Column(children: [
                Text('Dr. Nelson Yang', style: TextStyle(fontSize: getFontSize(18, context)),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        ))],
                ),
                ],),),
              Spacer(),
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xffE2EDFF),
                shape: BoxShape.circle
              ),
              child: Icon(Icons.call, color: Colors.blue,),
            ),
              SizedBox(width: getFontSize(12, context),),
              Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xffE2EDFF),
                shape: BoxShape.circle
              ),
              child: Icon(Icons.more_horiz_rounded, color: Colors.blue,),
            )
            ],
          ),
          centerTitle: true,
        ),
        body:

    Container(
          padding: EdgeInsets.only(left: getFontSize(15, context), right: getFontSize(15, context), top: getFontSize(25, context), bottom: getFontSize(25, context)),
          child:
          Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                  child:
            Column(
            children: [
              SizedBox(height: getFontSize(20, context)),
              Text("Wed 8:21 AM"),
              SizedBox(height: getFontSize(70, context)),

           incomingMessage(
               text: 'Hello, I’m Dr. Nelson! 👋How can I help you?'),
              outGoingMessage(text: "I am not feeling too well. I woke up with a fever this morning. What should i do?"),

           incomingMessage(
               text: 'Oh, I see. Sorry about that. Please click on the blue icon at the bottom right of your screen to select your symptoms.'),
              outGoingMessage(text: "Okay"),

              incomingMessage(
                  text: 'Use these medications'),

            Align(
              alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: (){
                prescription_information_bottom_sheet();
              },
              child:
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0x331BD939).withOpacity(0.080),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0x4D218130).withOpacity(0.070),
                  width: getFontSize(2, context), // Border width
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                 SvgPicture.asset('assets/images/pill1.svg'),
                  SizedBox(width: getFontSize(8, context)),
                  // Text content
                      Text(
                        '12/06/2022 - ',
                        style: TextStyle(
                          color: Color(0xff218130),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Prescriptions',
                        style: TextStyle(
                          color: Color(0xff218130),
                        ),
                  ),
                ],
              ),
            ),
            ),
            ),

              // Spacer(),
              ]),
      )
      ),
              Spacer(),

              Row(

                children: [
                  // TextField
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                          width: getFontSize(96, context),
                          child: Row(
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
  }) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 260,
                  ),
                  child: Container(
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
                      softWrap: true, // Ensure the text wraps when needed
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getFontSize(20, context)),
        ],
      ),
    );
  }


  outGoingMessage({
  required String text,
}){
  return Column(children: [
    Align(
    alignment: Alignment.centerRight,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 301,
          ),
        child:
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
        ),
      ],
    ),
  ),
    SizedBox(height: getFontSize(20, context),),
  ]
  );
}

  void prescription_information_bottom_sheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the content to be scrollable
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5, // 50% of screen height
          minChildSize: 0.3, // Minimum height
          maxChildSize: 0.8, // Maximum height
          builder: (_, controller) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Prescription Information",
                      style: TextStyle(fontSize: getFontSize(17, context)),
                    ),
                    SizedBox(height: getFontSize(30, context)),
                    Text("Prescription information"),
                    drug(
                      name: 'Ibuprofen',
                      price: "15,000",
                      pills: "15 pills",
                    ),
                    drug(
                      name: 'Cough Syrup',
                      price: "3,250",
                      pills: "200ml",
                    ),
                    drug(
                      name: 'Paracetamol',
                      price: "650",
                      pills: "35 pills",
                    ),
                    SizedBox(height: getFontSize(20, context)),
                    ElevatedButton(
                      onPressed: () {
                        order_information_sheet();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                        ),
                      ),
                    ),
                    SizedBox(height: getFontSize(10, context)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                        side: BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Text(
                          'Close',
                          style: TextStyle(color: Colors.blue, fontSize: getFontSize(18, context)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  drug({required String name,
    required String price,
    required String pills}) {
    return Container(
      margin: EdgeInsets.only(bottom: getFontSize(20, context)),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: getFontSize(1, context),
              color: Colors.black.withOpacity(0.070))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: getFontSize(14, context)),),
              SizedBox(height: getFontSize(10, context),),
              Text(pills, style: TextStyle(fontSize: getFontSize(12, context), color: Color(0xff000000).withOpacity(0.60)),),
            ],),
          Spacer(),
          Text("N"+price,  style: TextStyle(fontSize: getFontSize(16, context),fontWeight: FontWeight.bold, color: Colors.blue))
        ],
      ),
    );
  }

  void order_information_sheet() {
    bool isFilterOpen = false;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Allows the content to be scrollable
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
    ),
    ),
    builder: (context) {
          return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5, // 50% of screen height
          minChildSize: 0.3, // Minimum height
          maxChildSize: 0.8, // Maximum height
          builder: (_, controller) {
            return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child:  Column(
                  children: [
                    Text(
                      "Prescription Information",
                      style: TextStyle(fontSize: getFontSize(17, context)),
                    ),
                    SizedBox(height: getFontSize(30, context)),
                    Container(
                      margin: EdgeInsets.only(bottom: getFontSize(20, context)),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          width: getFontSize(1, context),
                          color: Colors.black.withOpacity(0.070),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/images/pill1.svg'),
                          SizedBox(width: getFontSize(8, context)),
                          Text(
                            '12/06/2022 - ',
                            style: TextStyle(
                              color: Color(0xff218130),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Prescriptions',
                            style: TextStyle(
                              color: Color(0xff218130),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Text('No. of medications:', style: TextStyle(color: Color(0xff666666))),
                        Spacer(),
                        Text('3 drugs'),
                      ],
                    ),
                    SizedBox(height: getFontSize(20, context),),
                    Row(
                      children: [
                        Text('price', style: TextStyle(color: Color(0xff666666))),
                        Spacer(),
                        Text('N5,350.00', style: TextStyle(color: Colors.blue),
                        )],
                    ),
                    SizedBox(height: getFontSize(20, context),),
                    Row(
                      children: [
                        Text('TOTAL', style: TextStyle(fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text('3 drugs', style: TextStyle(fontSize: getFontSize(16, context),color: Colors.blue),
                        )],
                    ),


                    SizedBox(height: getFontSize(25, context),),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFilterOpen = !isFilterOpen; // Toggle the dropdown and icon
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: getFontSize(50, context),
                            width: MediaQuery.of(context).size.width * 0.40,
                            decoration: BoxDecoration(
                              color: Color(0xFFE2EDFF),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  'See details',
                                  style: TextStyle(
                                    fontSize: getFontSize(16, context),
                                    color: Color(0xFF3C8AFF),
                                  ),
                                ),
                                SizedBox(width: getFontSize(15, context)),
                                Icon(
                                  isFilterOpen
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.blue,
                                  size: getFontSize(26, context),
                                ),
                              ],
                            ),
                          ),
                          if (isFilterOpen)
                            Container(
                              margin: EdgeInsets.only(top: getFontSize(16, context)), // Spacing between row and dropdown
                              width: double.infinity, // Matches screen width
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('No. of medications:',
                                          style: TextStyle(
                                            fontSize: getFontSize(14, context),
                                            color: Colors.black.withOpacity(0.55),
                                          )
                                      ),
                                      Spacer(),
                                      Text('3 drugs',
                                          style: TextStyle(
                                            fontSize: getFontSize(14, context),
                                            color: Colors.black,
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: getFontSize(25, context),),
                                  Row(
                                    children: [
                                      Text('Price:',
                                          style: TextStyle(
                                            fontSize: getFontSize(14, context),
                                            color: Colors.black.withOpacity(0.55),
                                          )
                                      ),
                                      Spacer(),
                                      Text('N25,000.00',
                                          style: TextStyle(
                                            fontSize: getFontSize(14, context),
                                            color: Colors.blue,
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: getFontSize(25, context),),
                                  Row(
                                    children: [
                                      Text('TOTAL:',
                                          style: TextStyle(
                                            fontSize: getFontSize(14, context),
                                            color: Colors.black.withOpacity(0.55),
                                          )
                                      ),
                                      Spacer(),
                                      Text('N5,500.00',
                                          style: TextStyle(
                                            fontSize: getFontSize(16, context),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          )
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: getFontSize(15, context)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SelectADeliveryMethod()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Text(
                          'Proceed to checkout',
                          style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                        ),
                      ),
                    ),
                  ],
                ),
            );
    }
    );
    }
    );
  }
}