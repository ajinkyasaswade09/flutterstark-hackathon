import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String name;
  String photoUrl;
  String userId;

  final DocumentReference documentReference;

  Users(this.name, this.photoUrl, this.userId, this.documentReference);

  Users.fromMap(Map<String, dynamic> map, {this.documentReference})
      : assert(map['user_id'] != null),
        assert(map['name'] != null),
        assert(map['photo_url'] != null),
        userId = map['user_id'],
        name = map['name'],
        photoUrl = map['photo_url'];

  Users.fromSnapShot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, documentReference: snapshot.reference);
}
