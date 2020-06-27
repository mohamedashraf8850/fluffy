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

Widget catList(BuildContext context, withSearch, {String textSearch}) {
  return Expanded(
    flex: 2,
    child: StreamBuilder<QuerySnapshot>(
        stream: Connections.db.collection('Categories').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                print(snapshot.data.documents.map((e) => e.data['name']));
                return GridView(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  children: withSearch == false
                      ? snapshot.data.documents.map((doc) {
                          var listIndex = snapshot.data.documents
                              .map((e) => e.data['name']);
                          var passIndex =
                              listIndex.toList().indexOf(doc.data['name']);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CatHome(
                                          index: passIndex,
                                          len: snapshot.data.documents.length,
                                        )),
                              );
                            },
                            child: catItem(doc),
                          );
                        }).toList()
                      : snapshot.data.documents
                          .where((l) => l.data['name'] == textSearch)
                          .toList()
                          .map((doc) {
                          var listIndex = snapshot.data.documents
                              .map((e) => e.data['name']);
                          var passIndex =
                              listIndex.toList().indexOf(doc.data['name']);

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CatHome(
                                          index: passIndex,
                                          len: snapshot.data.documents.length,
                                        )),
                              );
                            },
                            child: catItem(doc),
                          );
                        }).toList(),
                );
            }
          } else {}
          return SizedBox();
        }),
  );
}
