import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String> crear(String coleccion, Map<String, dynamic> data) async {
    final doc = await _db.collection(coleccion).add(data);
    return doc.id;
  }

  Future<void> actualizar(String coleccion, String uid, Map<String, dynamic> data) async {
    await _db.collection(coleccion).doc(uid).update(data);
  }

}