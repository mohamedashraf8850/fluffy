import 'package:fluffyclientside/utlis/Exports.dart';

Widget profileAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(130.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                child: Text(
                  'Good Morning, \nMohamed',
                  style: TextStyle(
                    color: FluffyColors.BrandColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 50,
                  child: VerticalDivider(
                    color: FluffyColors.VerticalColor,
                    width: 25,
                  ),
                  width: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
