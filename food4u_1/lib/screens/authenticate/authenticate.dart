import 'package:flutter/material.dart';
import 'package:food4u/screens/authenticate/register.dart';
import 'package:food4u/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignInButton = true;
  void toggleView() {
    setState(() {
      showSignInButton = !showSignInButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInButton) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
