import 'package:fluffyclientside/utlis/Exports.dart';

class FourthLocationSplashScreen extends StatefulWidget {
  @override
  _FourthLocationSplashScreenState createState() =>
      _FourthLocationSplashScreenState();
}

class _FourthLocationSplashScreenState
    extends State<FourthLocationSplashScreen> {
  Position position;
  getLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/locationperlogo.png',
                  width: 300,
                  height: 300,
                ),
                Text(
                  'Allow your location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: FluffyColors.BrandColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 20),
                      child: Container(
                        height: 50,
                        child: VerticalDivider(
                          color: FluffyColors.VerticalColor,
                          width: 12,
                        ),
                        width: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  '''In order to get the best experience with fluffy,
  please allow your Location Permission.
                ''',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: FluffyColors.TextColor, fontSize: 15),
                ),
              ],
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 15,
              child: RaisedButton(
                onPressed: () {
                  if (position.longitude == null || position.latitude == null) {
                    Fluttertoast.showToast(
                      msg: "Please Turn on your GPS or Location Sensor",
                      toastLength: Toast.LENGTH_SHORT,
                      textColor: Colors.white,
                      backgroundColor: Colors.red.withOpacity(0.3),
                      gravity: ToastGravity.CENTER,
                    );
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => BasicScaffold()),
                        (Route<dynamic> route) => false);
                    print(position.latitude.toString());
                    print(position.longitude.toString());
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: FluffyColors.BrandColor)),
                color: FluffyColors.BrandColor,
                child: Text(
                  'Get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }
}
