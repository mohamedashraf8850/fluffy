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
      preferredSize: Size.fromHeight(6.0),
      child: Column(
        children: <Widget>[
          Text(
            'Good Morning, \nMohamed',
            style: TextStyle(
                color: FluffyColors.BrandColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
            textAlign: TextAlign.start,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 150,
                  child: VerticalDivider(
                    color: FluffyColors.VerticalColor,
                    width: 12,
                  ),
                  width: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
