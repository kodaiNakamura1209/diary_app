import 'package:flutter/material.dart';
import 'calendar_table.dart';

class Calendar extends StatelessWidget {
  final DateTime _startDay = DateTime(2023, 10, 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        CalendarTable(2023,10),
        CalendarTable(2023,11),
        CalendarTable(2023,12),
      ],
    );
  }
}