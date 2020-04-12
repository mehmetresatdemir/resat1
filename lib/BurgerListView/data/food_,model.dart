import 'package:flutter/cupertino.dart';



FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    name: "Item1",
    imageAssetPath: "android/assets/wraps/wrap1.jpeg",
    id: 5,
    price: 10.0,
    quantity: 1,
  ),
  FoodItem(
    name: "Item2",
    imageAssetPath: "android/assets/wraps/wrap2.jpeg",
    id: 2,
    price: 20.0,
    quantity: 1,
  ),

  FoodItem(
    name: "Item3",
    imageAssetPath: "android/assets/wraps/wrap3.jpeg",
    id: 3,
    price: 30.0,
    quantity: 1,
  ),
  FoodItem(
    name: "Item4",
    imageAssetPath: "android/assets/wraps/wrap1.jpeg",
    id: 4,
    price: 40.0,
    quantity: 1,
  ),
  FoodItem(
    name: "Item5",
    imageAssetPath: "android/assets/wraps/wrap1.jpeg",
    id: 5,
    price: 50.0,
  ),
  FoodItem(
    name: "Item6",
    imageAssetPath: "android/assets/images/lunch.jpeg",
    id: 6,
    price: 60.0,
  ),
  FoodItem(
    name: "Item7",
    imageAssetPath: "android/assets/images/lunch.jpeg",
    id: 7,
    price: 70.0,
  ),
  FoodItem(
    name: "Item8",
    imageAssetPath: "android/assets/images/lunch.jpeg",
    id: 8,
    price: 12.0,
  ),
  FoodItem(
    name: "Item 9",
    imageAssetPath: "android/assets/images/lunch.jpeg",
    id: 9,
    price: 12.0,
  ),
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  // add other properties like title name or etc in this class.
  final String imageAssetPath;
  final String name;
  final int id;
  final double price;
  int quantity;

  FoodItem({
    @required this.imageAssetPath,
    @required this.name,
    @required this.id,
    @required this.price,
    this.quantity =1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}