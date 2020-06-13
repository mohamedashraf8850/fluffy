import 'package:fluffyclientside/utlis/Exports.dart';

Widget personalInfo(
    {nameControlller,
    phoneControlller,
    mailControlller,
    oPassControlller,
    nPassControlller,
    vnPassControlller}) {
  return StatefulBuilder(builder: (context, setState) {
    // Initially password is obscure
    bool obscureText = true;

    // Toggles the password show status
    void _toggle() {
      print(obscureText);
      setState(() {
        obscureText = !obscureText;
      });
    }

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
            controller: nameControlller, hintText: 'Your Name'),
        SizedBox(
          height: 10,
        ),
        fluffyTextField(context,
            controller: phoneControlller,
            hintText: 'Phone No.',
            suffix: true,
            type: TextInputType.phone),
        SizedBox(
          height: 10,
        ),
        fluffyTextField(context,
            controller: mailControlller,
            hintText: 'E-mail address',
            type: TextInputType.emailAddress),
        ExpansionTile(
          leading: Icon(
            Icons.location_on,
            color: FluffyColors.BrandColor,
          ),
          title: Text(
            "Change password",
            textAlign: TextAlign.start,
            style: TextStyle(color: FluffyColors.BrandColor, fontSize: 15),
          ),
          children: <Widget>[
            fluffyTextField(context,
                controller: oPassControlller,
                hintText: 'Old Password',
                type: TextInputType.visiblePassword,
                showSW: true,
                hidePass: obscureText,
                showPass: _toggle),
            SizedBox(
              height: 10,
            ),
            fluffyTextField(context,
                controller: nPassControlller,
                hintText: 'New Password',
                showSW: true,
                hidePass: obscureText,
                type: TextInputType.visiblePassword),
            SizedBox(
              height: 10,
            ),
            fluffyTextField(
              context,
              controller: vnPassControlller,
              hintText: 'Confirm New Password',
              showSW: true,
              hidePass: false,
              type: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 10,
            ),
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
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  });
}
