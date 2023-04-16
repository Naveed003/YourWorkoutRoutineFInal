import 'package:flutter/material.dart';
import 'package:fitness/components/my_calendar.dart';

class CalendarPage extends StatelessWidget {
  final DateTime today=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            children: [
              MyCalendar(today: today)
            ],
          )


        ],
      );
      

  }
}
