import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food4u/screens/wrapper.dart';
import 'package:food4u/services/auth.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocalUser>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
