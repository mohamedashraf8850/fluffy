import 'package:fluffyclientside/utlis/Exports.dart';

Widget myRepeatedOrders(BuildContext context) {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Pack 1"),
    new Tab(text: "Pack 2"),
    new Tab(text: "Pack 3")
  ];

  TabController _tabController;

  return Container(
    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
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
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  tabs.map((Tab tab) {
              return new Center(
                  child: new Text(
                    tab.text,
                    style: new TextStyle(
                        fontSize: 20.0
                    ),
                  )
              );
            }).toList(),
            /*
Column(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Total',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '28.00',
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
                              onTap: null,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ));
               */
          ),
      ),
    );
}
