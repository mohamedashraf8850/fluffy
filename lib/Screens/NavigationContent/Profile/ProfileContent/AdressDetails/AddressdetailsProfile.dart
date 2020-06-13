import 'package:fluffyclientside/utlis/Exports.dart';

Widget addressDetails(BuildContext context,
    {addressControlller, blockControlller, floorControlller}) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 10),
        child: Row(
          children: <Widget>[
            Text(
              'Details',
              style: TextStyle(color: FluffyColors.BrandColor, fontSize: 20),
            ),
          ],
        ),
      ),
      fluffyTextField(context,
          controller: addressControlller,
          hintText: 'Address details in Madenati, Cairo'),
      Padding(
        padding: const EdgeInsets.all(17.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            fluffyTextField(context,
                controller: blockControlller,
                hintText: 'Block No.',
                size: 200.0),
            fluffyTextField(context,
                controller: floorControlller,
                hintText: 'Floor No.',
                size: 200.0),
          ],
        ),
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
