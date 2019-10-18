import 'package:flutter/material.dart';
import 'package:my_city/screens/splash.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
        accentColor: Colors.orangeAccent,
        primaryColor: Colors.orange,
        primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
    home: new Splash(),
  ));
}
