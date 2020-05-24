import 'package:fluffyclientside/utlis/Exports.dart';

class FirstSplashScreen extends StatefulWidget {
  @override
  _FirstSplashScreenState createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(
            'assets/fluffy_logo.png',
          ),
          Text(
            'Welcome to Fluffy',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: FluffyColors.BrandColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 150,
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
            '''Lorem ipsum dolor sit amet, consectetur 
  adipiscing elit, sed do eiusmod tempor 
  incididunt ut labore et dolore magna aliqua.
  Ut enim ad minim veniam, quis nostrud
          ''',
            textAlign: TextAlign.center,
            style: TextStyle(color: FluffyColors.TextColor, fontSize: 15),
          ),
        ],
      ),
      color: Colors.white,
    );
  }
}
