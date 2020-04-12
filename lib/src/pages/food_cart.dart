import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resat/BurgerListView/data/food_,model.dart';
import 'dart:async';



class cart_page extends StatelessWidget {
  FoodItem foodItem;
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(builder: (context){
          return StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('cart').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: Text('Loading...'),
                  );
                default:
                  return new ListView(
                    children: snapshot.data.documents.map((
                        DocumentSnapshot document) {
                      return  ListTile(
                        title: Text(document['asd']),

                      );
                    }).toList(),
                  );
              }
            },
          );
        })
    );
  }
}
