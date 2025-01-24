import '../../Main/Dashboard.dart';



import 'package:flutter/material.dart';

class ContactsCheckedTile extends StatefulWidget {
  final String name;
  final bool isInitiallySelected;
  final ValueChanged<bool> onSelectionChanged;

  ContactsCheckedTile({
    super.key,
    required this.name,
    this.isInitiallySelected = false,
    required this.onSelectionChanged,
  });

  @override
  State<ContactsCheckedTile> createState() => _ContactsCheckedTileState();
}

class _ContactsCheckedTileState extends State<ContactsCheckedTile> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isInitiallySelected; // Initialize state
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: getFontSize(5, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: getFontSize(50, context),
                height: getFontSize(50, context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    widget.name[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getFontSize(20, context),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: getFontSize(16, context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: getFontSize(14, context),
                  ),
                ],
              ),
              SizedBox(
                width: getFontSize(40, context),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                  widget.onSelectionChanged(isChecked); // Notify parent
                },
                child: Container(
                  height: getFontSize(24, context),
                  width: getFontSize(24, context),
                  decoration: BoxDecoration(
                    color: isChecked ? Colors.green : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: isChecked
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: getFontSize(16, context),
                        )
                      : null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getFontSize(5, context),
          ),
          SizedBox(
            width: getFontSize(350, context),
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}