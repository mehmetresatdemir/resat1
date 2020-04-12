import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 15.0),

          hintText: "Search any Food",
          suffixIcon: Icon(Icons.search),

            border: InputBorder.none


        ),



      ),
    );
  }
}