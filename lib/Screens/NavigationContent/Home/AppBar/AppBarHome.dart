import 'package:fluffyclientside/utlis/Exports.dart';

Widget homeAppBar(context,String address) {

  return AppBar(
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text(
                address.length < 13 ?address.toString() :address.substring(0,13).toString(),
                style: TextStyle(fontSize: 14, color: FluffyColors.BrandColor),
                textAlign: TextAlign.left,
              ),
              Text(
                'Madenati, Cairo',
                style:
                    TextStyle(fontSize: 10, color: FluffyColors.LocationColor),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Image.asset(
          'assets/fluffy_logo.png',
          width: 200,
          height: 60,
        ),
        fluffyCart(context),
      ],
    ),
  );
}
