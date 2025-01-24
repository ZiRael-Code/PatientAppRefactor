import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AddAccount.dart';
import 'WithdrawSuccess.dart';

void main() {
  runApp(WithdrawFunds());
}

class WithdrawFunds extends StatefulWidget {
  WithdrawFunds({super.key});

  @override
  _WithdrawFundsScreen createState() => _WithdrawFundsScreen();
}

class _WithdrawFundsScreen extends State<WithdrawFunds> {
  String? _selectedValue;
  bool isSelected = false;
  String pin = "";
  List<int> _enteredPin = [];


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                    child: Text(
                      'Withdraw funds',
                      style: TextStyle(
                          fontSize: getFontSize(20, context),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            body: Container(
                padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
                child: Align(
                  child: Column(
                    children: [
                      SizedBox(height: getFontSize(50, context)),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Align(
                          child: Text(
                            "Select any of the accounts to withdraw your funds into",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: getFontSize(16, context),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getFontSize(20, context),
                      ),
                      account(
                          accountNo: "Account 1",
                          accountNumber: "0123456789",
                          bankName: "GTBank"),
                      SizedBox(
                        height: getFontSize(15, context),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddAccount(),
                            ),
                          );
                        },
                        child:
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        height: getFontSize(54, context),
                        decoration: BoxDecoration(
                          color: Color(0xFFE2EDFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text(
                            'Add another account',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: getFontSize(16, context),
                            ),
                          ),
                          ),
                        ),
                        ),
                      Spacer(),
                      Container(
                        width: double.infinity,
                        height: getFontSize(54, context),
                        decoration: BoxDecoration(
                          color: Color(0xFF3C8AFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _showPinScreen(context); // Show PIN screen when confirm is clicked
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getFontSize(16, context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )) );
  }

  account(
      {required String accountNo,
        required String accountNumber,
        required String bankName}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      accountNo,
                      style: TextStyle(
                        fontSize: getFontSize(18, context),
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: getFontSize(5, context)),
                    Row(
                      children: [
                        Text(
                          accountNumber,
                          style: TextStyle(
                            fontSize: getFontSize(14, context),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: getFontSize(3, context),
                        ),
                        Text(
                          bankName,
                          style: TextStyle(
                            fontSize: getFontSize(14, context),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(height: getFontSize(5, context)),
                      Container(
                        width: getFontSize(40, context),
                        height: getFontSize(40, context),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green : Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: isSelected
                            ? Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SvgPicture.asset("assets/images/line.svg"),
      ],
    );
  }

  // Function to show the sliding pin entry screen
  void _showPinScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: getFontSize(20, context)),
              Text(
                'Enter PIN',
                style: TextStyle(
                  fontSize: getFontSize(20, context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getFontSize(20, context)),
              Container(
                width: getFontSize(163, context),
                height: getFontSize(50, context),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return Container(
                      width: getFontSize(15, context),
                      height: getFontSize(15, context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < _enteredPin.length
                            ? Colors.black
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: getFontSize(20, context)),
              _buildNumberPad(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNumberPad() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 9) {
            return SizedBox.shrink();
          } else if (index == 11) {
            return IconButton(
              icon: Icon(Icons.backspace),
              onPressed: () {
                setState(() {
                  if (_enteredPin.isNotEmpty) _enteredPin.removeLast();
                });
              },
            );
          }
          int number = index == 10 ? 0 : index + 1;
          return GestureDetector(
            onTap: () {
              if (_enteredPin.length < 4) {
                setState(() {
                  _enteredPin.add(number);
                });
              }else{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WithdrawSuccess(),
                  ),
                );
              }
            },
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(fontSize: getFontSize(24, context)),
              ),
            ),
          );
        },
      ),
    );
}
}