import 'package:fluffyclientside/utlis/Exports.dart';

Widget catItem(DocumentSnapshot doc) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    textDirection: TextDirection.ltr,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 1.0, left: 1.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: GestureDetector(
            onTap: null,
            child: Image.network(
              '${doc.data['img']}',
              fit: BoxFit.fill,
              width: 170,
              height: 120,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 8.0),
        child: Text(
          '${doc.data['name']}',
          style: TextStyle(fontSize: 13, color: Colors.black),
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}

Widget catList(BuildContext context) {
  return Expanded(
    flex: 2,
    child: StreamBuilder<QuerySnapshot>(
        stream: Connections.db.collection('Categories').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView(
              scrollDirection: Axis.vertical,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              shrinkWrap: true,
              children: snapshot.data.documents.map((doc) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CatHome(index: doc.data['index'],productsId: doc.data['products'],len: snapshot.data.documents.length,)),
                    );
                  },
                  child: catItem(doc),
                );
              }).toList(),
            );
          } else {
            return SizedBox();
          }
        }),
  );
}
