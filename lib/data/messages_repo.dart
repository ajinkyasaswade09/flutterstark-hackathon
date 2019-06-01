import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/messages.dart';

class MessagesRepo {
  Future<Messages> fetchMessages() async {
    CollectionReference reference = Firestore.instance.collection('messages');
    QuerySnapshot querySnapshot = await reference.getDocuments();
    var stream = await reference.getDocuments().asStream();
    stream.listen((querySnapshot) {
      for (DocumentSnapshot docSnapshot in querySnapshot.documents) {
        Messages m = Messages.fromSnapShot(docSnapshot);
        print(m.content);
        print(m.idTo);
      }
    });

    /*for (DocumentSnapshot docSnapshot in querySnapshot.documents) {
      Messages messages = Messages.fromSnapShot(docSnapshot);
      print(messages.content);
      print(messages.idTo);
      return messages;
    }*/
  }

  addMessage(
      String comment, String idFrom, String idTo, String timeStamp) async {
    Map<String, dynamic> map = {
      'content': comment,
      'id_from': idFrom,
      'id_to': idTo,
      'timestamp': timeStamp,
    };
    var reference = Firestore.instance.collection('messages').reference();
    reference.add(map);
  }
}
