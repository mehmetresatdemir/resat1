import 'package:flutter/material.dart';
import '../decoration.dart';

class FoodItems {
  // add other properties like title name or etc in this class.
  final String imageAssetPath;
  final String name;
  final int number;
  final double price;

  FoodItems({this.name, this.number, this.imageAssetPath, this.price});
}
