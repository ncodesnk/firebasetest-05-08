import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future saveInFB(String value1, String value2) async {
    final dataDaveReference = FirebaseFirestore.instance.collection("My-Data");
    return await dataDaveReference.doc().set({
      'Value 1' : value1,
      'Value 2' : value2
    });
  }
}