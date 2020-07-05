import 'package:fluffyclientside/utlis/Exports.dart';

class MyOrderTabs extends StatefulWidget {
  @override
  _MyOrderTabsState createState() => _MyOrderTabsState();
}

/*
snapshot.data.documents.length
 */
class _MyOrderTabsState extends State<MyOrderTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
          appBar: orderAppBar(context),
          body: StreamBuilder<QuerySnapshot>(
              stream: Connections.db.collection('Orders').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var inProgressLengh = snapshot.data.documents
                      .where((l) =>
                          l.data['normal_status'] == true &&
                          l.data['uid'] == '123456')
                      .toList()
                      .length;

                  var myRepeatedLengh = snapshot.data.documents
                      .where((l) =>
                          l.data['repeated_status'] == true &&
                          l.data['uid'] == '123456')
                      .toList()
                      .length;

                  var myScheduledLengh = snapshot.data.documents
                      .where((l) =>
                          l.data['scheduled_status'] == true &&
                          l.data['uid'] == '123456')
                      .toList()
                      .length;

                  return TabBarView(
                    children: [
                      MyInProgressOrders(len: inProgressLengh),
                      MyRepeatedOrders(len: myRepeatedLengh),
                      MyScheduledOrders(len: myScheduledLengh),
                    ],
                  );
                } else {
                  return SizedBox(
                  );
                }
              })),
    );
  }
}
