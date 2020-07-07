import 'package:fluffyclientside/utlis/Exports.dart';

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
          appBar: orderAppBar(context),
          body: TabBarView(
            children: [
              MyInProgressOrders(),
              MyRepeatedOrders(),
              MyScheduledOrders(),
            ],
          )),
    );
  }
}
