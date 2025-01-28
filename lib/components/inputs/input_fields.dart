import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Configuration/color.dart';

class TextInput extends StatefulWidget {
  String btext;
  TextEditingController textcontroller;

  TextInput({
    Key? key,
    required this.btext,
    required this.textcontroller,
  }) : super(key: key);

  @override
  State<TextInput> createState() => _textInput();
}

class _textInput extends State<TextInput> {
  @override
  Widget build(BuildContext context) {

    return
      Container(
         // margin: EdgeInsets.all(20),
          width: 200,
          child: TextField(
            controller: widget.textcontroller,
            style: TextStyle(
              fontFamily: 'Poppins',
              //    color: AppColors.gray[700],
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              filled: true, //<-- SEE HERE
              fillColor: AppColors.gray[100],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: AppColors.blue[700]),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.blue[700]),
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: widget.btext,
            ),
            onChanged: (text) {
              setState(() {

                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          )
      );

  }
}

class TextInputNum extends StatefulWidget {
  String btext;
  TextEditingController textcontroller;

  TextInputNum({
    Key? key,
    required this.btext,
    required this.textcontroller,
  }) : super(key: key);

  @override
  State<TextInputNum> createState() => _textInputNum();
}

class _textInputNum extends State<TextInputNum> {
  @override
  Widget build(BuildContext context) {

    return
      Container(
         // margin: EdgeInsets.all(20),
          width: 200,
          child: TextField(
            controller: widget.textcontroller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(
              fontFamily: 'Poppins',
              //    color: AppColors.gray[700],
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              filled: true, //<-- SEE HERE
              fillColor: AppColors.gray[100],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: AppColors.blue[700]),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.blue[700]),
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: widget.btext,
            ),
            onChanged: (text) {
              setState(() {

                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          )
      );

  }
}

class TextArea extends StatefulWidget {
  String btext;
  double width;
  TextEditingController textcontroller;

  TextArea({
    Key? key,
    required this.btext,
    required this.textcontroller,
    this.width = 250,
  }) : super(key: key);

  @override
  State<TextArea> createState() => _TextArea();
}

class _TextArea extends State<TextArea> {
  @override
  Widget build(BuildContext context) {

    return
      Container(
         // margin: EdgeInsets.all(20),
          width: widget.width,
          child: TextField(
            controller: widget.textcontroller,
            maxLines: 8,
            style: TextStyle(
              fontFamily: 'Poppins',
              //    color: AppColors.gray[700],
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              filled: true, //<-- SEE HERE
              fillColor: AppColors.gray[300],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: AppColors.gray[200]),
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.gray[200]),
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: widget.btext,
            ),
            onChanged: (text) {
              setState(() {

                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          )
      );

  }
}

class TextInputOutline extends StatefulWidget {
  String btext;
  TextEditingController textcontroller;

  TextInputOutline({
    Key? key,
    required this.btext,
    required this.textcontroller,
  }) : super(key: key);

  @override
  State<TextInputOutline> createState() => _textInputOutline();
}

class _textInputOutline extends State<TextInputOutline> {
  @override
  Widget build(BuildContext context) {

    return
      Container(
         // margin: EdgeInsets.all(20),
          width: 200,
          child: TextField(
            controller: widget.textcontroller,
            style: TextStyle(
              fontFamily: 'Poppins',
                  color: AppColors.gray[0],
            ),
            decoration: InputDecoration(
             // filled: true, //<-- SEE HERE
           //   fillColor: AppColors.gray[100],
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: AppColors.gray[0]),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.gray[0]),
                borderRadius: BorderRadius.circular(25.0),
              ),
              hintText: widget.btext,
              hintStyle: TextStyle(color: AppColors.gray[400]),
            ),
            onChanged: (text) {
              setState(() {

                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          )
      );

  }
}

class TextInputPassword extends StatefulWidget {
  String btext;
  TextEditingController textcontroller;

  TextInputPassword({
    Key? key,
    required this.btext,
    required this.textcontroller,
  }) : super(key: key);

