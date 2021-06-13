import 'package:flutter/material.dart';
import 'package:food4u/services/auth.dart';
import 'package:food4u/shared/constants.dart';
import 'package:food4u/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String name = '';
  String phoneNo = '';
  String address = '';
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
                title: Text('Register to Food4U'),
                actions: <Widget>[
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign In'),
                  )
                ]),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/Food4U.png', scale: 1.5),
                        //______________EMAIL_____________
                        TextFormField(
                          decoration:
                              inputDecoration.copyWith(hintText: 'Email'),
                          validator: (value) =>
                              value.isEmpty ? 'Enter a valid email' : null,
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                        ),
                        SizedBox(height: 10.0),
                        //______________PASSWORD_____________
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
                        SizedBox(height: 10.0),
                        //______________NAME_____________
                        TextFormField(
                          decoration:
                              inputDecoration.copyWith(hintText: 'Name'),
                          validator: (value) =>
                              value.isEmpty ? 'Enter a name' : null,
                          onChanged: (value) {
                            setState(() => name = value);
                          },
                        ),
                        SizedBox(height: 10.0),
                        //______________Phone No_____________
                        TextFormField(
                          decoration:
                              inputDecoration.copyWith(hintText: 'Phone No'),
                          validator: (value) =>
                              value.isEmpty ? 'Enter a Phone No' : null,
                          onChanged: (value) {
                            setState(() => phoneNo = value);
                          },
                        ),
                        SizedBox(height: 10.0),
                        //______________ADDRESS_____________
                        TextFormField(
                          decoration:
                              inputDecoration.copyWith(hintText: 'Address'),
                          validator: (value) =>
                              value.isEmpty ? 'Enter Address' : null,
                          onChanged: (value) {
                            setState(() => address = value);
                          },
                        ),
                        SizedBox(height: 10.0),

                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.black),
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerwithEmailAndPassword(
                                        email,
                                        password,
                                        name,
                                        phoneNo,
                                        address);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
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
