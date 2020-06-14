import 'package:fluffyclientside/utlis/Exports.dart';

Widget ProductDetailDialog(BuildContext context , {index}) {
  showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (context) {
      return Consumer<Cart>(builder: (context, cart, child) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),),
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.all(10),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height - 400,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(18.0),
                                child: Image.network(
                                    'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg',
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Text(
                              index.title,
                              style: TextStyle(
                                  color: FluffyColors.BrandColor, fontSize: 15),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SingleChildScrollView(
                              child: Text(
                                '''Lorem ipsum dolor sit amet, consectetur 
  adipiscing elit, sed do eiusmod tempor 
  incididunt ut labore et dolore magna aliqua.
  Ut enim ad minim veniam, quis nostrud
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
                               cart.add(index);
                               Fluttertoast.showToast(
                                   msg: "${index.title} is Added in Cart with ${index.count} Items",
                                   toastLength: Toast.LENGTH_SHORT,
                                   gravity: ToastGravity.TOP,
                                   timeInSecForIosWeb: 1);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: FluffyColors.BrandColor)),
                            color: FluffyColors.BrandColor,
                            child: Text(
                              'ADD TO CART',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
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
