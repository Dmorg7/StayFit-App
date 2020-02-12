import 'package:flutter/material.dart';

import './home.dart';
import './workout.dart';
import './trainers.dart';




void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
    State<StatefulWidget> createState(){
      return MyAppState();
    }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    WorkoutPage(),
    TrainersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stay Fit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StayFit'),),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Workouts')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Trainers')
            ),
          ],
        ),
      ),
    );
  }
}
