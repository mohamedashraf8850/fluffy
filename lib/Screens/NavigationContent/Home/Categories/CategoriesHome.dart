import 'package:fluffyclientside/utlis/Exports.dart';

class CatHome extends StatefulWidget {
  final int index, len;
  List productsId;

  CatHome({Key key, this.index, this.productsId, this.len}) : super(key: key);
  @override
  _CatHomeState createState() => _CatHomeState();
}

class _CatHomeState extends State<CatHome> with TickerProviderStateMixin {

  TabController controller;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = new TabController(
        length: widget.len, vsync: this, initialIndex: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: catAppBar(context),
      backgroundColor: Colors.white,
      body: Scaffold(
        backgroundColor: Colors.white,
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
                          color: FluffyColors.BrandColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(child: adverCatPackage_Cate()),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: Connections.db.collection('Categories').snapshots(),
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
                        tabs: snapshot.data.documents
                            .map((doc) => (Tab(text: doc.data['name'])))
                            .toList(),
                        controller: controller,
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
            ],
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Connections.db.collection('Categories').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return TabBarView(
                    controller: controller,
                    children: snapshot.data.documents
                        .map((doc) => (productList()))
                        .toList()
                );
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }
}
