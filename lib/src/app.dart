import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Food Order App",
      theme: ThemeData(
        primaryColor: Colors.blueAccent

      ),
      home: MainScreen(),
    );
  }

}