import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
class RecipeApi{
  final Firestore _db = Firestore.instance;
  CollectionReference ref;
  RecipeApi(){
    ref = _db.collection('recipe');
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> getStreamDataCollection() {
    return ref.snapshots();
  }
}