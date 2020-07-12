import 'package:fluffyclientside/utlis/Exports.dart';

class MyRepeatedOrders extends StatefulWidget {


  @override
  _MyRepeatedOrdersState createState() => _MyRepeatedOrdersState();
}

class _MyRepeatedOrdersState extends State<MyRepeatedOrders>
    with TickerProviderStateMixin {
  var tabs;
  TabController controller;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<QuerySnapshot>(
          stream: Connections.db.collection('Orders').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              var myRepeatedLengh = snapshot.data.documents
                  .where((l) =>
              l.data['repeated_status'] == true &&
                  currentUser != null ? l.data['uid'] ==  currentUser.uid : l.data['uid'] ==  'noUser')
                  .toList()
                  .length;
              controller = new TabController(length: myRepeatedLengh, vsync: this);
              tabs = List<Tab>.generate(myRepeatedLengh, (int index) {
                return new Tab(text: "Pack ${index + 1}");
              });
              return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: myRepeatedLengh == 0 || myRepeatedLengh == null
                    ? Container(
                  color: Colors.white,
                  child: Center(child: Text('No Orders yet')),
                )
                    : StreamBuilder<QuerySnapshot>(
                    stream: Connections.db.collection('Orders').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return TabBar(
                          isScrollable: true,
                          unselectedLabelColor: Colors.black,
                          labelColor: FluffyColors.BrandColor,
                          indicatorColor: FluffyColors.BrandColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          onTap: (value) {
                            print(value);
                          },
                          indicator: new BubbleTabIndicator(
                            indicatorHeight: 25.0,
                            indicatorColor: FluffyColors.BrandColor,
                            tabBarIndicatorSize: TabBarIndicatorSize.tab,
                          ),
                          tabs: tabs,
                          controller: controller,
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
              ),
              body: myRepeatedLengh == 0 || myRepeatedLengh == null
                  ? Container(color: Colors.white,child:Center(child: Text('No repeated orders yet')))
                  : StreamBuilder<QuerySnapshot>(
                  stream: Connections.db.collection('Orders').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TabBarView(
                        controller: controller,
                        children: snapshot.data.documents
                            .where((l) =>
                        l.data['repeated_status'] == true &&
                            currentUser != null ? l.data['uid'] ==  currentUser.uid : l.data['uid'] ==  'noUser')
                            .map((doc) {
                          return Container(
                            color: Colors.white,
                            child: new Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return orderItem(false, context,
                                          img: doc.data['products'][index]['img'],
                                          itemPrice: doc.data['products'][index]
                                          ['price'],
                                          qty: doc.data['products'][index]['qty'],
                                          title: doc.data['products'][index]
                                          ['name']);
                                    },
                                    itemCount:
                                    doc.data['products'].toList().length,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 3,
                                        child: Divider(
                                          color:
                                          FluffyColors.LabelColor.withOpacity(
                                              0.3),
                                        ),
                                        width:
                                        MediaQuery.of(context).size.width - 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 16.0, top: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Repeated on',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              doc.data['repeated_days'],
                                              style: TextStyle(
                                                color: FluffyColors.LabelColor,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Total subscription',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                doc.data['final_price']
                                                    .toString(),
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
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          GestureDetector(
                                            child: Text(
                                              'Cancel Order',
                                              style: TextStyle(
                                                  color: FluffyColors.BrandColor,
                                                  fontSize: 15),
                                            ),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                barrierDismissible:
                                                false, // user must tap button for close dialog!
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Cancel Order'),
                                                    content: const Text(
                                                        'Are you Sure to Cancel this Order? '),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child:
                                                        const Text('CANCEL'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child:
                                                        const Text('ACCEPT'),
                                                        onPressed: () {
                                                          Connections.db
                                                              .collection(
                                                              'Orders')
                                                              .document(
                                                              doc.documentID)
                                                              .delete();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
            );}
            else {return SizedBox();}
         
        }
      ),
    );
  }
}
