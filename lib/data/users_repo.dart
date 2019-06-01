import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/users.dart';

class UsersRepo {
  Future<Users> fetchUsers() async {
    CollectionReference reference = Firestore.instance.collection('users');
    QuerySnapshot querySnapshot = await reference.getDocuments();

    for (DocumentSnapshot docSnapshot in querySnapshot.documents) {
      Users users = Users.fromSnapShot(docSnapshot);
      print(users.name);
      print(users.photoUrl);
      return users;
    }
  }
}
