import '../Main/Dashboard.dart';


import 'package:flutter/material.dart';

class Monty extends StatefulWidget {
  @override
  _MontyState createState() => _MontyState();
}

class _MontyState extends State<Monty> {
  DateTime _selectedYear = DateTime.now();
  String _selectedMonth = "";

  final List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text('Select Year and Month'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Year Selector (with left and right arrow buttons)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: () {
                  setState(() {
                    _selectedYear = DateTime(_selectedYear.year - 1);
                  });
                },
              ),
              Text(
                '${_selectedYear.year}',
                style: TextStyle(fontSize: getFontSize(24, context), fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  setState(() {
                    _selectedYear = DateTime(_selectedYear.year + 1);
                  });
                },
              ),
            ],
          ),
          SizedBox(height: getFontSize(20, context)),

          // Month Selector (Grid of months)
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Display 3 months per row
                childAspectRatio: 2 / 1, // Adjust for good sizing
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _months.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedMonth = _months[index];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedMonth == _months[index]
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        _months[index],
                        style: TextStyle(
                          color: _selectedMonth == _months[index]
                              ? Colors.white
                              : Colors.black,
                          fontSize: getFontSize(18, context),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Monty()));
}