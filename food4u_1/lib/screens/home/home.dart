import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:food4u/models/food.dart';
import 'package:food4u/screens/profile/profile.dart';
import 'package:food4u/services/auth.dart';
import 'package:food4u/services/database.dart';
import 'package:provider/provider.dart';
import 'food_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _selectedIndex = 0;

  List<Widget> _bottomBarOption = <Widget>[
    Container(child: FoodList()),
    Container(
      child: Profile(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Food>>.value(
        value: DatabaseService().foods,
        initialData: null,
        child: Scaffold(
          backgroundColor: Colors.blue[100],
          appBar: AppBar(
            title: Text('Find food near you',
                style: TextStyle(color: Colors.blue[800])),
            backgroundColor: Colors.white,
            elevation: 10.0,
            actions: <Widget>[
              Image.asset('assets/Food4U.png'),
            ],
          ),
          body: Container(
            child: _bottomBarOption.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ));
  }
}
