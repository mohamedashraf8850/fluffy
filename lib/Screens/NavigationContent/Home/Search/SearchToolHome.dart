import 'package:fluffyclientside/utlis/Exports.dart';

Widget homeSearch(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width - 30,
    child: Theme(
      data: new ThemeData(
        primaryColor: FluffyColors.BrandColor,
        primaryColorDark: FluffyColors.BrandColor,
      ),
      child: TextField(
        style: TextStyle(fontSize: 15),
        onChanged: (value) {},
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: new BorderSide(
                  color: FluffyColors.LocationColor.withOpacity(0.3))),
          hintText: 'search your daily needs',
          hintStyle: TextStyle(fontSize: 15),
          fillColor: FluffyColors.BrandColor,
          hoverColor: FluffyColors.BrandColor,
          focusColor: FluffyColors.BrandColor,
          contentPadding: const EdgeInsets.only(left: 15.0),
          suffixIcon: Icon(
            Icons.search,
            color: FluffyColors.BrandColor.withOpacity(0.3),
            size: 20,
          ),
        ),
      ),
    ),
  );
}
