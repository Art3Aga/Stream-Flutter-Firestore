import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  
  final _aFS = Firestore.instance;
  Stream<dynamic> streamDatos;
  StreamSubscription<DocumentSnapshot> conductor;
  Stream<DocumentSnapshot> getData() {
    return _aFS.collection('motoristas').document('Albery Arteaga-998').snapshots();
  }

}