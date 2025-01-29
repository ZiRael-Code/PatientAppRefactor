import 'package:flutter/material.dart';

import '../colors/colours.dart';


class ButtonBlack extends StatefulWidget {
  String btext;
  dynamic Function()? actions;

  ButtonBlack({
    Key? key,
    required this.btext,
    this.actions,
  }) : super(key: key);

  @override
  State<ButtonBlack> createState() => _buttonBlack();
}

class _buttonBlack extends State<ButtonBlack> {
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Text(widget.btext,
        style: TextStyle(
        fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        color: AppColors.gray[0],
      ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gray[700],
        elevation: 0,
        padding: const EdgeInsets.all(15),
        shape: StadiumBorder(),
      //  minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        widget.actions!();
      },
    );

  }
}

class ButtonBlue extends StatefulWidget {
  String btext;
  dynamic fontsize;
  dynamic Function()? actions;

  ButtonBlue({
    Key? key,
    required this.btext,
    this.actions,
    this.fontsize,
  }) : super(key: key);

  @override
  State<ButtonBlue> createState() => _buttonBlue();
}

class _buttonBlue extends State<ButtonBlue> {
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Text(widget.btext,
        style: TextStyle(
        fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        color: AppColors.gray[0],
          fontSize: widget.fontsize,
      ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue[700],
        elevation: 0,
        padding: const EdgeInsets.all(10),
        shape: StadiumBorder(),
      //  minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        widget.actions!();
      },
    );

  }
}

class ButtonRed extends StatefulWidget {
  String btext;
  dynamic fontsize;
  dynamic Function()? actions;

  ButtonRed({
    Key? key,
    required this.btext,
    this.actions,
    this.fontsize,
  }) : super(key: key);

  @override
  State<ButtonRed> createState() => _buttonRed();
}

class _buttonRed extends State<ButtonRed> {
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Text(widget.btext,
        style: TextStyle(
        fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        color: AppColors.gray[0],
          fontSize: widget.fontsize,
      ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red[700],
        elevation: 0,
        padding: const EdgeInsets.all(10),
        shape: StadiumBorder(),
      //  minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        widget.actions!();
      },
    );

  }
}

class ButtonGray extends StatefulWidget {
  String btext;
  dynamic Function()? actions;

  ButtonGray({
    Key? key,
    required this.btext,
    this.actions,
  }) : super(key: key);

  @override
  State<ButtonGray> createState() => _buttonGray();
}

class _buttonGray extends State<ButtonGray> {
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Text(widget.btext,
        style: TextStyle(
        fontFamily: 'Mulish',
          fontWeight: FontWeight.w700,
        color: AppColors.gray[0],
      ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gray[500],
        elevation: 0,
        padding: const EdgeInsets.all(15),
        shape: StadiumBorder(),
     //   minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        widget.actions!();
      },
    );

  }
}

class ButtonGrayTransparent extends StatefulWidget {
  String btext;
  dynamic Function()? actions;

  ButtonGrayTransparent({
    Key? key,
    required this.btext,
    this.actions,
  }) : super(key: key);

  @override
  State<ButtonGrayTransparent> createState() => _buttonGrayTransparent();
}

class _buttonGrayTransparent extends State<ButtonGrayTransparent> {
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Text(widget.btext,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: AppColors.gray[700],
          ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gray[0],
        elevation: 0,
        padding: const EdgeInsets.all(15),
        shape: StadiumBorder(),
      //  minimumSize: const Size.fromHeight(50),
        side: BorderSide(width: 1, color: AppColors.gray[500]),
      ),
      onPressed: () {
        widget.actions!();
      },
    );

  }
}


class ButtonWhiteTransparent extends StatefulWidget {
  String btext;
  dynamic Function()? actions;

  ButtonWhiteTransparent({
    Key? key,
    required this.btext,
    this.actions,
  }) : super(key: key);

  @override
  State<ButtonWhiteTransparent> createState() => _buttonWhiteTransparent();
}

class _buttonWhiteTransparent extends State<ButtonWhiteTransparent> {
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Text(widget.btext,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: AppColors.gray[0],
          ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gray[0].withOpacity(0.0),
        elevation: 0,
        padding: const EdgeInsets.all(15),
        shape: StadiumBorder(),
       // minimumSize: const Size.fromHeight(50),
        side: BorderSide(width: 1, color: AppColors.gray[0]),
      ),
      onPressed: () {
        widget.actions!();
      },
    );

  }
}


class CircleButton extends StatefulWidget {
  String btext;
  dynamic Function()? actions;

  CircleButton({
    Key? key,
    required this.btext,
    this.actions,
  }) : super(key: key);

  @override
  State<CircleButton> createState() => _circleButton();
}

class _circleButton extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Text(widget.btext,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
          color: AppColors.gray[700],
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gray[0],
        elevation: 0,
        padding: const EdgeInsets.all(20),
        shape: CircleBorder(),
       // minimumSize: const Size.fromHeight(80),
        side: BorderSide(width: 1, color: AppColors.gray[200]),
      ),
      onPressed: () {
        widget.actions!();
      },
    );

  }
}


class CircleButtonBlack extends StatefulWidget {
  String btext;
  dynamic Function()? actions;

  CircleButtonBlack({
    Key? key,
    required this.btext,
    this.actions,
  }) : super(key: key);

  @override
  State<CircleButtonBlack> createState() => _circleButtonBlack();
}

class _circleButtonBlack extends State<CircleButtonBlack> {
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Text(widget.btext,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
          color: AppColors.gray[0],
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gray[700],
        elevation: 0,
        padding: const EdgeInsets.all(20),
        shape: CircleBorder(),
       // minimumSize: const Size.fromHeight(80),
       // side: BorderSide(width: 1, color: AppColors.gray[200]),
      ),
      onPressed: () {
        widget.actions!();
      },
    );

  }
}
