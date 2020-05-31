import'package:fluffyclientside/utlis/Exports.dart';
class MyOrderTabs extends StatefulWidget {
  @override
  _MyOrderTabsState createState() => _MyOrderTabsState();
}

class _MyOrderTabsState extends State<MyOrderTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: orderAppBar(),
        body: TabBarView(
          children: [
            Icon(Icons.timer),
            Icon(Icons.timer),
            Icon(Icons.timer),
          ],
        ),
      ),
    );
  }
}
