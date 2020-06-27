import 'package:fluffyclientside/utlis/Exports.dart';

Widget adverPackageItem_Cate(DocumentSnapshot doc, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    textDirection: TextDirection.ltr,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: GestureDetector(
              child: Stack(children: <Widget>[
            Image.network(
              '${doc.data['img']}',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width - 100,
              height: 150,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width - 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${doc.data['name']}',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                          text: 'Get it',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Now!',
                              style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 7,
                    //offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ])),
        ),
      ),
    ],
  );
}

Widget adverCatPackage_Cate() {
  return StreamBuilder<QuerySnapshot>(
      stream: Connections.db.collection('Packages').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.documents.map((doc) {
                      return GestureDetector(
                        onTap: () {
                          ProductDetailDialog(context, index: doc);
                        },
                        child: adverPackageItem_Cate(doc, context),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      });
}
