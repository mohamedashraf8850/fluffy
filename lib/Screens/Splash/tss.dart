import 'package:fluffyclientside/utlis/Exports.dart';

class ThirdSplashScreen extends StatefulWidget {
  @override
  _ThirdSplashScreenState createState() => _ThirdSplashScreenState();
}

class _ThirdSplashScreenState extends State<ThirdSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/orderSplash.png',
            width: 300,
            height: 300,
          ),
          Text(
            'Easy & Fast \n ordering',
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
            '''In Fluffy, you can subscribe to one of our special 
  collections or create your collection and get it 
  every week.
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
