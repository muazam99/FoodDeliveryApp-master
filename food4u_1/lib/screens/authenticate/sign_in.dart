import 'package:flutter/material.dart';
import 'package:food4u/services/auth.dart';
import 'package:food4u/shared/constants.dart';
import 'package:food4u/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign in to Food4U'),
              actions: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/Food4U.png',
                          scale: 1.5,
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              inputDecoration.copyWith(hintText: 'Email'),
                          validator: (value) =>
                              value.isEmpty ? 'Enter an email' : null,
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              inputDecoration.copyWith(hintText: 'Password'),
                          validator: (value) => value.length < 6
                              ? 'Password must be 6 characters long'
                              : null,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() => password = value);
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.black),
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInwithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Could not sign in';
                                    loading = false;
                                  });
                                }
                              }
                            }),
                        SizedBox(height: 12.0),
                        Text(error,
                            style:
                                TextStyle(color: Colors.red, fontSize: 14.0)),
                      ],
                    ),
                  ),
                )),
          );
  }
}
