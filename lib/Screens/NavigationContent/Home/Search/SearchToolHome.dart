import 'package:fluffyclientside/utlis/Exports.dart';

Widget homeSearch() {
  return  Expanded(
    child: TextField(

      decoration: new InputDecoration(
        border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: new BorderSide(
                color: FluffyColors.LocationColor.withOpacity(0.3))),
        hintText: 'search your daily needs',
        suffixIcon: Icon(
          Icons.search,
          color: FluffyColors.BrandColor.withOpacity(0.3),
          size: 25,
        ),
      ),
    ),
  );
}