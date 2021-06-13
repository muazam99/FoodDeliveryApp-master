import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food4u/models/food.dart';
import 'package:provider/provider.dart';
import 'food_tile.dart';

class FoodList extends StatefulWidget {
  @override
  FoodListState createState() => FoodListState();
}

class FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    final foods = Provider.of<List<Food>>(context) ?? [];

    foods.forEach((food) {
      print(food.name);
      print(food.ownerName);
      print(food.description);
      print(food.photoUrl);
      print(food.price);
    });

    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return FoodTile(food: foods[index]);
      },
    );
  }
}
