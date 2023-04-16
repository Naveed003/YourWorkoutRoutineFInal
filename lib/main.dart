import 'package:fitness/calendar.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex =0;
  final screens = [
    Center(child: Text('Home'),),
    Center(child: Text('Health'),),
    CalendarPage(),
    Center(child: Text('User'),)
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showUnselectedLabels: false,
            currentIndex: currentIndex,
            onTap: (index) => setState(() =>currentIndex = index),
            items:[
              BottomNavigationBarItem(icon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.analytics),
                  label: 'fav'),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_month),
                  label: 'person'),
              BottomNavigationBarItem(icon: Icon(Icons.person),
                  label: 'person')
            ] ),
      ),
    );
  }
}

