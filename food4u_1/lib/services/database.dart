import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food4u/models/food.dart';
import 'package:food4u/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference foodCollection =
      FirebaseFirestore.instance.collection('foods');

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  //update user data
  Future updateUserData(
      String email, String name, String phoneNo, String address) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'name': name,
      'phoneNo': phoneNo,
      'address': address,
    });
  }

  //update Food Data
  Future updateFoodData(String name, String ownerName, String description,
      String photoUrl, double price) async {
    return await foodCollection.doc(uid).set({
      'name': name,
      'ownerName': ownerName,
      'description': description,
      'photoUrl': photoUrl,
      'price': price,
    });
  }

  // food list from snapshot
  List<Food> _foodListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Food(
        name: doc.data()['name'] ?? '',
        ownerName: doc.data()['ownerName'] ?? '',
        description: doc.data()['description'] ?? '',
        photoUrl: doc.data()['photoUrl'] ?? '',
        price: doc.data()['price'] ?? 0,
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      email: snapshot.data()['email'],
      name: snapshot.data()['name'],
      phoneNo: snapshot.data()['phoneNo'],
      address: snapshot.data()['address'],
    );
  }

  Stream<List<Food>> get foods {
    return foodCollection.snapshots().map(_foodListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
