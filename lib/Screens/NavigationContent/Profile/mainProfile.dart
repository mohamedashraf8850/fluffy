import 'package:fluffyclientside/utlis/Exports.dart';

class MainProfilePage extends StatefulWidget {
  @override
  _MainProfilePageState createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: Container(
        child: Column(
          children: <Widget>[
            ExpansionTile(
              leading: Icon(
                Icons.location_on,
                color: FluffyColors.BrandColor,
              ),
              title: Text(
                "Address details",
                textAlign: TextAlign.start,
                style: TextStyle(color: FluffyColors.BrandColor, fontSize: 12),
              ),
              children: <Widget>[addressDetails(context)],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.account_circle,
                color: FluffyColors.BrandColor,
              ),
              title: Text(
                "Address details",
                textAlign: TextAlign.start,
                style: TextStyle(color: FluffyColors.BrandColor, fontSize: 12),
              ),
              children: <Widget>[],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.history,
                color: FluffyColors.BrandColor,
              ),
              title: Text(
                "Address details",
                textAlign: TextAlign.start,
                style: TextStyle(color: FluffyColors.BrandColor, fontSize: 12),
              ),
              children: <Widget>[],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.language,
                color: FluffyColors.BrandColor,
              ),
              title: Text(
                "Address details",
                textAlign: TextAlign.start,
                style: TextStyle(color: FluffyColors.BrandColor, fontSize: 12),
              ),
              children: <Widget>[],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.message,
                color: FluffyColors.BrandColor,
              ),
              title: Text(
                "Address details",
                textAlign: TextAlign.start,
                style: TextStyle(color: FluffyColors.BrandColor, fontSize: 12),
              ),
              children: <Widget>[],
            ),
            GestureDetector(
                child: Text(
              'Logout',
              style: TextStyle(color: FluffyColors.BrandColor, fontSize: 10),
            ))
          ],
        ),
      ),
    );
  }
}
