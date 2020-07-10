import 'package:fluffyclientside/utlis/Exports.dart';

final validAddress =
    RegExp(r'^[a-zA-Z0-9_\-=@,\.]+$'); // alphanumeric and _-=@,.

Widget addressDetails(BuildContext context, update,
    {addressControlller,
    blockControlller,
    floorControlller,
    addressKey,
    blockKey,
    floorKey}) {
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
      Form(
        key: addressKey,
        child: fluffyTextField(context, controller: addressControlller,
            validate: (value) {
          if (validMail.hasMatch(value) == false) {
            return 'do not use any thing another alphanumeric and no spaces';
          }
          return null;
        }, hintText: 'Address details in Madenati, Cairo'),
      ),
      Padding(
        padding: const EdgeInsets.all(17.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            update == true
                ? Container()
                : Form(
                    key: blockKey,
                    child: fluffyTextField(
                      context,
                      controller: blockControlller,
                      hintText: 'Block No.',
                      size: 200.0,
                      validate: (value) {
                        if (validAddress.hasMatch(value) == false) {
                          return 'Not valid';
                        }
                        return null;
                      },
                    ),
                  ),
            update == true
                ? Container()
                : Form(
                    key: floorKey,
                    child: fluffyTextField(context,
                        controller: floorControlller,
                        hintText: 'Floor No.', validate: (value) {
                      if (validAddress.hasMatch(value) == false) {
                        return 'Not valid';
                      }
                      return null;
                    }, size: 200.0),
                  ),
          ],
        ),
      ),
    ],
  );
}
