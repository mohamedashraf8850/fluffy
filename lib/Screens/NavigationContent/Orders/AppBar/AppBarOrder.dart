import 'package:fluffyclientside/utlis/Exports.dart';

Widget orderAppBar() {
  return AppBar(
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("My Orders",style: TextStyle(color: FluffyColors.BrandColor,fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
        fluffyCart(),
      ],
    ),
    leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20),),
    bottom: TabBar(
      labelColor:FluffyColors.BrandColor,
      indicatorColor: FluffyColors.BrandColor,unselectedLabelColor: FluffyColors.NotSelectedColor,
      tabs: [
        Tab(text: "In Progress",),
        Tab(text: "Repeated",),
        Tab(text: "Scheduled",),
      ],
    ),
  );
}
