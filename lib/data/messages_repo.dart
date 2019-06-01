import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/messages.dart';

class MessagesRepo {
  Future<Messages> fetchMessages() async {
    CollectionReference reference = Firestore.instance.collection('messages');
    QuerySnapshot querySnapshot = await reference.getDocuments();

    for (DocumentSnapshot docSnapshot in querySnapshot.documents) {
      Messages messages = Messages.fromSnapShot(docSnapshot);
      print(messages.content);
      print(messages.idTo);
      return messages;
    }
  }
}
