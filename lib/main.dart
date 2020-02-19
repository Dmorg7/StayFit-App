import 'package:flutter/material.dart';
import 'package:stayfit/login.dart';

import './home.dart';
import './login.dart';
import './workouts.dart';
import './trainers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF0277BD)),
      home: new LoginPage(),
    );
  }
}








