import '../Main/Dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/AppointmentPaymentSummary.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(ScheduleAppointmentDateChooser());
}

class ScheduleAppointmentDateChooser extends StatefulWidget {
  ScheduleAppointmentDateChooser({super.key});
  @override
  ScheduleAppointmentDateChooserState createState() => ScheduleAppointmentDateChooserState();
}

class ScheduleAppointmentDateChooserState extends State<ScheduleAppointmentDateChooser> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title:
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: getFontSize(10, context)),
              width: getFontSize(32, context),
              height: getFontSize(32, context),
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFE5E5E5),
              ),
              child: SvgPicture.asset(
                'assets/images/back.svg',
                color: Colors.white,
                width: getFontSize(8.0, context),
                height: getFontSize(15, context),
              ),
            ),
            Spacer(),
            Text(
              'Book Appointment',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getFontSize(18, context),
              ),
            ),
            Spacer(),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            TableCalendar(
              firstDay: _focusedDay,
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  // _focusedDay = focusedDay; // update focusedDay as well
                });
              },
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: Container(
                  height: getFontSize(23, context),
                  width: getFontSize(23, context),
                  child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.blue, size: getFontSize(15, context),),),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.20),
                  ),
                ),
                rightChevronIcon: Container(
                  height: getFontSize(23, context),
                  width: getFontSize(23, context),
                  child: Center(child:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue, size: getFontSize(15, context),),),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.20),
                  ),
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.black, fontSize: getFontSize(14, context)),
                weekdayStyle: TextStyle(color: Colors.black, fontSize: getFontSize(14, context)),
                decoration: BoxDecoration()
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: Colors.black,fontSize: getFontSize(20, context)),
                weekNumberTextStyle: TextStyle(fontSize: getFontSize(20, context)),
                defaultTextStyle: TextStyle(fontSize: getFontSize(20, context)),
                todayTextStyle: TextStyle(fontSize: getFontSize(20, context)),
                disabledTextStyle: TextStyle(fontSize: getFontSize(20, context), color: Colors.grey),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child:Text('Select time', textAlign: TextAlign.left,style: TextStyle(
                fontSize: getFontSize(14, context),
                fontWeight: FontWeight.bold,
              ),),
            ),
        SizedBox(height: getFontSize(10, context),),
        Container(
          height: getFontSize(50, context),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(9),
          ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                hintText: 'Input time or select from below',
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              style: TextStyle(
                fontSize: getFontSize(16, context),
              ),
            ),
        ),

            SizedBox(height: getFontSize(7, context),),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  wicd(text: "MON"),
                  wicd(text: "TUE"),
                  wicd(text: "WED"),
                  wicd(text: "THUR"),
                ],
              ),
            ),
        SizedBox(height: getFontSize(20, context),),
            Align(
              alignment: Alignment.centerLeft,
              child:Text('Appointment type', textAlign: TextAlign.left,style: TextStyle(
                fontSize: getFontSize(14, context),
                fontWeight: FontWeight.bold,
              ),),
            ),



            Container(
              height: getFontSize(50, context),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(9),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                value: _selectedValue, // Variable to hold the selected value
                hint: Text(
                  'Input time or select from below',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                isExpanded: true, // Makes dropdown take full width
                underline: SizedBox(), // Hides the default underline
                style: TextStyle(
                  fontSize: getFontSize(16, context),
                  color: Colors.black, // Dropdown item color
                ),
                icon: Icon(Icons.arrow_drop_down), // Dropdown icon
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                items: <String>['10:00 AM', '12:00 PM', '02:00 PM', '04:00 PM']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: getFontSize(20, context),),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentPaymentSummary()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: getFontSize(18, context)),
                ),
              ),
            ),



          ],
        ),
      ),
    ),);

  }


  wicd({
    required String text
  }){
    return Container(
      margin: EdgeInsets.only(right: getFontSize(5, context), top: getFontSize(15, context)),
      padding: EdgeInsets.only(top: getFontSize(12, context), left: getFontSize(25, context), bottom: getFontSize(12, context), right: getFontSize(25, context)),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1), width: getFontSize(0.5, context)),
          color: Color(0xFFE2EDFF),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Text(text, style: TextStyle(fontSize: getFontSize(12, context)),),
    );
  }

}