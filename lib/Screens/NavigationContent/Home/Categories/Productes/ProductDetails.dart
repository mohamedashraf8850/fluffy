import 'package:fluffyclientside/utlis/Exports.dart';

Widget ProductDetailDialog(BuildContext context, {DocumentSnapshot index}) {
  showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (context) {
      return Consumer<Cart>(builder: (context, cart, child) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.all(10),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 400,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(18.0),
                                child: Image.network('${index.data['img']}',
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Text(
                              '${index.data['name']}',
                              style: TextStyle(
                                  color: FluffyColors.BrandColor, fontSize: 15),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SingleChildScrollView(
                              child: Text(
                                '''${index.data['desc']}
            ''',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: FluffyColors.TextColor,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: -25,
                        child: Center(
                          child: RaisedButton(
                            onPressed: () {
                              cart.add(Item(
                                  title: '${index.data['name']}',
                                  price: index.data['price'],
                                  count: 1,
                                  id: index.documentID,
                                  image: '${index.data['img']}',
                                  countView: 1,
                                  priceView: index.data['price']));
                              Fluttertoast.showToast(
                                  msg: "${index.data['name']} is Added in Cart",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side:
                                    BorderSide(color: FluffyColors.BrandColor)),
                            color: FluffyColors.BrandColor,
                            child: Text(
                              'ADD TO CART',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ))
                  ],
                ));
          },
        );
      });
    },
  );
}
