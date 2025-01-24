import '../Main/Dashboard.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'DeviceInformation.dart';


void main(){
  runApp(DeviceOrder());
}

class DeviceOrder extends StatefulWidget {
  DeviceOrder({super.key});
  @override
  _DeviceOrderScreen createState() => _DeviceOrderScreen();
}

class _DeviceOrderScreen extends  State<DeviceOrder> with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  

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
                    Text(
                      'Device Order',
                      style: TextStyle(
                          fontSize: getFontSize(20, context),
                          fontStyle: FontStyle.normal
                      ),
                    ),
                  ),
                  Spacer(),

                ],
              ),
            ),
            body:
            Container(
                padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
                child:
                Align(
                  child:
                  Column(
                    children: [
                      SizedBox(height: getFontSize(35, context),),
                      Container(
                        height: getFontSize(50, context),
                        padding: EdgeInsets.all(4),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffE0E0E0),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child:SizedBox(
                          child:
                        TabBar(
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelColor: Colors.black,
                          unselectedLabelColor: Color(0xff4F4F4F),
                          tabs: [
                            Tab(text: "Current Orders"),
                            Tab(text: "Order a Device"),
                          ],
                        ),
                        ),
                      ),
                      SizedBox(height: getFontSize(10, context),),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Center(
                              child:
                              currentOrder()
                            ),
                            Center(
                              child: orderADevice()
                            ),
                          ],
                        ),
                      ),







                    ],
                  ),
                ))) ;
  }

currentOrder(){
    return Column(
      children: [
        SizedBox(height: getFontSize(25, context),),
        order(
            deviceName: 'Wellue BP2 connect device ',
            isShipped: 'Arriving on',
            text: '25th June 2022'),
        SizedBox(height: getFontSize(20, context),),
        order(
            deviceName: 'Wellue BP2 connect device ',
            text: '25th June 2022'),

        SizedBox(height: getFontSize(20, context),),
        order(
            deviceName: 'Wellue BP2 connect device ',
            text: '25th June 2022'),
      ],
    );
}

  order({
    required deviceName,
    isShipped,
    required String text
}){
    return GestureDetector(
      onTap: (){
        showOrderDetailsBottomSheet();
      },
        child: Container(
    child:   Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/images/dev.svg'),
          SizedBox(width: getFontSize(20, context),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(deviceName,maxLines: 2, style: TextStyle(fontSize: getFontSize(16, context))),
              SizedBox(width: getFontSize(26, context),),
              isShipped == null ? Container(child: SizedBox(height: getFontSize(10, context),),) :Column(children: [
                SizedBox(height: getFontSize(10, context),),
                Text(isShipped, style: TextStyle(fontSize: getFontSize(12, context), color: Colors.grey)),
              ],),

              Align(alignment: Alignment.centerLeft,
                  child: Text(text, style: TextStyle(color: Colors.blue),))
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all( color: Colors.black.withOpacity(0.09))
      ),
    ),
    ),
    );
}

orderADevice(){
    return  SingleChildScrollView( child: Column(
      children: [
        SizedBox(height: getFontSize(25, context),),
        recomendDevice(
          name: "Wellue BP2 Connect Device",
          measures: "Measures 1 vital",
          image: "assets/images/printer.svg",
          prices: "N25,000",
        ),
        SizedBox(height: getFontSize(15, context),),
        recomendDevice(
          name: "Wellue BP2 Connect Device",
          measures: "Measures 1 vital",
          image: "assets/images/printer.svg",
          prices: "N25,000",
        ),

        SizedBox(height: getFontSize(15, context),),
        recomendDevice(
          name: "Wellue BP2 Connect Device",
          measures: "Measures 1 vital",
          image: "assets/images/printer.svg",
          prices: "N25,000",
        ),

      ],
    )
    );
}

  recomendDevice({
    required String name,
    required String measures,
    required String image,
    required String prices,
  }) {
    return Container(
      padding: EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: getFontSize(1, context),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getFontSize(16, context),
                  ),
                ),
                SizedBox(height: getFontSize(8, context)),
                Container(
                  margin: EdgeInsets.only(left: getFontSize(10, context)),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(measures),
                ),
                SizedBox(height: getFontSize(8, context)),
                Text(
                  prices,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: getFontSize(20, context),
                  ),
                ),
                SizedBox(height: getFontSize(16, context)),

              SizedBox(
                width: getFontSize(134, context),
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeviceInformation(),
                        ),
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Border radius of 12
                    ),
                  ),
                  child: Text(
                    'Order Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          ),
              ],
            ),
          ),
          SizedBox(height: getFontSize(15, context)),
          Container(
            padding: EdgeInsets.all(12),
            height: getFontSize(110, context),
            width: getFontSize(110, context),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.20),
              borderRadius: BorderRadius.circular(50),
            ),
            child: SvgPicture.asset(image),
          ),
        ],
      ),
    );
  }

  showOrderDetailsBottomSheet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child:  Container(
                  padding: EdgeInsets.all(20),
                  child:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Device Information", style: TextStyle(fontSize: getFontSize(18, context)),),
                      SizedBox(height: getFontSize(35, context),),
                      Container(alignment: Alignment.center,child:
                      SvgPicture.asset('assets/images/dev.svg', height: getFontSize(117, context), width: getFontSize(195, context),),
                      ),
                      SizedBox(height: getFontSize(50, context),),

                      Center(child:
                      Text(
                        'Wellue Bp2 Connect device',
                        style: TextStyle(color: Colors.black, fontSize: getFontSize(16, context)),
                      ),
                      ),

                      SizedBox(height: getFontSize(25, context),),

                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Text("Arrival date:"),
                              Spacer(),
                              Text("9th August 2022"),
                            ],
                          ) ,
                          SizedBox(height: getFontSize(30, context)),
                          Row(
                            children: [
                              Text("Price:"),
                              Spacer(),
                              Text("N25,000.00"),
                            ],
                          ),
                          SizedBox(height: getFontSize(30, context)),
                          Row(
                            children: [
                              Text("Delivery fee:"),
                              Spacer(),
                              Text("N1,500.00"),
                            ],
                          ),
                          SizedBox(height: getFontSize(30, context)),
                          Row(
                            children: [
                              Text("TOTAL:", style: TextStyle(fontWeight: FontWeight.bold),),
                              Spacer(),
                              Text("N26,550.00"),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: getFontSize(25, context)),
                      // Place an Order button
                      SizedBox(
                        height: getFontSize(55, context),
                        width: double.infinity, // Match screen width
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: getFontSize(0.5, context)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Logic for placing an order
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: Text(
                              'Cancel Order',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              )
          );
        }
    );

  }

}