  @override
  State<TextInputPassword> createState() => _textInputPassword();
}

class _textInputPassword extends State<TextInputPassword> {
  @override
  Widget build(BuildContext context) {

    return
      Container(
         // margin: EdgeInsets.all(20),
          width: 20.0,

          child: TextField(
            obscureText: true,
            controller: widget.textcontroller,
            style: TextStyle(
              fontFamily: 'Poppins',
                  // color: AppColors.gray[0];
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              suffixIcon: SvgPicture.asset("assets/icons/eye.svg",),
              suffixIconConstraints: BoxConstraints(
                  minHeight: 24,
                  minWidth: 44
              ),
              filled: true, //<-- SEE HERE
              fillColor: AppColors.gray[100],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: AppColors.gray[200]),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.gray[200]),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: widget.btext,
            ),
            onChanged: (text) {
              setState(() {

                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          )
      );

  }
}

class TextInputPasswordOutline extends StatefulWidget {
  String btext;
  TextEditingController textcontroller;

  TextInputPasswordOutline({
    Key? key,
    required this.btext,
    required this.textcontroller,
  }) : super(key: key);

  @override
  State<TextInputPasswordOutline> createState() => _textInputPasswordOutline();
}

class _textInputPasswordOutline extends State<TextInputPasswordOutline> {
  @override
  Widget build(BuildContext context) {

    return
      Container(
         // margin: EdgeInsets.all(20),
          width: 20.0,

          child: TextField(
            obscureText: true,
            controller: widget.textcontroller,
            style: TextStyle(
              fontFamily: 'Poppins',
                  color: AppColors.gray[0],
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              suffixIcon: SvgPicture.asset("assets/icons/eye.svg",),
              suffixIconConstraints: BoxConstraints(
                  minHeight: 24,
                  minWidth: 44
              ),
              //filled: true, //<-- SEE HERE
             // fillColor: AppColors.gray[100],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: AppColors.gray[0]),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.gray[0]),
                borderRadius: BorderRadius.circular(25.0),
              ),
              hintText: widget.btext,
              hintStyle: TextStyle(color: AppColors.gray[400]),
            ),
            onChanged: (text) {
              setState(() {

                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          )
      );

  }
}

class TextInputDropDown extends StatefulWidget {
  String btext;
  String value;
  List<String>? items;

  TextInputDropDown({
    Key? key,
    required this.btext,
    required this.value,
    required this.items,
  }) : super(key: key);

  @override
  State<TextInputDropDown> createState() => _textInputDropDown();
}

class _textInputDropDown extends State<TextInputDropDown> {
  @override
  Widget build(BuildContext context) {

    return
      Container(
         // margin: EdgeInsets.all(20),
          width: 20.0,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: DropdownButton(
            value: widget.value,
            style: TextStyle(
              fontFamily: 'Poppins',
              //    color: AppColors.gray[700],
            ),
            icon: SvgPicture.asset("assets/dropdown.svg",),

            items: widget.items!.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                setState(() {
                  widget.value = newValue!;
                });
              });
            },
          )
      );

  }
}

class TextInputPin extends StatefulWidget {
  TextEditingController textcontroller;

  TextInputPin({
    Key? key,
    required this.textcontroller,
  }) : super(key: key);

  @override
  State<TextInputPin> createState() => _textInputPin();
}

class _textInputPin extends State<TextInputPin> {
  @override
  Widget build(BuildContext context) {

    return
      Container(
         // margin: EdgeInsets.all(20),
          width: 50.0,
          child:  TextField(
            textAlign: TextAlign.center,
            maxLength: 1,
            obscureText: true,
            controller: widget.textcontroller,
            style: TextStyle(
              fontFamily: 'Poppins',
              //    color: AppColors.gray[700],
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.gray[500]), //<-- SEE HERE
              ),
                counterText: '',
            ),
            onChanged: (text) {
              setState(() {
                if(text.isNotEmpty){
                  TextInputAction.next;
                }

                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          ),
      );

  }
}

class TextInputPinCode extends StatefulWidget {
  TextEditingController textcontroller;

  TextInputPinCode({
    Key? key,
    required this.textcontroller,
  }) : super(key: key);

  @override
  State<TextInputPinCode> createState() => _textInputPinCode();
}

class _textInputPinCode extends State<TextInputPinCode> {
  @override
  Widget build(BuildContext context) {

    return
      Container(
         // margin: EdgeInsets.all(20),
          width: 50.0,
          child:  TextField(
            textAlign: TextAlign.center,
            maxLength: 1,
            controller: widget.textcontroller,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              //    color: AppColors.gray[700],
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.gray[500]), //<-- SEE HERE
              ),
                counterText: '',
            ),
            onChanged: (text) {
              setState(() {
                if(text.isNotEmpty){
                  TextInputAction.next;
                }

                //you can access nameController in its scope to get
                // the value of text entered as shown below
                //fullName = nameController.text;
              });
            },
          ),
      );

  }
}