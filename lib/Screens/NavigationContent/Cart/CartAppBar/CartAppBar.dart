import 'package:fluffyclientside/utlis/Exports.dart';

Widget cartAppBar(BuildContext context,router,
    {title, value, subTitle, double, subTitlePosition}) {
  return AppBar(
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(fontSize: 20, color: FluffyColors.BrandColor),
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: router
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: subTitlePosition, bottom: 8.0),
            child: Text(
              subTitle,
              style: TextStyle(
                  color: FluffyColors.BrandColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
          LinearProgressIndicator(
            backgroundColor: FluffyColors.BrandColor.withOpacity(0.3),
            valueColor:
                new AlwaysStoppedAnimation<Color>(FluffyColors.BrandColor),
            value: value,
          ),
        ],
      ),
    ),
  );
}
