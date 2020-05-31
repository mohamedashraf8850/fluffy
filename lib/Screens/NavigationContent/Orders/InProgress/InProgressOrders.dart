import'package:fluffyclientside/utlis/Exports.dart';
Widget myInProgressOrders(BuildContext context){
  return Container(
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
    height:MediaQuery.of(context).size.height,
    child: ListView.builder(itemBuilder: null),
  );
}
Widget orderInProgressItem(img,){
  return Row(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
     Image.network(img,width: 50,height: 50,),
    Column(
      children: <Widget>[
        //Text(title,)
      ],
    )
  ],
  );
}