import 'package:flutter/material.dart';
import 'package:resat/src/data/food_data.dart';
import 'package:resat/src/widgets/food_category.dart';
import '../widgets/home_top_info.dart';
import '../widgets/searchfield.dart';
import '../widgets/bought_foods.dart';
import '../models/food_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food> _foods = Foods; //

  final textstyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(
            height: 20.0,
          ),
          SearchField(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Popular Orders",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: _foods.map(_Buildfooditems).toList(),
          ),
        ],
      ),
    );
  }

  Widget _Buildfooditems(Food food) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: BoughtFoods(
        id: food.id,
        name: food.name,
        imagePath: food.imagePath,
        ratings: food.ratings,
        discount: food.discount,
        category: food.category,
      ),
    );
  }
}
