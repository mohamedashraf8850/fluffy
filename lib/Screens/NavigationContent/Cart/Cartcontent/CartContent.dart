import 'package:fluffyclientside/utlis/Exports.dart';

class MyCartContent extends StatefulWidget {
  @override
  MyCartContentState createState() => MyCartContentState();
}

class MyCartContentState extends State<MyCartContent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: new Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return orderItem(
                    img:
                        'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg',
                    itemPrice: '7.00',
                    qty: '4',
                    title: 'Rich Bake Shami Bread');
              },
              itemCount: 5,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Container(
                  height: 3,
                  child: Divider(
                    color: FluffyColors.LabelColor.withOpacity(0.3),
                  ),
                  width: MediaQuery.of(context).size.width - 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Subtotal',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      RichText(
                        text: TextSpan(
                            text: '7.00',
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
                ),Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Delivery Fees',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      RichText(
                        text: TextSpan(
                            text: '7.00',
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
                ),Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      RichText(
                        text: TextSpan(
                            text: '7.00',
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

              ],
            ),
          ),
        ],
      ),
    );
  }
}
