import 'package:fluffyclientside/utlis/Exports.dart';

class CatHome extends StatefulWidget {
  @override
  _CatHomeState createState() => _CatHomeState();
}

class _CatHomeState extends State<CatHome> with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Bread"),
    new Tab(text: "Vegetables"),
    new Tab(text: "Fruits"),
    new Tab(text: "Spices")
  ];

  TabController controller;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: catAppBar(context),
      backgroundColor: Colors.white,
      body: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(260.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Subscribe for our Special \nbraed collections',
                      style: TextStyle(
                          color: FluffyColors.BrandColor, fontSize: 20,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(child: adverCatPackage_Cate()),
                  ],
                ),
              ),
              TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                labelColor: FluffyColors.BrandColor,
                indicatorColor: FluffyColors.BrandColor,
                indicatorSize: TabBarIndicatorSize.tab,
                onTap: (value) {
                  print(value);
                },
                tabs: tabs,
                controller: controller,
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: tabs.map((Tab tab) {

            return productList();
          }).toList(),
        ),
      ),
    );
  }
}
