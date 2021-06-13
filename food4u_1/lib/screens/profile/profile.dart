import 'package:flutter/material.dart';
import 'package:food4u/models/user.dart';
import 'package:food4u/screens/profile/edit_profile.dart';
import 'package:food4u/services/auth.dart';
import 'package:food4u/services/database.dart';
import 'package:food4u/shared/loading.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);

    return StreamBuilder(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.blue[100],
              body: SafeArea(
                  child: Column(
                children: [
                  //for circle avatar image
                  _getHeader(),
                  SizedBox(
                    height: 5,
                  ),
                  _profileName("${userData.name}"),
                  SizedBox(
                    height: 14,
                  ),
                  _heading("Personal Details"),
                  SizedBox(
                    height: 6,
                  ),
                  _detailsCard(userData),
                  SizedBox(
                    height: 10,
                  ),
                  _heading("Settings"),
                  SizedBox(
                    height: 6,
                  ),
                  _settingsCard(),
                  Spacer(),
                  logoutButton()
                ],
              )),
            );
          } else {
            return Loading();
          }
        });
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.all(Radius.circular(10.0)),
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/default.png')), // color: Colors.orange[100],
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard(UserData userData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.email),
              title: Text("${userData.email}"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("${userData.phoneNo}"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("${userData.address}"),
            )
          ],
        ),
      ),
    );
  }

  Widget _settingsCard() {
    void _showEditProfilePanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: EditProfileForm(),
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => _showEditProfilePanel(),
            ),
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return InkWell(
      onTap: () async {
        return await _auth.signOut();
      },
      child: Container(
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
