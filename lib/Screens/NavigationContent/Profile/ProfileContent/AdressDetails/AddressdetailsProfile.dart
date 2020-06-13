import 'package:fluffyclientside/utlis/Exports.dart';

Widget addressDetails(BuildContext context) {
  TextEditingController addressControlller = new TextEditingController();
  TextEditingController blockControlller = new TextEditingController();
  TextEditingController floorControlller = new TextEditingController();
  return Column(
    children: <Widget>[
      Text(
        'Details',
        style: TextStyle(color: FluffyColors.BrandColor, fontSize: 10),
      ),
      fluffyTextField(context,
          controller: addressControlller,
          hintText: 'Address details in Madenati, Cairo'),
      Row(
        children: <Widget>[
          fluffyTextField(context,
              controller: blockControlller, hintText: 'Block No.'),
          fluffyTextField(context,
              controller: floorControlller, hintText: 'Floor No.'),
        ],
      ),
      RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: FluffyColors.BrandColor)),
        color: FluffyColors.BrandColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Save Address',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}
