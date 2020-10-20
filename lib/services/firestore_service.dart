import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  FirestoreService({@required String uid}) : assert(uid != null) {
    this.uid = uid;
    firestore = Firestore.instance;
    firestore.settings(persistenceEnabled: false);
  }
  String uid;
  Firestore firestore;
}
