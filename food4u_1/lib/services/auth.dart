import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:food4u/models/user.dart';
import 'package:food4u/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user obj based on FirebaseUser
  LocalUser _fromFirebaseuser(User user) {
    return user != null ? LocalUser(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<LocalUser> get user {
    return _auth
        .authStateChanges()
        //.map((User user) => _fromFirebaseuser(user));
        .map(_fromFirebaseuser);
  }

  // sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _fromFirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signInwithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _fromFirebaseuser(user);
    } on FirebaseAuthException catch (e) {
      print(e);
      return null;
    }
  }

  // Register with email & password
  Future registerwithEmailAndPassword(String email, String password,
      String name, String phoneNo, String address) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      // await DatabaseService(uid: user.uid).updateFoodData(
      //     'Kek Lapis',
      //     'Muaz Restaurant',
      //     'enak dimakan begitu saja',
      //     'assets/kek_lapis.jpg',
      //     8.0);

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData(user.email, name, phoneNo, address);
      return _fromFirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
