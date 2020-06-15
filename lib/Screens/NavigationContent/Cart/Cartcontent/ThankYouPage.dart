import 'package:fluffyclientside/utlis/Exports.dart';
class ThankYouPage extends StatefulWidget {
  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage>with TickerProviderStateMixin  {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 20.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/done.png',fit: BoxFit.fill,width: 150,height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Your Order has been placed',textAlign: TextAlign.center,style: TextStyle(color:FluffyColors.BrandColor,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          Text('Your can track your order in your orders tab',textAlign: TextAlign.center,style: TextStyle(color:FluffyColors.BrandColor,fontSize: 15),),
        ],
      ),
    );
  }
}
