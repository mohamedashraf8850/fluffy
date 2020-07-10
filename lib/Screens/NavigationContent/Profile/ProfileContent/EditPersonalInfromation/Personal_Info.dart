import 'package:fluffyclientside/utlis/Exports.dart';

final validCharacters = RegExp(r'^[a-zA-Z0-9]+$'); // alphanumeric only
final validPhone = RegExp(r'^[0-9]+$'); // numeric
final validMail = RegExp(r'^[a-zA-Z0-9_\-=@,\.]+$'); // alphanumeric and _-=@,.

Widget personalInfo(
  bool update, {
  nameControlller,
  phoneControlller,
  mailControlller,
  oPassControlller,
  nPassControlller,
  vnPassControlller,
  nameKey,
  phoneKey,
  mailKey,
  oPassKey,
  nPassKey,
  vnPassKey,
}) {
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
        Form(
          key: nameKey,
          child: fluffyTextField(context,
              controller: nameControlller,
              enabled: update == false?true:false,
              hintText: 'Your Name', validate: (String value) {
            if (value.length < 5) {
              return 'Name not long enough';
            } else if (validCharacters.hasMatch(value)) {
              return 'this is not username';
            }
            return null;
          }),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: phoneKey,
          child: fluffyTextField(context,
              controller: phoneControlller,
              enabled: update == false?true:false,
              hintText: 'Phone No.',
              suffix: true,
              type: TextInputType.phone, validate: (String value) {
            if (value.length < 9 || validPhone.hasMatch(value) == false) {
              print(validPhone.hasMatch(value));
              return 'this is not Phone Number';
            }
            return null;
          }),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: mailKey,
          child: fluffyTextField(context,
              controller: mailControlller,
              enabled: update == false?true:false,
              hintText: 'E-mail',
              type: TextInputType.emailAddress, validate: (String value) {
            if (value.length < 3 || validMail.hasMatch(value) == false) {
              return 'this is not E-mail';
            }
            return null;
          }),
        ),
        ExpansionTile(
          leading: Icon(
            Icons.enhanced_encryption,
            color: FluffyColors.BrandColor,
          ),
          title: Text(
            "Password details",
            textAlign: TextAlign.start,
            style: TextStyle(color: FluffyColors.BrandColor, fontSize: 15),
          ),
          children: <Widget>[
            Visibility(
              child: Form(
                key: oPassKey,
                child: fluffyTextField(context,
                    controller: oPassControlller,
                    hintText: 'Old Password',
                    type: TextInputType.visiblePassword,
                    showSW: true,
                    hidePass: obscureText,
                    showPass: _toggle, validate: (String value) {
                  if (value.length < 8) {
                    return 'minimum length of an Password is 8 characters';
                  }
                  return null;
                }),
              ),
              visible: update == true ? false : true,
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: nPassKey,
              child: fluffyTextField(context,
                  controller: nPassControlller,
                  enabled: update == false?true:false,
                  hintText: 'Password',
                  showSW: true,
                  hidePass: obscureText, validate: (String value) {
                if (value.length < 8) {
                  return 'minimum length of an Password is 8 characters';
                }
                return null;
              }, type: TextInputType.visiblePassword),
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              child: Form(
                key: vnPassKey,
                child: fluffyTextField(
                  context,
                  enabled: update == false?true:false,
                  controller: vnPassControlller,
                  hintText: update == true
                      ? 'Confirm New Password'
                      : 'Confirm Your Password',
                  showSW: true,
                  hidePass: false,
                  validate: (String value) {
                    if (value != nPassControlller.text) {
                      return 'this is not matched';
                    }
                    return null;
                  },
                  type: TextInputType.visiblePassword,
                ),
              ),
              visible: update == true ? false : true,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  });
}

Widget loginInfo({mailControlller, passController, mailKey, passKey}) {
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
        Form(
          key: mailKey,
          child: fluffyTextField(context,
              controller: mailControlller,
              hintText: 'E-mail',
              type: TextInputType.emailAddress, validate: (String value) {
            if (value.length < 3 || validMail.hasMatch(value) == false) {
              return 'this is not E-mail';
            }
            return null;
          }),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: passKey,
          child: fluffyTextField(context,
              controller: passController,
              hintText: 'Password',
              type: TextInputType.visiblePassword,
              showSW: true,
              hidePass: obscureText, validate: (String value) {
            if (value.length < 8) {
              return 'minimum length of an Password is 8 characters';
            }
            return null;
          }, showPass: _toggle),
        ),
      ],
    );
  });
}
