import 'Exports.dart';

class Connections {
  static final db = Firestore.instance;
  String docId;

  readData() async {
    return await db
        .collection("Products")
        .where("Prod1", isEqualTo: "Prod1")
        .getDocuments();

    //DocumentSnapshot snapshot = await db.collection('$collectionName').document().get();
//    DocumentSnapshot snapshot =
//        await db.collection('$collectionName').document().get();
//    return snapshot.data;
  }
}
