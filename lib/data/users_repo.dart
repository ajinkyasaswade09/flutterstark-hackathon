import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/users.dart';

class UsersRepo {
  List<Users> usersList;

  Future<List<Users>> fetchUsers() async {
    CollectionReference reference = Firestore.instance.collection('users');
    QuerySnapshot querySnapshot = await reference.getDocuments();
    print('Length ' + querySnapshot.documents.length.toString());

    for (DocumentSnapshot docSnapshot in querySnapshot.documents) {
      Users users = Users.fromSnapShot(docSnapshot);
      print(users.name);
      print(users.photoUrl);
      usersList.add(users);
    }
    return usersList;
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

  List<Users> getUserList() {
    List<Users> usersList = new List();
    fetchUsers().then((userList) {
      print('From main ' + userList[0].name);
      print('From main ' + userList[0].photoUrl);
      usersList.addAll(userList);
    });
    return usersList;
  }

  UsersRepo() {
    usersList = new List();
  }
}
