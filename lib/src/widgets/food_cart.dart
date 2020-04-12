import 'package:flutter/material.dart';
import 'package:resat/Listview/ui/home/HomePage.dart';
import 'package:resat/cart/main.dart';
import 'package:resat/BurgerListView/BurgersPage.dart';

class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItems;

  FoodCard({this.categoryName, this.imagePath, this.numberOfItems});

  @override
  Widget build(BuildContext context) {
    return Container(

          color: const Color(0xDFFC143C),


      margin: EdgeInsets.only(right: 20.0),
      child: Card(
        child: GestureDetector(
          onTap: () {


            if(categoryName=="Burger")
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),);

              }



            if(categoryName=="Beers")
            {
              {
                print("burgerr");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),);
              }
            }
            if(categoryName=="Pizza")
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),);
          }

          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage(imagePath),
                  height: 65.0,
                  width: 65.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      categoryName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    Text("$numberOfItems kinds"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


