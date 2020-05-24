import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference recordCollection =
      Firestore.instance.collection('records');

  Future updateUserData(String sugars, String name, int strength) async {
    return await recordCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
