import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(FAQ());
}

class FAQ extends StatefulWidget {
  FAQ({super.key});
  @override
  _FAQScreen createState() => _FAQScreen();
}

class _FAQScreen extends State<FAQ> {
  List<bool> _isExpandedList = List.generate(50000, (index) => false);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
          automaticallyImplyLeading: false,
            title: Row(
              children: [
                Container(
                  width: getFontSize(35, context),
                  height: getFontSize(35, context),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFE5E5E5),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/back.svg',
                    width: getFontSize(8.0, context),
                    height: getFontSize(15, context),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      'FAQ’s',
                      style: TextStyle(fontSize: getFontSize(20, context), fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(left: getFontSize(30, context), right: getFontSize(30, context), bottom: getFontSize(35, context), top: getFontSize(35, context)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  faqWidget(
                      question:
                      "This is another example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 0),
                  faqWidget(
                      question:
                      "This is a third example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 1),
                  faqWidget(
                      question:
                      "This is a fourth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 2),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                ],
              ),
            ),

        ));
  }

  // Pass the index of the FAQ so each has its own expand/collapse state
  Widget faqWidget({
    required String question,
    required String ans,
    required int index,
  }) {
    return Container(
      margin: EdgeInsets.only(top: getFontSize(10, context), bottom: getFontSize(10, context)),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: getFontSize(266, context),
                  child: Expanded(
                    child: Text(
                      question,
                      style: TextStyle(fontSize: getFontSize(16, context), color: Colors.black),
                      maxLines: _isExpandedList[index] ? null : 1,
                      overflow: _isExpandedList[index]
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpandedList[index] = !_isExpandedList[index];
                    });
                  },
                  child: Icon(
                    _isExpandedList[index]
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down_sharp,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            if (_isExpandedList[index]) ...[
              SizedBox(height: getFontSize(10, context)),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: getFontSize(226, context),
                  child: Text(
                    ans,
                    style: TextStyle(fontSize: getFontSize(12, context), color: Color(0xff2C2C2C)),
                  ),
                ),
              ),
            ],
            SizedBox(height: getFontSize(20, context)),
            SvgPicture.asset("assets/images/line.svg")
          ],
        ),
      ),
    );
  }
}