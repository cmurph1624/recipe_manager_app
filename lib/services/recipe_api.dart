import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

enum DocumentName{
  recipe,
  ingriedent,
  direction
}

class RecipeApi{
  final Firestore _db = Firestore.instance;
  CollectionReference ref;
  RecipeApi(String dm){
    ref = _db.collection(dm);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> getStreamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }
}