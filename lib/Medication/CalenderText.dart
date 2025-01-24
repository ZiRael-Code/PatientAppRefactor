import '../Main/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: CalenderText()));
}

class CalenderText extends StatefulWidget {
  CalenderText({super.key});

  @override
  _CalenderTextState createState() => _CalenderTextState();
}

class _CalenderTextState extends State<CalenderText> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Section with arrows, month, and year
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        _focusedDay.month - 1,
                      );
                    });
                  },
                ),
                Row(
                  children: [
                    Text(
                      DateFormat('MMMM').format(_focusedDay),
                      style: TextStyle(
                        fontSize: getFontSize(20, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: getFontSize(5, context)),
                    Text(
                      _focusedDay.year.toString(),
                      style: TextStyle(
                        fontSize: getFontSize(20, context),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        _focusedDay.month + 1,
                      );
                    });
                  },
                ),
              ],
            ),
          ),

          // Calendar Section
          TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              // Do not change the selected day
              setState(() {
                _focusedDay = focusedDay; 
              });
            },
            calendarStyle: CalendarStyle(
              outsideDaysVisible: true,
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              defaultDecoration: BoxDecoration(
                color: Color(0xffE2EDFF).withOpacity(0.30),
                borderRadius: BorderRadius.circular(8),
              ),
              weekendDecoration: BoxDecoration(
                color: Color(0xffE2EDFF).withOpacity(0.30),
                borderRadius: BorderRadius.circular(8),
              ),
              outsideTextStyle: TextStyle(color: Colors.grey),
              defaultTextStyle: TextStyle(color: Colors.black),
              cellMargin: EdgeInsets.all(18.0), // Vertical space between cells
            ),
            headerVisible: false,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              weekendStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) {
                return _buildDateCell(day, isToday: true);
              },
              defaultBuilder: (context, day, focusedDay) {
                return _buildDateCell(day, isToday: false);
              },
              outsideBuilder: (context, day, focusedDay) {
                return _buildDateCell(day, isToday: false, isGrayedOut: true);
              },
            ),
          ),

          SizedBox(height: getFontSize(16, context)),

          // Legend Section
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLegendRow(Colors.red, 'The medication were not taken for that day', 'Not'),
              _buildLegendRow(Colors.orange, 'Some of the medication were taken that day', 'Some'),
              _buildLegendRow(Colors.green, 'All the medication were taken that day', 'All'),
            ],
          ),
        ],
      ),
    );
  }

  // Custom Date Cell Design
  Widget _buildDateCell(DateTime day, {bool isToday = false, bool isGrayedOut = false}) {
    String formattedDay = DateFormat.E().format(day).substring(0, 3); // Mon, Tue, etc.
    String date = day.day.toString();

    // Determine the color for the dot based on your condition (replace this with your logic)
    Color? dotColor;
    // Example condition (replace with actual logic)
    if (date == '1') { // Example condition for the first day of the month
      dotColor = Colors.red; // Set dot color
    } else if (date == '15') {
      dotColor = Colors.orange;
    } else if (date == '30') {
      dotColor = Colors.green;
    }

    return Container(
      margin: EdgeInsets.only(right: getFontSize(0, context)),
      padding: EdgeInsets.all(5),
      width: getFontSize(48, context),
      height: getFontSize(67, context),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: getFontSize(7, context)),
            width: getFontSize(48, context),
            height: getFontSize(67, context),
            decoration: BoxDecoration(
              color: isToday ? Colors.blue : Color(0xffE2EDFF).withOpacity(0.30),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formattedDay,
                  style: TextStyle(
                    color: isToday ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: getFontSize(4, context)),
                Text(
                  date,
                  style: TextStyle(
                    color: isToday ? Colors.white : Colors.black,
                    fontSize: getFontSize(24, context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          if (dotColor != null) // Create dot only if color is not null
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: getFontSize(4, context)), // Adjust as needed for positioning
                width: getFontSize(8, context),
                height: getFontSize(8, context),
                decoration: BoxDecoration(
                  color: dotColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Legend Item Design
  Widget _buildLegendRow(Color color, String text, String boldText) {
    return Row(
      children: [
        Container(
          width: getFontSize(8, context),
          height: getFontSize(8, context),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        SizedBox(width: getFontSize(8, context)),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(text: '$boldText ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: text.replaceFirst(boldText, '')),
            ],
          ),
        ),
        SizedBox(height: getFontSize(8, context)),
      ],
    );
  }
}