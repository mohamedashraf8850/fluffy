import 'package:fluffyclientside/utlis/Exports.dart';

Widget productItem({DocumentSnapshot doc, cart}) {
  int count = 1;
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Image.network(
                  doc.data['img'],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                doc.data['name'],
                style: TextStyle(
                  color: FluffyColors.TextColor,
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '$count Pcs',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  RichText(
                    text: TextSpan(
                        text: '${doc.data['price']}',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'EGP',
                            style: TextStyle(
                              fontSize: 8,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 30,
                width: 80,
                child: RaisedButton(
                  onPressed: () {
                    print(doc.documentID);
                    cart.add(Item(
                        title: '${doc.data['name']}',
                        price: doc.data['price'],
                        count: 1,
                        id: doc.documentID,
                        image: '${doc.data['img']}',
                        countView: 1,
                        priceView: doc.data['price']));
                    Fluttertoast.showToast(
                        msg: "${doc.data['name']} is Added in Cart ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: FluffyColors.BrandColor)),
                  color: FluffyColors.BrandColor,
                  child: Text(
                    'ADD TO CART',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget productList({String docId}) {
  return Consumer<Cart>(builder: (context, cart, child) {
    return StreamBuilder<QuerySnapshot>(
        stream: Connections.db.collection('Products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: FluffyColors.BGColor,
                child: GridView(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  children: snapshot.data.documents
                      .where((l) => l.data['type'] == docId)
                      .toList()
                      .map((doc) {
                    return GestureDetector(
                      onTap: () {
                        ProductDetailDialog(context, index: doc);
                      },
                      child: productItem(cart: cart, doc: doc),
                    );
                  }).toList(),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        });
  });
}
