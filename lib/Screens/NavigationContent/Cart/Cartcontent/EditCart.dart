import 'package:fluffyclientside/utlis/Exports.dart';

class EditCartPage extends StatefulWidget {
  @override
  _EditCartPageState createState() => _EditCartPageState();
}

class _EditCartPageState extends State<EditCartPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    num deliveryFees;
    num totalP;

    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        body: cart.basketItems.length == 0
            ? Center(
                child: Text(
                'no items in your cart',
                style: TextStyle(
                    color: FluffyColors.BrandColor,
                    fontWeight: FontWeight.bold),
              ))
            : Container(
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
                          final item = cart.basketItems[index].title;
                          return Dismissible(
                            key: Key(item),
                            onDismissed: (direction) {
                              setState(() {
                                cart.remove(cart.basketItems[index]);
                                cart.basketItems.removeAt(index);
                              });
                            },
                            background: Container(
                                color: Colors.red,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                            child: orderItem(true, context,
                                index: index,
                                img: cart.basketItems[index].image.toString(),
                                itemPrice:
                                    cart.basketItems[index].price.toString(),
                                itemCount:
                                    cart.basketItems[index].count.toString(),
                                title: cart.basketItems[index].title),
                          );
                        },
                        itemCount: cart.basketItems.length,
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      cart.totalPrice.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2.0),
                                      child: Text(
                                        'EGP',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
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
                                  'Delivery fees',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                StreamBuilder<QuerySnapshot>(
                                    stream: Connections.db
                                        .collection('Delivery_fees')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        deliveryFees = snapshot
                                            .data.documents[0].data['fees'].toDouble();
                                        return Row(
                                          children: snapshot.data.documents
                                              .map((doc) {
                                            return Row(
                                              children: <Widget>[
                                                Text(
                                                    deliveryFees.toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2.0),
                                                  child: Text(
                                                    'EGP',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    })
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                StreamBuilder<QuerySnapshot>(
                                    stream: Connections.db
                                        .collection('Delivery_fees')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        totalP = cart.totalPrice.toDouble() +
                                            snapshot
                                                .data.documents[0].data['fees'];
                                        return Row(
                                          children: <Widget>[
                                            Text(
                                              totalP == null
                                                  ? 'loading..'
                                                  : totalP.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2.0),
                                              child: Text(
                                                'EGP',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    })
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
    });
  }
}
