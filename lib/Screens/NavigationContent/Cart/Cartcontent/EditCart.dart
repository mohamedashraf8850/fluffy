import 'package:fluffyclientside/utlis/Exports.dart';

class EditCartPage extends StatefulWidget {
  @override
  _EditCartPageState createState() => _EditCartPageState();
}

class _EditCartPageState extends State<EditCartPage> with TickerProviderStateMixin {

  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Dismissible(
                    key: Key(item),
                    onDismissed: (direction) {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    background: Container(color: Colors.red,child: Icon(Icons.delete,color: Colors.white,)),
                    child: orderItem(
                        true,
                        img:
                        'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg',
                        itemPrice: '7.00',
                        qty: '4',
                        itemCount: 3,
                        title: 'Rich Bake Shami Bread'),
                  );
                },
                itemCount: items.length,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Subtotal',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '7.00',
                              style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:2.0),
                              child: Text(
                                'EGP',
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Delivery Fees',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '7.00',
                              style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:2.0),
                              child: Text(
                                'EGP',
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              '7.00',
                              style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:2.0),
                              child: Text(
                                'EGP',
                                style: TextStyle(color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
