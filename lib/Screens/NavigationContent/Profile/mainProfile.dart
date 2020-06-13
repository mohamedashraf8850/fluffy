import 'package:fluffyclientside/utlis/Exports.dart';

class MainProfilePage extends StatefulWidget {
  @override
  _MainProfilePageState createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {
  TextEditingController nameControlller = new TextEditingController();
  TextEditingController phoneControlller = new TextEditingController();
  TextEditingController mailControlller = new TextEditingController();
  TextEditingController oPassControlller = new TextEditingController();
  TextEditingController nPassControlller = new TextEditingController();
  TextEditingController vnPassControlller = new TextEditingController();
  TextEditingController addressControlller = new TextEditingController();
  TextEditingController blockControlller = new TextEditingController();
  TextEditingController floorControlller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      appBar: profileAppBar(context),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ExpansionTile(
                    leading: Icon(
                      Icons.location_on,
                      color: FluffyColors.BrandColor,
                    ),
                    title: Text(
                      "Address details",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: FluffyColors.BrandColor, fontSize: 20),
                    ),
                    children: <Widget>[
                      addressDetails(context,
                          addressControlller: addressControlller,
                          blockControlller: blockControlller,
                          floorControlller: floorControlller)
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: FluffyColors.BrandColor,
                    ),
                    title: Text(
                      "Personal Information",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: FluffyColors.BrandColor, fontSize: 20),
                    ),
                    children: <Widget>[
                      personalInfo(
                          mailControlller: mailControlller,
                          nameControlller: nameControlller,
                          nPassControlller: nPassControlller,
                          oPassControlller: oPassControlller,
                          phoneControlller: phoneControlller,
                          vnPassControlller: vnPassControlller)
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(
                      Icons.history,
                      color: FluffyColors.BrandColor,
                    ),
                    title: Text(
                      "Purchasing history",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: FluffyColors.BrandColor, fontSize: 20),
                    ),
                    children: <Widget>[],
                  ),
                  ExpansionTile(
                    leading: Icon(
                      Icons.language,
                      color: FluffyColors.BrandColor,
                    ),
                    title: Text(
                      "Laguage",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: FluffyColors.BrandColor, fontSize: 20),
                    ),
                    children: <Widget>[],
                  ),
                  ExpansionTile(
                    leading: Icon(
                      Icons.message,
                      color: FluffyColors.BrandColor,
                    ),
                    title: Text(
                      "Contact us",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: FluffyColors.BrandColor, fontSize: 20),
                    ),
                    children: <Widget>[],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                child: GestureDetector(
                    child: Text(
                  'Logout',
                  style:
                      TextStyle(color: FluffyColors.BrandColor, fontSize: 17),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
