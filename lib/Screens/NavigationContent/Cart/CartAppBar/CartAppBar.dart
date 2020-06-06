import 'package:fluffyclientside/utlis/Exports.dart';

Widget cartAppBar({title , value}) {
  return AppBar(
    elevation: 0,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    title: Text(title,style: TextStyle(fontSize: 20,color: FluffyColors.BrandColor),),
    leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
    bottom: myLinearProgressIndicator(
      backgroundColor: Colors.orange,
      value: value,
    ),
  );
}

const double _kmyLinearProgressIndicatorHeight = 6.0;

// ignore: must_be_immutable, camel_case_types
class myLinearProgressIndicator extends LinearProgressIndicator
    implements PreferredSizeWidget {
  myLinearProgressIndicator({
    Key key,
    double value,
    Color backgroundColor,
    Animation<Color> valueColor,
  }) : super(
    key: key,
    value: value,
    backgroundColor: backgroundColor,
    valueColor: valueColor,
  ) {
    preferredSize = Size(double.infinity, _kmyLinearProgressIndicatorHeight);
  }

  @override
  Size preferredSize;
}