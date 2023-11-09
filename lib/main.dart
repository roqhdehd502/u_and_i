import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontFamily: 'parisienne',
            fontSize: 80.0,
          ),
          displayMedium: TextStyle(
            color: Colors.black,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        )),
    home: HomeScreen(),
  ));
}
