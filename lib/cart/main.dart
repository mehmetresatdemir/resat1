import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:resat/cart/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:resat/cart/bloc/cartlistBloc.dart';
import 'package:resat/cart/bloc/provider.dart';
import 'package:resat/cart/bloc/listTileColorBloc.dart';
import 'package:resat/BurgerListView/data/food_,model.dart';
import 'package:resat/BurgerListView/const/themeColor.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        //add yours BLoCs controlles
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        title: "Food Delivery",
        debugShowMaterialGrid: false,
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 45),
              for (var foodItem in fooditemList.foodItems)
                Builder(
                  builder: (context) {
                    return ItemContainer(foodItem: foodItem);
                  },
                )
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
        ));
  }
}


class ItemContainer extends StatelessWidget {
  ItemContainer({
    @required this.foodItem,
  });

  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        final snapshot = await Firestore.instance.collection('cart').document('LIihBLtbfuJ8Dy640DPd').get();
        if(snapshot.exists) {

          Firestore.instance.collection("cart")
              .document("LIihBLtbfuJ8Dy640DPd")
              .setData({foodItem.name: {

            'itemName': foodItem.name,
            'imgUrl': foodItem.imageAssetPath,
            'itemPrice': foodItem.price,
            "quantity": FieldValue.increment(1)}}, merge: true);







        }else {
          Firestore.instance.runTransaction((Transaction transaction) async {
            await transaction.update(
                Firestore.instance
                    .collection("cart")
                    .document("LIihBLtbfuJ8Dy640DPd"),
                {
                  foodItem.name: {
                    'itemName': foodItem.name,
                    'imgUrl': foodItem.imageAssetPath,
                    'itemPrice': foodItem.price,
                    'quantity': 1,
                  }
                });
          });
        }

        final snackBar = SnackBar(
          content: Text('${foodItem.name} added to Cart'),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        itemName: foodItem.name,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imageAssetPath,
        leftAligned: (foodItem.id % 2) == 0 ? true : false,
      ),
    );
  }
}

class Items extends StatelessWidget {
  Items({
    @required this.leftAligned,
    @required this.imgUrl,
    @required this.itemName,
    @required this.itemPrice,
  });

  final bool leftAligned;
  final String imgUrl;
  final String itemName;
  final double itemPrice;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 : containerPadding,
            right: leftAligned ? containerPadding : 0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned
                        ? Radius.circular(0)
                        : Radius.circular(containerBorderRadius),
                    right: leftAligned
                        ? Radius.circular(containerBorderRadius)
                        : Radius.circular(0),
                  ),
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(
                    left: leftAligned ? 20 : 0,
                    right: leftAligned ? 0 : 20,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  )),
                            ),
                            Text("\$$itemPrice",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: containerPadding),
                      ])),
            ],
          ),
        )
      ],
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key key,
    @required this.categoryIcon,
    @required this.categoryName,
    @required this.availability,
    @required this.selected,
  }) : super(key: key);

  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? Themes.color : Colors.white,
        border: Border.all(
            color: selected ? Colors.transparent : Colors.grey[200],
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 15,
            offset: Offset(15, 0),
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: selected ? Colors.transparent : Colors.grey[200],
                    width: 1.5)),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 45),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Food",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          Text(
            "Delivery",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 30,
            ),
          ),
        ],
      )
    ],
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<FoodItem> foodItems = snapshot.data;
              int length = foodItems != null ? foodItems.length : 0;

              return buildGestureDetector(length, context, foodItems);
            },
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<FoodItem> foodItems) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 30),
        child: Text(length.toString()),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.yellow[800], borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
