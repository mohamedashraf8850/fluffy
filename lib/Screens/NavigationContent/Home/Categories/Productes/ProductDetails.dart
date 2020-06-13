import 'package:fluffyclientside/utlis/Exports.dart';

Widget ProductDetailDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Image.network('https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg', fit: BoxFit.fill),
            content: Container(
              height: 70,
              child: Column(
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Text(
                          'Gourmet Bread Roll \n with Black Olives',style: TextStyle(color:FluffyColors.BrandColor,fontSize: 15),)),
                 Divider(color: Colors.grey,),
                  Flexible(
                    flex: 5,
                    child: Text(
                      '''Lorem ipsum dolor sit amet, consectetur 
  adipiscing elit, sed do eiusmod tempor 
  incididunt ut labore et dolore magna aliqua.
  Ut enim ad minim veniam, quis nostrud
          ''',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: FluffyColors.TextColor, fontSize: 15),
                    )),
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: FluffyColors.BrandColor)),
                color: FluffyColors.BrandColor,
                child: Text(
                  'ADD TO CART',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          );
        },
      );
    },
  );
}