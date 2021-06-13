import 'package:flutter/material.dart';
import 'package:food4u/models/user.dart';
import 'package:food4u/screens/authenticate/authenticate.dart';
import 'package:food4u/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);
    print(user);

    //return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
