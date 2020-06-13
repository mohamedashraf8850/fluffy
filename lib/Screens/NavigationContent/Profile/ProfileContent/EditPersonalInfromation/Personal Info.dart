import 'package:fluffyclientside/utlis/Exports.dart';

Widget personalInfo(BuildContext context) {
  TextEditingController nameControlller = new TextEditingController();
  TextEditingController PhoneControlller = new TextEditingController();
  TextEditingController mailControlller = new TextEditingController();
  TextEditingController oPassControlller = new TextEditingController();
  TextEditingController nPassControlller = new TextEditingController();
  TextEditingController vnPassControlller = new TextEditingController();
  return Column(
    children: <Widget>[
      Text(
        'Details',
        style: TextStyle(color: FluffyColors.BrandColor, fontSize: 10),
      ),
      fluffyTextField(context,
          controller: addressControlller, hintText: 'Your Name'),
      fluffyTextField(context,
          controller: addressControlller, hintText: 'Phone No.', suffix: true),
      fluffyTextField(context,
          controller: addressControlller, hintText: 'E-mail address'),
      ExpansionTile(
        leading: Icon(
          Icons.location_on,
          color: FluffyColors.BrandColor,
        ),
        title: Text(
          "Change password",
          textAlign: TextAlign.start,
          style: TextStyle(color: FluffyColors.BrandColor, fontSize: 12),
        ),
        children: <Widget>[
          fluffyTextField(context,
              controller: oPassControlller, hintText: 'Old Password'),
          fluffyTextField(context,
              controller: oPassControlller, hintText: 'New Password'),
          fluffyTextField(context,
              controller: vnPassControlller, hintText: 'Confirm New Password'),
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
            'Apply changes',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}
