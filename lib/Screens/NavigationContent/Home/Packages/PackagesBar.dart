import 'package:fluffyclientside/utlis/Exports.dart';

Widget packageItem(DocumentSnapshot doc, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    textDirection: TextDirection.ltr,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: GestureDetector(
            child: Image.network(
              '${doc.data['img']}',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width - 150,
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

Widget catPackage(BuildContext context) {
  ScrollController _scrollController = ScrollController();
  bool _isOnTop = true;

  return StatefulBuilder(
    builder: (context, setState) {
      _scrollToTop() {
        _scrollController.animateTo(_scrollController.position.minScrollExtent,
            duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
        setState(() => _isOnTop = true);
      }

      _scrollToBottom() {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
        setState(() => _isOnTop = false);
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 8.0, right: 8.0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Special packages',
                  style: TextStyle(
                      color: FluffyColors.BrandColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                GestureDetector(
                  child: Text(
                    'See all',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    textAlign: TextAlign.right,
                  ),
                  onTap: _isOnTop ? _scrollToBottom : _scrollToTop,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
              ),
              child: StreamBuilder<QuerySnapshot>(
                  stream: Connections.db.collection('Packages').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data.documents.map((doc) {
                          return GestureDetector(
                            onTap: () {
                              ProductDetailDialog(context, index: doc);
                            },
                            child: packageItem(doc, context),
                          );
                        }).toList(),
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ),
        ],
      );
    },
  );
}
