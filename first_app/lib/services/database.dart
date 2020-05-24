import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/models/record.dart';

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

  // records list from snapshot
  List<Record> _recordListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Record(
        name: doc.data['name'] ?? '',
        sugar: doc.data['sugar'] ?? '0',
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  }

  // get record stream
  Stream<List<Record>> get records {
    return recordCollection.snapshots()
    .map(_recordListFromSnapshot);
  }
}
