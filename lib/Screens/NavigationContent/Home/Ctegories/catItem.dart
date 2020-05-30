import 'package:fluffyclientside/utlis/Exports.dart';

Widget catItem(txt, img) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    textDirection: TextDirection.ltr,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 1.0, left: 1.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: Image.network(
            img,
            fit: BoxFit.fill,
            width: 170,
            height: 120,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 8.0),
        child: Text(
          txt,
          style: TextStyle(fontSize: 13, color: Colors.black),
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}

Widget catList() {
  return Expanded(
    flex: 2,
    child: GridView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return catItem("Bread&Bakery $index",
            'https://www.proactiveinvestors.com/thumbs/upload/News/Image/2019_09/1200z740_1568815448_2019-09-18-10-04-08_063521780331bdf62825b7cc9d6332f8.jpg');
      },
    ),
  );
}
