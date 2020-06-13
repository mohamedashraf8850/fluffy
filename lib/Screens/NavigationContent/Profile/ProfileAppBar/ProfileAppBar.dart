import 'package:fluffyclientside/utlis/Exports.dart';
import 'package:fluffyclientside/utlis/Exports.dart';

Widget profileAppBar(BuildContext context){
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
      child: Text('Good Morning, \nMohamed',style:  TextStyle(
          color: FluffyColors.BrandColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
      textAlign: TextAlign.start,),
    ),
  );
}
