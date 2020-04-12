import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget{
  final textstyle = TextStyle (fontSize: 35.0,fontWeight: FontWeight.bold);

    @override 
    Widget build(BuildContext context){
      return Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("PIZZA 24",style: textstyle, ),
                    Text("Great Pizza",style: textstyle)],
                ),
                Icon(Icons.notifications_active),
              ],
            ),
      )
      ;
    }  


}