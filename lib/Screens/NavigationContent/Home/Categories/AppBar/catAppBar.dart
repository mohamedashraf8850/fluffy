import 'package:fluffyclientside/utlis/Exports.dart';
Widget catAppBar(){
  return AppBar(
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search,color: FluffyColors.BrandColor,size: 50,),onPressed: null,),
      fluffyCart(),
    ],
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 10),
    ),
    bottom: PreferredSize(
      child: Column(
        children: <Widget>[
          Center(child: Text('Subscribe for our Special \nbraed collections',style: TextStyle(color: FluffyColors.BrandColor),textAlign: TextAlign.center,)),
          Expanded(child: adverCatPackage_Cate()),
        ],
      ),
    ),
  );
}