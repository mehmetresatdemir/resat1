import 'package:flutter/material.dart';
import 'package:resat/BurgerListView/data/food_,model.dart';
import 'package:resat/BurgerListView/data/toppics_model.dart';
import 'data/toppics.dart';
//import 'package:resat/cart/cart_bloc.dart';
import 'package:resat/cart/cart_page.dart';
import 'package:resat/BurgerListView/const/themeColor.dart';





class decor extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<decor> {
  List name = [
    'ketchup',
    'mayo',
    'lettuce',
    'oninon',
  ];

  List ketchup = [
    'No',
    'light',
    'regular',
    'extra',
  ];
  List calori = ['0 Cal', '1 Cal', '2 Cal', '3 Cal'];
  var i = 2;
  var n = 0;

  final List<topics> _topics = categories;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      margin: EdgeInsets.all(6), //space between other listtiles
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: ListTile(
          title: Row(children: [
            Expanded(
              child: Text(
                name[n] + "\n" + calori[i],
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: (InkWell(
                child: Text("-", textAlign: TextAlign.center),
                onTap: () {
                  setState(() {
                    if (i <= 0) {
                      i = i;
                    } else
                      i--;
                    print(i);
                  });
                },
              )),
            ),
            Expanded(child: Text(ketchup[i], textAlign: TextAlign.center)),
            Expanded(
              child: (InkWell(
                child: Text("+", textAlign: TextAlign.center),
                onTap: () {
                  setState(() {
                    if (i > 2) {
                      i = i;
                    } else
                      i++;
                    print(i);
                  });
                },
              )),
            ),
          ]),
          leading: Icon(Icons.pie_chart)),
    );
  }
}
