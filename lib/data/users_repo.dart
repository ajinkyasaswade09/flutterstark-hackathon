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

  addUser() async {
    Map<String, dynamic> map = {
      'user_id': '1234567',
      'name': 'Name from Code',
      'photo_url': 'https://randomuser.me/api/portraits/women/81.jpg'
    };
    var reference = Firestore.instance.collection('users').reference();
    reference.add(map);
  }
}
