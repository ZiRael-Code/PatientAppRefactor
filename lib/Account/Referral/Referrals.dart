import '../../Main/Dashboard.dart';




import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ReferDoctor.dart';
import 'ReferHospital.dart';
import 'ReferPharmacy.dart';
import 'ReferSomeone.dart';


void main(){
  runApp(Referrals());
}

class Referrals extends StatefulWidget {
  Referrals({super.key});
  @override
  _ReferralsScreen createState() => _ReferralsScreen();
}

class _ReferralsScreen extends  State<Referrals> {
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
                      'Referrals',
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
                            width: MediaQuery.of(context).size.width * 0.68,
                            child:
                            Align(child: Text("Invite your friends and earn commissions when they buy devices.", textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: getFontSize(14, context),
                              ),
                            ),
                            ),),
                          SizedBox(height: getFontSize(60, context),),
                          SvgPicture.asset('assets/images/pana.svg'),
                          SizedBox(height: getFontSize(40, context)),
                          Align(
                            alignment: Alignment.center,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ReferSomeone()));
                            },
                                  child:
                                referOption(
                                    icon: Icon(Icons.person, color: Colors.blue,size: getFontSize(36, context),),
                                    referText: "Refer a regular person"
                                ),
                                ),
                                SizedBox(width: getFontSize(25, context)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ReferHospital()));
                                  },
                                  child:
                                referOption(
                                  icon: "assets/images/hospital.svg",
                                  referText: "Refer a Hospital",
                                ),
                                ),
                              ],),
                          ),
                          SizedBox(height: getFontSize(25, context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children:  [

                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ReferDoctor()));
                                },
                                child:
                              referOption(
                                  icon: "assets/images/rad.svg",
                                  referText: "Refer a Doctor"
                              ),
                              ),
                              SizedBox(width: getFontSize(25, context)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ReferPharmacy()));
                                },
                                child:
                              referOption(
                                  icon: "assets/images/rap.svg",
                                  referText: "Refer a Pharmacy"
                              ),
                              ),
                            ],)
                        ]

                    ))
            ));
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
        Text(referText, style: TextStyle(
            fontSize: getFontSize(14, context)
        ),)
      ],
    );
  }
}