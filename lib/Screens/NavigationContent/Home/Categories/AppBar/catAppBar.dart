import 'package:fluffyclientside/utlis/Exports.dart';

Widget catAppBar(context) {
  return AppBar(
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 5.0, top: 5.0),
        child: IconButton(
          icon: Icon(
            Icons.search,
            color: FluffyColors.BrandColor,
            size: 20,
          ),
          onPressed: () {},
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0, top: 5.0),
        child: fluffyCart(context),
      ),
    ],
    leading: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
