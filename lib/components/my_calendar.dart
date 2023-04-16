import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  final DateTime today;
  const MyCalendar({Key? key,required this.today}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    _selectedDay = _focusedDay;

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)

        ),
        child: TableCalendar(
          //onDaySelected: _onDaySelected,
          calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(color: const Color(0xFF5C6BC0), shape: BoxShape.circle, ),
              selectedDecoration : const BoxDecoration(color: const Color(0xFF5C6BC0), shape: BoxShape.circle)
          ),
            rowHeight: 30,
            focusedDay: widget.today, firstDay: DateTime.utc(2021,1,1), lastDay: DateTime.utc(2025,12,30),

        ),
      ),
    );
  }
}

