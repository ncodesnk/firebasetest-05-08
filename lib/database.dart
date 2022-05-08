import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/models/data.dart';

class DatabaseService {

  //! upload data
  Future saveInFB(String value1, String value2) async {
    final dataDaveReference = FirebaseFirestore.instance.collection("My-Data");
    return await dataDaveReference.doc().set({
      'Value 1' : value1,
      'Value 2' : value2
    });
  }

  //! get data
  final getValuesReference = FirebaseFirestore.instance.collection("My-Data");
  List<DataModel> _values(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      return DataModel(
        data1: doc.get('Value 1'),
        data2: doc.get('Value 2')
      );
    }).toList();
  }
  Stream<List<DataModel>> get values {
    return getValuesReference.snapshots().map(_values);
  }
}