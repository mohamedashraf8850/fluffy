
import 'package:fluffyclientside/utlis/Exports.dart';
import 'package:flutter/cupertino.dart';

class CatHomePage extends StatefulWidget {
  @override
  _CatHomePageState createState() => _CatHomePageState();
}

class _CatHomePageState extends State<CatHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      backgroundColor: Colors.white,
      body: Container(
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              homeSearch(context),
              Expanded(child: catPackage()),
              Expanded(child: catList())
            ],
          ),
      ),
    );
  }
}
