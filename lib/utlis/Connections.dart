import 'Exports.dart';

class Connections {
  static final  db = Firestore.instance;
  String docId;

  dynamic readData({String collectionName}) async {
    DocumentSnapshot snapshot =
        await db.collection('$collectionName').document().get();
    return snapshot.data;
  }
}
