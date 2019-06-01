import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  String content;
  String idFrom;
  String idTo;
  String timestamp;

  final DocumentReference documentReference;

  Messages(this.content, this.idFrom, this.idTo, this.timestamp,
      this.documentReference);

  Messages.fromMap(Map<String, dynamic> map, {this.documentReference})
      : assert(map['content'] != null),
        assert(map['id_from'] != null),
        assert(map['id_to'] != null),
        assert(map['timestamp'] != null),
        content = map['content'],
        timestamp = map['timestamp'],
        idFrom = map['id_from'],
        idTo = map['id_to'];

  Messages.fromSnapShot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, documentReference: snapshot.reference);
}
