import 'package:flutter/material.dart';
import 'package:food4u/models/user.dart';
import 'package:food4u/services/database.dart';
import 'package:food4u/shared/constants.dart';
import 'package:food4u/shared/loading.dart';
import 'package:provider/provider.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();

  //form values;
  String _currentName;
  String _currentEmail;
  String _currentPhoneNo;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your Profile Setting',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  //Name
                  TextFormField(
                    initialValue: userData.name,
                    decoration: inputDecoration,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a name' : null,
                    onChanged: (value) => setState(() => _currentName = value),
                  ),
                  SizedBox(height: 10.0),
                  //Email
                  TextFormField(
                    initialValue: userData.email,
                    decoration: inputDecoration,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a email' : null,
                    onChanged: (value) => setState(() => _currentEmail = value),
                  ),
                  SizedBox(height: 10.0),
                  //PhoneNo
                  TextFormField(
                    initialValue: userData.phoneNo,
                    decoration: inputDecoration,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a Phone No' : null,
                    onChanged: (value) =>
                        setState(() => _currentPhoneNo = value),
                  ),
                  SizedBox(height: 10.0),
                  //Address
                  TextFormField(
                    initialValue: userData.address,
                    decoration: inputDecoration,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter Address' : null,
                    onChanged: (value) =>
                        setState(() => _currentAddress = value),
                  ),
                  SizedBox(height: 10.0),

                  //Button - update profile data
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.pink[400])),
                    child:
                        Text('Update', style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentEmail ?? userData.email,
                            _currentName ?? userData.name,
                            _currentPhoneNo ?? userData.phoneNo,
                            _currentAddress ?? userData.address);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
