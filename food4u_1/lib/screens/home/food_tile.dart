import 'package:flutter/material.dart';
import 'package:food4u/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;

  FoodTile({this.food});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 70,
              minHeight: 60,
              maxWidth: 70,
              maxHeight: 60,
            ),
            child: Image.asset('${food.photoUrl}', fit: BoxFit.cover),
          ),
          title: Text(
            '${food.name}',
            style: TextStyle(fontSize: 20.0),
          ),
          subtitle: Text('${food.ownerName}'),
          trailing: Text('RM${food.price}'),
        ),
      ),
    );
  }
}
